//
//  CharacterDetailService.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 27.11.2022.
//

import Foundation


class CharacterDetailService {
    static let shared = CharacterDetailService.init()
    
    
    func getCharacterQuotes(by id: Int,completion: @escaping (Quotes?, Error? ) -> Void) {
        Client.taskForGETRequest(url: Endpoints.quotes(id).url  , responseType: Quotes.self ) { (response, error) in
            
            if let response = response {
                completion(response,nil )
            } else {
                completion(nil,error)
            }
            
            
        }
        
    }
    
}
