//
//  CharacterDetailViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 27.11.2022.
//

import UIKit
import Kingfisher

final class CharacterDetailViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var characterName: UILabel!
    @IBOutlet private weak var nickName: UILabel!
    @IBOutlet private weak var birthday: UILabel!
  
    
    // MARK: Variables
    var selectedCharacter: CharacterElement?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    // MARK: Private Functions
    
    
    
    @IBAction func goToQuotesOnPressed(_ sender: Any) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: QuotesViewController.self)) as? QuotesViewController else { return }
        detailVC.selectedCharacterID = selectedCharacter?.charID
                 self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    private func configure() {
        guard let url = URL(string: selectedCharacter?.img ?? "") else { return }
        self.imageView.kf.setImage(with:  url)
        characterName.text = selectedCharacter?.name
        nickName.text = selectedCharacter?.nickname
        birthday.text = selectedCharacter?.birthday
        self.navigationItem.title = selectedCharacter?.name
    }
    
   

}


