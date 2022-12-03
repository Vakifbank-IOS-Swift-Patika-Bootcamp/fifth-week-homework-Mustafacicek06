//
//  AddNotesViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 3.12.2022.
//

import UIKit

final class AddNotesViewController: UIViewController {
    
    
    @IBOutlet private weak var pageTitleLabel: UILabel!
    @IBOutlet private weak var seasonLabel: UITextField!
    @IBOutlet private weak var episodeLabel: UITextField!
    @IBOutlet private weak var episodeTitleLabel: UITextField!
    @IBOutlet private weak var yourNoteLabel: UITextField!
    
    var episodeNote: EpisodeNote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEditingNote()
      
    }
    
    func configureEditingNote() {
        guard let editNote = episodeNote else { return }
        pageTitleLabel.text = "Edit Note"
        seasonLabel.text = "\(editNote.season)"
        episodeLabel.text = "\(editNote.episode)"
        episodeTitleLabel.text = editNote.episodeTitle
        yourNoteLabel.text = "\(editNote.note)"
        
    }
    
    @IBAction func saveNoteButtonClicked(_ sender: Any) {
                validateAllFields()

    }
    
    private func updateOrAddScreenControl() {
        if episodeNote != nil {
            CoreDataManager.shared.updateEpisode(selectedEpisode: episodeNote!, season: seasonLabel.text!, episodeNumber: episodeLabel.text!, episodeTitle: episodeTitleLabel.text! , note: yourNoteLabel.text! )
            AlertManager.shared.showAlert(with: .success, localizeDescription: nil,title: "Success")
        }
        else {
            CoreDataManager.shared.saveEpisode(episode: Int8(episodeLabel.text ?? "0") ?? 0, season: Int8(seasonLabel.text ?? "0") ?? 0, episodeTitle: episodeTitleLabel.text! , note: Int8(yourNoteLabel.text ?? "0") ?? 0)
            AlertManager.shared.showAlert(with: .success, localizeDescription: nil,title: "Success")
        }
    }
    
    @objc func delayedAction() {
        self.dismiss(animated: true, completion: nil)
    }
    func validateAllFields()  {
        var error: String?
        if( seasonLabel.text == "") { error = "Please enter Season" }
        if( episodeLabel.text == ""){ error = "Please enter Episode" }
        if( episodeTitleLabel.text == "") {
            error = "Please enter Episode title."
        }
        if( yourNoteLabel.text == "") { error = "Please enter Your Note." }
        
        
        if  error != nil {
            AlertManager.shared.showAlert(with: nil, localizeDescription: error,title: nil)
            return
        }
        updateOrAddScreenControl()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
    }
  

}

