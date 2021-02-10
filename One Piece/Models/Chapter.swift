//
//  Chapter.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-10.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation

class Chapter: NSCoder {
    
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
    
    func encodeWithCoder(coder: NSCoder) {
        
        if let chapterTitle = chapterTitle { coder.encode(chapterTitle, forKey: "chapterTitle") }
        
        if let chapterNumber = chapterNumber { coder.encode(chapterNumber, forKey: "chapterNumber") }
        if let chapterId = chapterId { coder.encode(chapterId, forKey: "chapterId") }
        if let chapterImg = chapterImg { coder.encode(chapterImg, forKey: "chapterImg") }
        if let chapterSummary = chapterSummary { coder.encode(chapterSummary, forKey: "chapterSummary") }
        if let chapterExplanation = chapterExplanation { coder.encode(chapterExplanation, forKey: "chapterExplanation") }
        if let chapterCharacters = chapterCharacters { coder.encode(chapterCharacters, forKey: "chapterCharacters") }
    }
    
}
