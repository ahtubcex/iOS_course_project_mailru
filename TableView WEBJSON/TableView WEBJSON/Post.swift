//
//  Post.swift
//  Network
//
//  Created by Artem on 04/10/2018.
//  Copyright © 2018 Artem Zakirov. All rights reserved.
//

import Foundation


struct Post {
    
    let name : String
    let genre : String
    let episodes : String
    let episodes_length : String
    let description : String
//    let image : UIImage
    
}


extension Post {
    
    init?(dict: NSDictionary) {
        guard
            let name = dict["name"] as? String,
            let genre = dict["type"] as? String,
            let episodes = dict["episodes"] as? String,
            let episodes_length = dict["episode_length"] as? String,
            let description = dict["description"] as? String
            else { return nil }
        
        self.name = name
        self.genre = genre
        self.episodes = episodes
        self.episodes_length = episodes_length
        self.description = description
    }
    
    
}



