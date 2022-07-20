//
//  CreateAlert.swift
//  RickAndMortyApp
//
//  Created by Abdullah Bozkus on 11.07.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
  func exitAppAlert(message: String, title: String ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default){_ in
        exit(0)
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
