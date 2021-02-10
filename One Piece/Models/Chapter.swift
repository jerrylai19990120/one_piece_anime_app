//
//  Chapter.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation

class Chapter {
    
    var chapterTitle: String?
    var chapterNumber: String?
    var chapterId: String?
    var chapterImg: String?
    
    init(title: String, chapterNumber: String, chapterId: String) {
        self.chapterTitle = title
        self.chapterNumber = chapterNumber
        self.chapterId = chapterId
    }
    
}
