//
//  GANetworkImageView.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class GANetworkImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    init(url: String) {
        super.init(frame: .zero)
        setupView(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(url: String) {
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let _ = URL(string: url) else { return }
    }
}
