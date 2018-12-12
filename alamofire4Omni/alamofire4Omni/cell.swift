//
//  cell.swift
//  alamofire4Omni
//
//  Created by Артем Закиров on 12.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class Cell : UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var labeView: UILabel!
    func configure(item : Item){
        labeView.text = item.name
        let url = URL(string: item.imageName!)
        Alamofire.request(url!).responseImage { (response) in
            if response.error == nil {
                print(response.result)
                // Show the downloaded image:
                if let data = response.result.value {
                    self.imageView.image = data
                    }
            }
        }
}


}
