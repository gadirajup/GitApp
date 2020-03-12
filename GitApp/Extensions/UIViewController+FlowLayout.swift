//
//  UIViewController+FlowLayout.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/12/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

extension UIViewController {
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
         let width = view.bounds.width
         let padding: CGFloat = 12
         let minimumItemSpacing: CGFloat = 10
         let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
         let itemWidth = availableWidth / 3
         
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
         flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
         return flowLayout
     }
}
