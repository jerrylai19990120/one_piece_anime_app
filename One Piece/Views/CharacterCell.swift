//
//  CharacterCell.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(character: Character){
        
        characterName.text = character.name
        bountyLabel.text = character.bounty
        birthPlaceLabel.text = character.birthPlace
        
    }
    

}
