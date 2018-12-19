//
//  MainViewController.swift
//  omniBox
//
//  Created by Артем Закиров on 19.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        myView.backgroundColor = UIColor.black
        myImage.image = UIImage(named: "main_black")
    }
}
