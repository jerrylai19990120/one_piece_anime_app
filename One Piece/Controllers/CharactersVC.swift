//
//  CharactersVC.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import SDWebImage

class CharactersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var charactersArray = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}

extension CharactersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterCell else {return UITableViewCell()}
        
        let character = charactersArray[indexPath.row]
        
        cell.configureCell(character: character)
        
        let url = URL(string: character.profileImg!)
        
        cell.characterImg.sd_setImage(with: url, placeholderImage: UIImage(named: "anonymousIcon"), completed: nil)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}
