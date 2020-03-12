//
//  SearchVC.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = GAImageView(image: "gh-logo")
    let searchTextField = GATextField(placeholder: "Enter Username")
    let searchButton = GAButton(backgroundColor: .systemGreen, title: "Search Followers")
    
    var enteredUsername: Bool { !searchTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func pushFollowerListVC() {
        guard enteredUsername else {
            presentGAAlert(title: "Empty Username", message: "Please enter something in the search field", buttonText: "Ok")
            return
        }
        let followerListVC = FollowersListVC()
        followerListVC.username = searchTextField.text
        followerListVC.title = searchTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func setupKeyboardDismissTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        setupLogo()
        setupSearchTextField()
        setupSearchButton()
        setupKeyboardDismissTapGesture()
    }
    
    private func setupLogo() {
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor)
        ])
    }
    
    private func setupSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSearchButton() {
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
