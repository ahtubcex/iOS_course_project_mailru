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

class AddOrder: UIViewController {
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var orderText: UITextField!
    @IBOutlet weak var fioText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var dataPick: UIDatePicker!
    
    
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
    
    
    
}



