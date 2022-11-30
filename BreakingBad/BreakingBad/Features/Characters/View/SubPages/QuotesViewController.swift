//
//  QuotesViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 28.11.2022.
//

import UIKit

final class QuotesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    
    var allQuotes: Quotes?
    var selectedCharacterID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegates()
        getAllQuotesByID()
        self.navigationItem.title = "Quotes"
        
    }
    // MARK: Private functions
    
    private func initDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func getAllQuotesByID() {
        CharacterDetailService.shared.getCharacterQuotes(by: selectedCharacterID ?? 0) { [weak self] quotes, error in
            if let quotes = quotes {
                self?.allQuotes = quotes
                self?.tableView.reloadData()
                print(quotes)
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
   

}


extension QuotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allQuotes?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
extension QuotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
          if (cell == nil) {
              cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier:"cellReuseIdentifier")
          }
        cell!.textLabel?.text = allQuotes?[indexPath.row].quote
          return cell!
    }
    
}
