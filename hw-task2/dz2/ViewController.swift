//
//  Cell_Img.swift
//  dz2
//
//  Created by Ибрагим Мамадаев on 07.10.2018.
//  Copyright © 2018 Ибрагим Мамадаев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    private let refresh = UIRefreshControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh_settings()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        let nib = UINib(nibName: "MyCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "cell_dz")
    }
    
    
    
    func refresh_settings() {
        if #available(iOS 10.0, *) {
            table.refreshControl = refresh
        } else {
            table.addSubview(refresh)
        }
        
        refresh.addTarget(self, action: #selector(refreshStop(_:)), for: .valueChanged)
    }
    
    
    
    @objc private func refreshStop(_ sender: Any) {
        stop_refresh()
    }
    
    
    
    func stop_refresh() {
        refresh.endRefreshing()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier = "go_fromcell"
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath.row + 1) % 3 != 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_dz", for: indexPath) as! MyCell
            //cell.label?.text = "ww"
            cell.img?.image = UIImage(named: "myLittlePony")
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "my_cell2", for: indexPath)
            cell.textLabel?.text = "здесь могла быть ваша реклама"
            //cell.imageView?.image = UIImage(named: "mainMenu")
            return cell
        }
        //return cell
    }


}


