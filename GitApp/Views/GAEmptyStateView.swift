//
//  GAEmptyStateView.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class GAEmptyStateView: UIView {
    let messageLabel = GATitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = GAImageView(image: "empty-state-logo")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(message: "No Info :(")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        setupView(message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView(message: String) {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.text = message
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }
}
