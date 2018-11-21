//
//  AnimeCell.swift
//  TableView+Network
//
//  Created by Артем Закиров on 12.11.2018.
//  Copyright © 2018 Artem Zakirov. All rights reserved.
//

import UIKit

class AnimeCell : UITableViewCell{
    
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seldImage: UIImageView!
    
    func configureView(anime: Post, image: UIImage){
        nameLabel.text = anime.name
        episodesLabel.text = "Тип: " + anime.type
        seldImage.image = image
       
    
    }
}
