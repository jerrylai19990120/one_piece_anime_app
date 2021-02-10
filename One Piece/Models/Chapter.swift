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
    var chapterSummary: String?
    var chapterExplanation: String?
    var chapterCharacters: String?
    
    init(title: String, chapterNumber: String, chapterId: String, summary: String, explanation: String, characters: String, imageURL: String) {
        self.chapterTitle = title
        self.chapterNumber = chapterNumber
        self.chapterId = chapterId
        self.chapterCharacters = characters
        self.chapterExplanation = explanation
        self.chapterSummary = summary
        self.chapterImg = imageURL
    }
    
}
