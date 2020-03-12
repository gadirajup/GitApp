//
//  GAImageView.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class GAImageView: UIImageView {
    
    init(image: String) {
        super.init(frame: .zero)
        setupView(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(image: String) {
        self.image = UIImage(named: image)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
