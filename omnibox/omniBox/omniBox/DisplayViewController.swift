//
//  DisplayViewController.swift
//  omniBox
//
//  Created by Артем Закиров on 28.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DisplayOrderViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tapMe: UIView!
    

    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var orderTable: UITableView!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var arrDateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    let cellName = "itemCell"
    var order = Order()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(order: self.order)
        orderTable.dataSource = self
        orderTable.delegate = self
        orderTable.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
//        orderTable.isHidden = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideTable))
//        tapGesture.numberOfTapsRequired = 1
//        tapMe.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideTable(){
        orderTable.isHidden = !(orderTable.isHidden)
    }
    
    func configure(order: Order){
        headerLabel.text = "Информация о заказе:"
        numberLabel.text = "Номер закаказа:\(order.number)"
        fioLabel.text = "Данные: \(order.fio)"
        phoneLabel.text = "Номер телефона: \(order.phone_number)"
        arrDateLabel.text = "От \(order.arr_date)"
        dateToLabel.text = "Выдать до \(order.date_to)"
        itemsLabel.text = "Товары: "
        statusLabel.text = "Статус обзвона и комментарий"
        statusSwitch.isOn = order.call_status
        commentField.text = order.comments
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if order.items.count == 0{
            return 0
        }else{
            return order.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? ItemCell else
        {
            return UITableViewCell()
        }
        cell.configureView(item: order.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func statusChanged(_ sender: Any) {
        try! realm.write {
            order.call_status = statusSwitch.isOn
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (commentField.text != order.comments) {
            try! realm.write {
                order.comments = commentField.text!
            }
        }
    }
    
}
