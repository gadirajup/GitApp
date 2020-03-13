//
//  UIViewController+Loader.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func showLoadingView() {
        containerView = UIView(frame: view.frame)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.75 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        activityIndicator.startAnimating()
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25, animations: {
                containerView.alpha = 0
            }) { (_) in
                containerView.removeFromSuperview()
                containerView = nil
            }
        }
        
    }
}
