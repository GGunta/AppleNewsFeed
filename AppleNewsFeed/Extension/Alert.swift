//
//  Alert.swift
//  AppleNewsFeed
//
//  Created by gunta.golde on 10/08/2021.
//

import UIKit

extension UIViewController {
    func basicAlert(title: String?, message: String?){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
