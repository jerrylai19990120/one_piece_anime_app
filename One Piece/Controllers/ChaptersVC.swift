//
//  ChaptersVC.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import  SDWebImage

class ChaptersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var chaptersArray = [Chapter]()
    
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

extension ChaptersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chaptersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as? ChapterCell else {return UITableViewCell()}
        cell.configureCell(chapter: chaptersArray[indexPath.row])
        
        let url = URL(string: chaptersArray[indexPath.row].chapterImg!)
        
        cell.chapterImg.sd_setImage(with: url, placeholderImage: UIImage(named: "anonymousIcon"), completed: nil)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
