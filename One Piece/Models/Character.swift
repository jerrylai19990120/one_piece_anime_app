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
    var birthPlace: String?
    var bounty: String?
    var profileImg: String?
    
    init(imageUrl: String, name: String, birthPlace: String, bounty: String) {
        self.name = name
        self.birthPlace = birthPlace
        self.bounty = bounty
        self.profileImg = imageUrl
    }
    
    func setBounty(bounty: String){
        self.bounty = bounty
    }
    
}
