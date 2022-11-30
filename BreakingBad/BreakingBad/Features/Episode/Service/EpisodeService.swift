//
//  EpisodeService.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 28.11.2022.
//

import Foundation

final class EpisodeService {
    static let shared = EpisodeService.init()
    
    func getAllEpisode(completion: @escaping (Episodes?,Error?)-> Void) {
        Client.taskForGETRequest(url: Endpoints.episodes.url, responseType: Episodes.self) { (response, error) in
            if let response = response {
                completion(response, nil)
            }
            else {
                completion(nil, error)
            }
        }
    }
}
