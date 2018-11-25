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
        print(orderText.text)
        print(fioText.text)
        print(phoneText.text)
        print(dataPick.date)
    }
    
}
