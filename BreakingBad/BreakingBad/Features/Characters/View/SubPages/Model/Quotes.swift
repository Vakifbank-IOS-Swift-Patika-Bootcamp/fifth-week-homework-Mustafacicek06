//
//  Quotes.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 27.11.2022.
//

import Foundation


struct Quote: Codable {
    let quoteID: Int?
    let quote: String?
    let author: String?
    
    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author
        
    }
}

typealias Quotes = [Quote]
