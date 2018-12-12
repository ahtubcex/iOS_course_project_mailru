//
//  ViewController.swift
//  alamofire4Omni
//
//  Created by Артем Закиров on 12.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clView: UICollectionView!
    @IBAction func rld(_ sender: Any) {
        clView.reloadData()
    }
    
   
    var itemMenuArray: [Item] = {
        var blankMenu = Item()
        blankMenu.name = "2232"
        blankMenu.imageName = "https://www.reebok.ru/dis/dw/image/v2/AAJP_PRD/on/demandware.static/-/Sites-reebok-products/default/dw7ead98ad/zoom/2232_01_standard.jpg"
        
        var blankMenu2 = Item()
        blankMenu2.name = "3912"
        blankMenu2.imageName = "https://www.reebok.ru/dis/dw/image/v2/AAJP_PRD/on/demandware.static/-/Sites-reebok-products/default/dwb7b61044/zoom/3912_01_standard.jpg"
        return [blankMenu,blankMenu2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clView.dataSource = self as! UICollectionViewDataSource
        clView.delegate = self as! UICollectionViewDelegate
        var nibname = UINib(nibName: "celll", bundle: nil)
        clView.register(nibname, forCellWithReuseIdentifier: "menuCell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGFloat {
     return 100
    }
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? Cell {
            itemCell.configure(item: itemMenuArray[indexPath.row])
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    
}
