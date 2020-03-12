//
//  GAAvatarImageView.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class GAAvatarImageView: GANetworkImageView {
    override func setupView(url: String) {
        super.setupView(url: url)
        layer.cornerRadius = 10
    }
}
