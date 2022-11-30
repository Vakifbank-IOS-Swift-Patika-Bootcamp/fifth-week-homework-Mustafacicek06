//
//  ViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import UIKit

final class CharactersViewController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    
    private var allCharacters: Characters?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCharacters()
        setComponentsLayout()
        delegatesInit()
        componentsRegister()
      
    }
    
    // MARK: Private functions
    
    private func setComponentsLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 200)
     
        collectionView.collectionViewLayout = layout
    }
    
    private func getAllCharacters() {
        CharacterService.shared.getAllCharacter { characters, error in
            if let characters = characters {
                self.allCharacters = characters
                self.collectionView.reloadData()
            }
            else {
                print("error")
            }
        }
    }
    
    private func delegatesInit() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func componentsRegister() {
        collectionView.register(CharacterCollectionViewCell.nib() , forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
    }
   
   

}

extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: CharacterDetailViewController.self)) as? CharacterDetailViewController else { return }
        detailVC.selectedCharacter = allCharacters?[indexPath.row]
                 self.navigationController?.pushViewController(detailVC, animated: true)
        }
}

extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as! CharacterCollectionViewCell
        cell.configure(url: allCharacters?[indexPath.row].img ?? "" , characterName:  (allCharacters?[indexPath.row].name) ?? "mami", birthday:  (allCharacters?[indexPath.row].birthday ?? ""), nickname:  allCharacters?[indexPath.row].nickname ?? "musti")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCharacters?.count ?? 0
    }
   

}

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
}

