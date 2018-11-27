//
//  ViewController.swift
//  omniBox
//
//  Created by Артем Закиров on 22.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {
    let realm = try! Realm()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm.configuration.fileURL)
        print("user is \(user.user_id)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !(user.isAdmin){
            self.navigationItem.rightBarButtonItems = []
        }
//        self.navigationController?.isNavigationBarHidden = true
    }

}

