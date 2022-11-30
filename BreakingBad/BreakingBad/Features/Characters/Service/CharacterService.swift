//
//  CharacterService.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 27.11.2022.
//

import Foundation


final class CharacterService {
    
    static let shared = CharacterService.init()
    
    
    func getAllCharacter (completion: @escaping (Characters?, Error? ) -> Void) {
        Client.taskForGETRequest(url: Endpoints.characters.url  , responseType: Characters.self ) { (response, error) in
            if let response = response {
                completion(response,nil )
            } else {
                completion(nil,error)
            }
            
            
        }
        
    }
    
}
