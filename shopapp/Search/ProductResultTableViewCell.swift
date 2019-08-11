//
//  ProductResultTableViewCell.swift
//  shopapp
//
//  Created by David on 8/3/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ProductResultTableViewCell: UITableViewCell {
    
    var product: Product?
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    func uploadView() {
        priceLabel.textColor = UIColor.ShopApp.textImportant
        if let product = self.product {
            thumbnailImageView.getImageFromUrl(url: Config.host.value! + "/" + product.thumbnailUrl, contentModeFinal: .scaleAspectFit)
            titleTextView.text = product.name
            priceLabel.text = "$ " + product.price
        }
    }

}
