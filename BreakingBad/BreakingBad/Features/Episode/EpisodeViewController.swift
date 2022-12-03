//
//  ChaptersViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import UIKit

final class EpisodeViewController: UIViewController {

    @IBOutlet private weak var episodeTableView: UITableView! {
        didSet {
            episodeTableView.dataSource = self
            episodeTableView.delegate = self
            episodeTableView.register(UINib(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
            episodeTableView.estimatedRowHeight = UITableView.automaticDimension
        }
    }
    
    var allEpisodes: Episodes? {
        didSet {
            episodeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEpisodesFromService()
     
    }
    
    private func getEpisodesFromService() {
        EpisodeService.shared.getAllEpisode { episodes, error in
            if let episodes = episodes {
                self.allEpisodes = episodes
            }
            else {
                AlertManager.shared.showAlert(with: .wrongInput, localizeDescription: error?.localizedDescription,title: nil)
            }
        }
    }


}

extension EpisodeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allEpisodes?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell, let model = allEpisodes?[indexPath.row] else {
            AlertManager.shared.showAlert(with: .wrongInput, localizeDescription: nil,title: nil)
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
