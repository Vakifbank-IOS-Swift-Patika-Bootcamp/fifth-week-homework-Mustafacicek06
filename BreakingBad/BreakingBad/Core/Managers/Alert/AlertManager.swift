//
//  AlertManager.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 28.11.2022.
//

import UIKit





protocol AlertShowable {
    func showAlert(with error: AlertError?,localizeDescription: String?)
}


final class AlertManager: AlertShowable {
    static let shared: AlertManager = .init()
    
    func showAlert(with error: AlertError?, localizeDescription: String?)  {
        let alert = UIAlertController(title: "Opps!!", message: (error?.description ?? localizeDescription) ?? "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(alert, animated: true)
        }
    }
}

