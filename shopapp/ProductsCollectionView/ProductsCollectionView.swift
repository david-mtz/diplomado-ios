//
//  ProductsCollectionView.swift
//  shopapp
//
//  Created by David on 7/22/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ProductsCollectionView: UICollectionView {
    
    let spacingCell:CGFloat = 5
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.ShopApp.backgroundPage
        let newLayout = UICollectionViewFlowLayout()
        newLayout.sectionInset = UIEdgeInsets(top: spacingCell, left: spacingCell, bottom: spacingCell, right: spacingCell)
        newLayout.minimumLineSpacing = spacingCell
        newLayout.minimumInteritemSpacing = spacingCell
        collectionViewLayout = newLayout
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

