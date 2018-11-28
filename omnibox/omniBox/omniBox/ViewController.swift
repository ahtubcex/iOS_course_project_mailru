//
//  ViewController.swift
//  omniBox
//
//  Created by Артем Закиров on 22.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var user = User()
    var orders = [Order]()
    let cellName = "orderCell"
    let seguename = "toOrder"
    
    lazy var refresh : UIRefreshControl = {  //сделал для обновления данных после добавления
        var refresh = UIRefreshControl()
           refresh.addTarget(self, action: #selector(ViewController.refreshData(_:)), for: .valueChanged)
        refresh.tintColor = UIColor.red
        return refresh
    }()
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm.configuration.fileURL!)
        print("user is \(user.user_id)")
        getOrders()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        self.tableView.addSubview(refresh)
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc private func refreshData(_ refreshControl: UIRefreshControl){
        getOrders()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !(user.isAdmin){
            self.navigationItem.rightBarButtonItems = []
        }
//        self.tableView.reloadData()
    }

    func getOrders(){
        let zakazy = realm.objects(Order.self)
        orders = Array(zakazy)
        print(orders.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? OrderCell else
        {
            return UITableViewCell()
        }
        cell.configureView(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == seguename{
            guard
                let vc = segue.destination as? DisplayOrderViewController,
                let item = sender as? Order
                else{
                    return
            }
            vc.order = item
        }
    }

    
}

