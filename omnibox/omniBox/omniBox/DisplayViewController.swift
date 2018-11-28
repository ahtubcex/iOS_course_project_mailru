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

class DisplayOrderViewController : UIViewController{
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var arrDateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    var order = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(order: self.order)
    }
    
    
    func configure(order: Order){
        headerLabel.text = "Информация о заказе:"
        numberLabel.text = "Номер закаказа:\(order.number)"
        fioLabel.text = "Данные: \(order.fio)"
        phoneLabel.text = "Номер телефона: \(order.phone_number)"
        arrDateLabel.text = "От \(order.arr_date)"
        dateToLabel.text = "Выдать до \(order.date_to)"
        itemsLabel.text = "Товары: "
    }
    
}
