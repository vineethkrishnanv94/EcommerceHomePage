//
//  ProductContentCell.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit
import SDWebImage

class ProductContentCell: UICollectionViewCell {
    static let identifier = "ProductContentCell"
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var cellContent: Product? {
        didSet {
            if let title = cellContent?.name {
                titleLabel.text = title
            }
            if let offer = cellContent?.offer {
                offerLabel.text = offer
            }
            if let image = cellContent?.image {
                let imageURL = URL(string: image)!
                imageView.sd_setImage(with: imageURL, completed: nil)
            }
        }
    }

}
