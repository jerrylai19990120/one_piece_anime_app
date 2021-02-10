//
//  ViewController.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func characterBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "charactersSegue", sender: nil)
    }
    
    @IBAction func ChaptersBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "chaptersSegue", sender: nil)
    }
    

}

