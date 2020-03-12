//
//  UIViewController+Alert.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentGAAlert(title: String, message: String, buttonText: String) {
        DispatchQueue.main.async {
            let alertVC = GAAlertController(alertTitle: title, alertMessage: message, alertButtonText: buttonText)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
