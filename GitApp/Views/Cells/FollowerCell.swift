//
//  FollowerCell.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    private let paddingS: CGFloat = 8
    private let paddingM: CGFloat = 12
    private let labelHeight: CGFloat = 20

    private let avatarImageView = GAAvatarImageView()
    private let usernameLabel = GATitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.set(image: follower.avatarUrl)
    }
    
    private func setupView() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: paddingS),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingS),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingS),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: paddingM),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingS),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingS),
            usernameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
}
