//
//  UserCreate.swift
//  omniBox
//
//  Created by Артем Закиров on 26.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserCreate : UIViewController{
    
    @IBAction func createButton(_ sender: Any) {
        addUser()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    func addUser(){
        let realm = try! Realm()
        print("userTable path:\n \(String(describing: realm.configuration.fileURL))")
        let newUser = User()
        newUser.user_id = loginField.text!
        newUser.password = passwordField.text!
        newUser.isAdmin = false
    
        try! realm.write {
            realm.add(newUser)
        }
    }
}
