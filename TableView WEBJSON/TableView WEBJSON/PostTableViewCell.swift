//
//  PostTableViewCell.swift
//  TableView+Network
//
//  Created by Artem on 25/10/2018.
//  Copyright © 2018 Artem Zakirov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImageView.layer.cornerRadius = postImageView.frame.height / 2
        postImageView.layer.masksToBounds = true
        postImageView.layer.borderColor = UIColor.lightGray.cgColor
        postImageView.layer.borderWidth = 1.5
    }


}
