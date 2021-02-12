//
//  ChapterDetailVC.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import SDWebImage

class ChapterDetailVC: UIViewController {
    
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var chapterNumberLbl: UILabel!
    @IBOutlet weak var chapterTitleLbl: UILabel!
    @IBOutlet weak var chapterImg: UIImageView!
    @IBOutlet weak var chapterCharactersLbl: DynamicTextView!
    
    @IBOutlet weak var summary: DynamicTextView!
    
    @IBOutlet weak var explanation: DynamicTextView!
    
    var chapter: Chapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapter = DataService.instance.chapters[DataService.instance.selectedChapter!]
        chapterNumberLbl.text = chapter?.chapterNumber
        chapterTitleLbl.text = chapter?.chapterTitle
        chapterCharactersLbl.text = chapter?.chapterCharacters
        summary.text = chapter?.chapterSummary
        explanation.text = chapter?.chapterExplanation
        navBarTitle.text = chapter?.chapterNumber
        chapterImg.sd_setImage(with: URL(string: (chapter?.chapterImg)!), placeholderImage: UIImage(named: "anonymousIcon"))
        
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
