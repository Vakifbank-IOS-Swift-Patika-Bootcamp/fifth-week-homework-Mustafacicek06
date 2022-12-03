//
//  NotesViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 30.11.2022.
//

import UIKit

final class NotesViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var notesTableView: UITableView! {
       
            didSet {
                notesTableView.dataSource = self
                notesTableView.delegate = self
                notesTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
                notesTableView.estimatedRowHeight = UITableView.automaticDimension
                
            }
        
    }
    
    // MARK: Variables
    var episodeNotes: [EpisodeNote] = []
    
    
    // MARK: Overrides functions
    override func viewDidLoad() {
        super.viewDidLoad()

        delegateSetup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDatasFromDB()
        notesTableView.reloadData()
    }
    
    
    // MARK: Private functions
    private func delegateSetup() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    private func getDatasFromDB() {
        episodeNotes = CoreDataManager.shared.getEpisodes()
    }
    
    // MARK: Objc actions
    
 
    @IBAction func addNoteButtonClicked(_ sender: Any) {
        guard let addNoteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNotesViewController") as? AddNotesViewController else { return }
        present(addNoteVC, animated: true)
    }
    

}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodeNotes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let updateNoteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNotesViewController") as? AddNotesViewController else {
            return
        }
        updateNoteVC.episodeNote = episodeNotes[indexPath.row]
        present(updateNoteVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let deletingID = episodeNotes[indexPath.row].id else { return }
            CoreDataManager.shared.deleteEpisode(deleteItemID: deletingID)
            episodeNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell",for: indexPath) as? NoteTableViewCell, let episodeModel: EpisodeNote? = episodeNotes[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(episode:  episodeModel ?? EpisodeNote())
        
        return cell
    }
    
    
}
