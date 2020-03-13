//
//  UIViewController+EmptyStateView.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

extension UIViewController {
    func showEmptyStateView(with message: String, in view: UIView) {
        DispatchQueue.main.async {
            let emptyStateView = GAEmptyStateView(message: message)
            emptyStateView.frame = view.bounds
            view.addSubview(emptyStateView)
        }
    }
}
