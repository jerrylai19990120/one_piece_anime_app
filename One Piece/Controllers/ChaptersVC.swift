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
    
    var limit = 20
    var totalEntries = 985
    var chaptersArray = [Chapter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.removeChapters()
        tableView.delegate = self
        tableView.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(handleChaptersLoaded(_:)), name: NOTIF_CHAPTERS_LOADED, object: nil)

        DataService.instance.getChapters { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc
    func handleChaptersLoaded(_ notif: Notification){
        tableView.reloadData()
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension ChaptersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.chapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as? ChapterCell else {return UITableViewCell()}
        cell.configureCell(chapter: DataService.instance.chapters[indexPath.row])
        
        let url = URL(string: DataService.instance.chapters[indexPath.row].chapterImg!)
        
        cell.chapterImg.sd_setImage(with: url, placeholderImage: UIImage(named: "anonymousIcon"), completed: nil)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}
