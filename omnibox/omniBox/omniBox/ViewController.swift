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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(realm.configuration.fileURL)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

