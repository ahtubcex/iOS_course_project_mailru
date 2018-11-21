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
    let type : String
    let caliber : String
    let rate_of_fire : String
    let description : String
//    let image : UIImage
    
}


extension Post {
    
    init?(dict: NSDictionary) {
        guard
            let name = dict["name"] as? String,
            let type = dict["type"] as? String,
            let caliber = dict["caliber"] as? String,
            let rate_of_fire = dict["rate_of_fire"] as? String,
            let description = dict["description"] as? String
            else { return nil }
        
        self.name = name
        self.type = type
        self.caliber = caliber
        self.rate_of_fire = rate_of_fire
        self.description = description
    }
    
    
}



