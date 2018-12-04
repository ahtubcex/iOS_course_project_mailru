//
//  ViewController.swift
//  omniBox
//
//  Created by Артем Закиров on 22.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import RealmSwift
import FirebaseDatabase


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func switchedAction(_ sender: Any) {
        
    }
    
    
    @IBOutlet weak var oldLabel: UILabel!
    @IBOutlet weak var oldSwitch: UISwitch!

    
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
        self.oldSwitch.setOn(false, animated: true)
        oldLabel.text = "Выкупленные заказы"
        self.oldSwitch.addTarget(self, action: #selector(changing(switch:)), for: .valueChanged)
        
        workFire()
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

    func getAllOrders(){
        let zakazy = realm.objects(Order.self)
        orders = Array(zakazy)
//        print(orders.count)
    }
    
    func getOrders(){
        let zakazy = realm.objects(Order.self).filter("is_sold == false")
        orders = Array(zakazy)
//        print(orders.count)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = orders[indexPath.row]
        performSegue(withIdentifier: seguename, sender: item)
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

     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let row = indexPath.row
        let editingRow = orders[row]

        let deleteAction = UITableViewRowAction(style: .normal , title: "Выкуплен") { _,_ in
            try! self.realm.write {
            self.orders[row].is_sold = !(self.orders[row].is_sold)
                self.oldSwitch.setOn(false, animated: true)
                DispatchQueue.main.async {
                    self.getOrders()
                    tableView.reloadData()
                }
            }

        }
        return [deleteAction]
    }
    
    @objc func changing(switch : UISwitch){
        if self.oldSwitch.isOn {
            DispatchQueue.main.async {
                self.getAllOrders()
                self.tableView.reloadData()
            }
        }else{
            DispatchQueue.main.async {
                self.getOrders()
                
                self.tableView.reloadData()
            }
        }
    }
    
    func workFire()
    {
        let databaseref = Database.database().reference()
        databaseref.child("users").observeSingleEvent(of: .value, with: {
            snapshot in
            print(snapshot)
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
                var name = dictionary["Name"] as? String
                var age = dictionary["Age"] as? Int
                print(name, age)
                
                var UserToAdd = UserFire()
                UserToAdd.name = name
                UserToAdd.age.value = age
                UserToAdd.writeToRealm()
            }
        })
    }
    
}

