//
//  CharacterCollectionViewCell.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import UIKit
import Kingfisher

final class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var characterNameLabel: UILabel!
    @IBOutlet private var birthdayLabel: UILabel!
    @IBOutlet private var characterNicknameLabel: UILabel!
    
    
    static let identifier = "CharacterCollectionViewCell"
    private var imageURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    

    public func configure(url imageURL: String , characterName: String, birthday: String, nickname: String){
        setUIAttributes()
        self.characterNameLabel.text = characterName
        self.birthdayLabel.text = "Birthday: \(birthday)"
        self.characterNicknameLabel.text = "Nickname: \(nickname)"
        self.imageURL = imageURL
        guard let url = URL(string: imageURL) else { return }
        self.imageView.kf.setImage(with: url)
    }
    private func setUIAttributes() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = CGFloat(10)
    }
    // if you using nib, recommended this
    static func nib() -> UINib {
        return UINib(nibName: CharacterCollectionViewCell.identifier, bundle: nil)
    }

}
