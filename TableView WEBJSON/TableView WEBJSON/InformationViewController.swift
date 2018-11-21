//
//  InformationViewController.swift
//  TableView+Network
//
//  Created by Артем Закиров on 12.11.2018.
//  Copyright © 2018 Artem Zakirov. All rights reserved.
//

import Foundation
import UIKit

class InformationViewController : UIViewController {
    var myspecialImage = UIImage()
    var anime: Post!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var episodesLengthLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func setupUI(specialImage : UIImage){
        nameLabel.text = "Название:"+anime.name
        genreLabel.text = "Жанр:"+anime.genre
        episodesLabel.text = "Количество эпизодов:"+anime.episodes
        episodesLengthLabel.text = "Продолжительность:"+anime.episodes_length
        descLabel.text = anime.description
        image.image = specialImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(specialImage: self.myspecialImage)
    }
}
