//
//  AddOrder.swift
//  omniBox
//
//  Created by Артем Закиров on 26.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AddOrder: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var orderText: UITextField!
    @IBOutlet weak var fioText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var dataPick: UIDatePicker!

    var items = [Item]()
    @IBOutlet weak var tovarTable: UITableView!
    let cellName = "itemCell"
    @IBAction func addTovarButtob(_ sender: Any) {
        callAddAlert()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        addOrder()
        self.dismiss(animated: true, completion: nil)
    }

    func addOrder(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let today = dateFormatter.string(from: dataPick.date)
        let realm = try! Realm()
        let new_order = Order()
        new_order.number = self.orderText.text!
        new_order.fio = self.fioText.text!
        new_order.phone_number = self.phoneText.text!
        new_order.arr_date = today
        new_order.date_to = splitDate(st: today)
        new_order.items.append(objectsIn: items) 
        print(new_order)
        
        try! realm.write {
            realm.add(new_order)
        }
    }
    
    func splitDate(st : String) -> String{     //adding 5 days
        var date_to = st.components(separatedBy: "-")[0]
        date_to = String(Int(date_to)!+5)+"-"+st.components(separatedBy: "-")[1]+"-"+st.components(separatedBy: "-")[2]
        return date_to
    }
    
    func callAddAlert(){
        let alertView = UIAlertController(title: "Добавление заказов", message: nil, preferredStyle: .alert)
        let add = UIAlertAction(title: "Добавить", style: .default) { (action) in
            let addItem = Item()
            addItem.item_name = alertView.textFields![0].text!
            addItem.size = alertView.textFields![1].text!
            self.items.append(addItem)
            DispatchQueue.main.async {
                self.tovarTable.reloadData()
            }
//            alertView.textFields![0].text
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        alertView.addAction(add)
        alertView.addAction(cancel)
        alertView.addTextField { (textfield) in
            textfield.placeholder = "Артикул"
        }
        alertView.addTextField { (textfield) in
            textfield.placeholder = "Размер"
        }
        self.present(alertView, animated: true, completion: {
            print("Alert worked")
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count == 0 {
            return 0
        }else{
          return items.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? ItemCell else
        {
            return UITableViewCell()
        }
        cell.configureView(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        tovarTable.dataSource = self
        tovarTable.delegate = self
        tovarTable.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
}



