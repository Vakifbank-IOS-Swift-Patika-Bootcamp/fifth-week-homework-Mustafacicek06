//
//  NoteTableViewCell.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 30.11.2022.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {

    @IBOutlet private weak var episodeAndSeasonTitle: UILabel!
    
    @IBOutlet private weak var episodeTitle: UILabel!
    
    @IBOutlet private weak var episodeNote: UILabel!
    
    func configureCell(episode: EpisodeNote) {
        episodeAndSeasonTitle.text = "Season: \(episode.season) Episode: \(episode.episode)"
        episodeTitle.text = "Episode Title: \(episode.episodeTitle ?? "")"
        episodeNote.text = "\(episode.note)"
    }
}
