//
//  ChapterCell.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

class ChapterCell: UITableViewCell {
    
    
    @IBOutlet weak var chapterImg: UIImageView!
    @IBOutlet weak var chapterNumber: UILabel!
    @IBOutlet weak var chapterTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(chapter: Chapter){
        chapterNumber.text = chapter.chapterNumber
        chapterTitle.text = chapter.chapterTitle
    }

}
