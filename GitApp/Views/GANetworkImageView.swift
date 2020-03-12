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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    init(url: String) {
        super.init(frame: .zero)
        setupView()
        downloadImage(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(image: String) { downloadImage(url: image) }
    
    func setupView() {
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(url: String) {
        NetworkManger.shared.getImage(from: url) { result in
            switch result {
            case .success(let image):
                self.image = image
            default:
                return
            }
        }
    }
}
