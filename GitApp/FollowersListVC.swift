//
//  FollowersListVC.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupNavBar()
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
