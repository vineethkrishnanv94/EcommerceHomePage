//
//  BannerContentCell.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit
import SDWebImage
class CarouselContentCell: UICollectionViewCell {
    static let identifier = "CarouselContentCell"
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    var cellContent: Offer? {
        didSet {
            if let image = cellContent?.image {
                let imageURL = URL(string: image)!
                imageView.sd_setImage(with: imageURL, completed: nil)
            }
        }
    }

}
