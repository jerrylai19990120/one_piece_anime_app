//
//  CharacterDetailVC.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterDetailVC: UIViewController {
    
    
    @IBOutlet weak var navBarName: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var characterHeight: UILabel!
    
    @IBOutlet weak var characterBounty: UILabel!
    @IBOutlet weak var descriptionField: DynamicTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        var character = DataService.instance.characters[DataService.instance.selectedCharacter!]
        
        navBarName.text = character.name
        characterName.text = character.name
        characterHeight.text = character.height
        characterBounty.text = character.bounty
        descriptionField.text = character.summary
        let url = URL(string: character.profileImg!)
        characterImg.sd_setImage(with: url, placeholderImage: UIImage(named: "anonymousIcon"))
    }
    

   
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
