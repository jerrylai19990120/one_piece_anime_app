//
//  Chapter.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation

class Chapter: Codable {
    
    var chapterTitle: String?
    var chapterNumber: String?
    var chapterId: Int?
    var chapterImg: String?
    var chapterSummary: String?
    var chapterExplanation: String?
    var chapterCharacters: String?
    
    init(title: String, chapterNumber: String, chapterId: Int, summary: String, explanation: String, characters: String, imageURL: String) {
        self.chapterTitle = title
        self.chapterNumber = chapterNumber
        self.chapterId = chapterId
        self.chapterCharacters = characters
        self.chapterExplanation = explanation
        self.chapterSummary = summary
        self.chapterImg = imageURL
    }
    
    
}
