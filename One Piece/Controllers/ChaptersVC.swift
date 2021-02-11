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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.style = .large
        spinner.isHidden = false
        spinner.startAnimating()
        
        tableView.delegate = self
        tableView.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(handleChaptersLoaded(_:)), name: NOTIF_CHAPTERS_LOADED, object: nil)
        
        if DataService.instance.chapters.count == 0 {
            DataService.instance.getChapters { (success) in
                if success {
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    NotificationCenter.default.post(name: NOTIF_CHAPTERS_LOADED, object: nil)
                    
                }
            }
        } else if DataService.instance.chapters.count < 983 {
            DataService.instance.removeChapters()
            DataService.instance.getChapters { (success) in
                if success {
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    NotificationCenter.default.post(name: NOTIF_CHAPTERS_LOADED, object: nil)
                }
            }
        } else if DataService.instance.chapters.count == 983 {
            spinner.stopAnimating()
            spinner.isHidden = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chapterDetailVC = storyboard?.instantiateViewController(identifier: "chapterDetailVC") as? ChapterDetailVC else {return}
        chapterDetailVC.modalPresentationStyle = .fullScreen
        present(chapterDetailVC, animated: true, completion: nil)
        
    }
    
    
}
