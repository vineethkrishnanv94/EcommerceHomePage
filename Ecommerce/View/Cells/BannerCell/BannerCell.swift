//
//  BannerCell.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit

class BannerCell: UITableViewCell {
    
    static let identifier = "BannerCell"
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var bannerImageView: UIImageView!
    
    var cellContent: Banner? {
        didSet {
            if let image = cellContent?.image {
                let imageURL = URL(string: image)!
                bannerImageView.sd_setImage(with: imageURL, completed: nil)
            }
        }
    }
    
}

