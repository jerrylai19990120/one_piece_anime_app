//
//  DataService.swift
//  One Piece
//
//  Created by Jerry Lai on 2021-02-09.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    var chapters = [Chapter]()
    
    var characters = [Character]()
    
    static let instance = DataService()
    
    func getCharacters(completion: @escaping (_ status:Bool)->()){
       
        do {
            let path = Bundle.main.path(forResource: "characters", ofType: "json")
            let url = URL(fileURLWithPath: path!)
            let jsonData = try? Data(contentsOf: url, options: .mappedIfSafe)
            let json = try? JSON(data: jsonData!).array
            
            for character in json! {
                
                let name = character["name"].stringValue
                let image = character["imageURL"].stringValue
                
                let item = Character(imageUrl: image, name: name, birthPlace: "unknown", bounty: "unknown")
                
                self.characters.append(item)
            }
            
            completion(true)
        } catch {
            completion(false)
            debugPrint(error.localizedDescription)
        }
    }
    
    func getChapters(completion: @escaping (_ status: Bool)->()){
        
        for i in 1...985 {
            AF.request("https://onepiececover.com/api/chapters/\(i)").responseJSON { (response) in
                
                guard let json = try? JSON(data: response.data!) else {
                    completion(false)
                    return
                }
                let title = json["title"].stringValue
                let chapterNum = json["chapter"].stringValue
                let summary = json["summary"].stringValue
                let explanation = json["explanation"].stringValue
                let characters = json["characters"].stringValue
                let image = json["cover_images"].stringValue
                let id = Int(json["id"].stringValue)
                    
                let chapter = Chapter(title: title, chapterNumber: chapterNum, chapterId: id!, summary: summary, explanation: explanation, characters: characters, imageURL: image)
                
                self.chapters.append(chapter)
                
                if self.chapters.count == 983 {
                    self.chapters.sort {
                        $0.chapterId! < $1.chapterId!
                    }
                    completion(true)
                }
            }
        }
        
        
    }
    
    func getChapterDetails(){
        
    }
    
    func getCharacterDetails(){
        
    }
    
    func removeChapters(){
        chapters.removeAll()
    }
    
    func removeCharacters(){
        characters.removeAll()
    }
    
}
