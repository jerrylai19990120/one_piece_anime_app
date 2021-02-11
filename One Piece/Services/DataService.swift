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
    
    var selectedChapter: Int?
    
    func getCharacters(completion: @escaping (_ status:Bool)->()){
       
        do {
            let path = Bundle.main.path(forResource: "characters", ofType: "json")
            let url = URL(fileURLWithPath: path!)
            let jsonData = try? Data(contentsOf: url, options: .mappedIfSafe)
            let json = try? JSON(data: jsonData!).array
            
            for character in json! {
                
                let name = character["name"].stringValue
                let image = character["imageURL"].stringValue
                
                let item = Character(imageUrl: image, name: name, height: "unknown", bounty: "unknown")
                
                self.characters.append(item)
            }
            
            let pathBounty = Bundle.main.path(forResource: "bounties", ofType: "json")
            let urlBounty = URL(fileURLWithPath: pathBounty!)
            let jsonBountyData = try? Data(contentsOf: urlBounty, options: .mappedIfSafe)
            let jsonBounties = try? JSON(data: jsonBountyData!).array
            
            for bounty in jsonBounties! {
                let name = bounty["name"].stringValue
                let amount = bounty["bounty"].stringValue
                
                for ch in self.characters {
                    if let range = ch.name!.range(of: name, options: .caseInsensitive){
                        ch.setBounty(bounty: "฿\(amount)")
                        break
                    }
                }
                
            }
            
            let pathHeight = Bundle.main.path(forResource: "heights", ofType: "json")
            let urlHeight = URL(fileURLWithPath: pathHeight!)
            let jsonDataHeight = try? Data(contentsOf: urlHeight, options: .mappedIfSafe)
            let jsonHeights = try? JSON(data: jsonDataHeight!).array
            
            for height in jsonHeights! {
                let name = height["name"].stringValue
                let heightInMeters = height["height"].stringValue
                
                for ch in self.characters {
                    if let range = ch.name?.range(of: name, options: .caseInsensitive){
                        ch.setHeight(height: "\(heightInMeters) meters")
                        break
                    }
                }
            }
            
            completion(true)
        } catch {
            completion(false)
            debugPrint(error.localizedDescription)
        }
    }
    
    func getChapters(completion: @escaping (_ status: Bool)->()){
        
        for i in 1...10 {
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
                
                if self.chapters.count == 10 {
                    self.chapters.sort {
                        $0.chapterId! < $1.chapterId!
                    }
                    completion(true)
                }
            }
        }
        
        
    }
    
    
    func getCharacterDetails(){
        
    }
    
    func removeChapters(){
        chapters.removeAll()
    }
    
    func removeCharacters(){
        characters.removeAll()
    }
    
    func selectChapter(number: Int){
        self.selectedChapter = number
    }
    
}
