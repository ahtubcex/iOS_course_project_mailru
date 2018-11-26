//
//  Order.swift
//  omniBox
//
//  Created by Артем Закиров on 26.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import RealmSwift

class Order: Object {
    @objc dynamic var number : String = ""
    @objc dynamic var fio : String = ""
    @objc dynamic var phone_number : String = ""
    @objc dynamic var arr_date : String = ""
    @objc dynamic var date_to : String = ""
    @objc dynamic var items : Item?
    @objc dynamic var is_sold : Bool = false
    
    func addOrder (number: String,fio: String, phone_number: String, arr_date: String, items: Item?, is_sold: Bool ){
        
    }
}
