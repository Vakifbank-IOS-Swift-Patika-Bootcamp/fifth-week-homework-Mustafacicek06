//
//  EpisodeTableViewCell.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 28.11.2022.
//

import UIKit

final class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var episodeAndSeasonLabel: UILabel!
    @IBOutlet private weak var episodeTitle: UILabel!
    @IBOutlet private weak var episodeDate: UILabel!
   
    
    func configureCell(model: Episode) {
        episodeAndSeasonLabel.text = "S\(model.season ?? "") E\(model.episode ?? "")"
        episodeDate.text = model.airDate
        episodeTitle.text = model.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
