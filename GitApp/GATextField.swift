//
//  GATextField.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class GATextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setupView(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView(placeholder: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        
        self.placeholder = placeholder
    }
}
