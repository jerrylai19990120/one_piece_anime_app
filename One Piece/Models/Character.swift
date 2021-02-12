//
//  Character.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import UIKit


class Character {
    
    var name: String?
    var height: String?
    var bounty: String?
    var profileImg: String?
    var summary = "No description yet..."
    
    init(imageUrl: String, name: String, height: String, bounty: String) {
        self.name = name
        self.height = height
        self.bounty = bounty
        self.profileImg = imageUrl
    }
    
    func setBounty(bounty: String){
        self.bounty = bounty
    }
    
    func setHeight(height: String){
        self.height = height
    }
    
    func setSummary(desc: String){
        self.summary = desc
    }
    
}
