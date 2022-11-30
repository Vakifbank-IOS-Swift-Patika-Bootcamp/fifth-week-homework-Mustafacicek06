//
//  Episode.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 28.11.2022.
//

import Foundation

struct Episode: Decodable {
    let episodeID: Int?
    let title: String?
    let season, episode: String?
    let airDate: String?
    let characters: [String]?

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season, episode
        case airDate = "air_date"
        case characters
    }
}

typealias Episodes = [Episode]
