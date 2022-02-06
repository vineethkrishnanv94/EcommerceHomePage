//
//  ProductsCell.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit

class ProductsCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "ProductsCell"
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }
    var products = [Product]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func registerCells() {
        collectionView.register(ProductContentCell.nib, forCellWithReuseIdentifier: ProductContentCell.identifier)

    }
    func setupDetails(productList: [Product]) {
        self.products = productList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
extension ProductsCell: UICollectionViewDelegate {
    
}
extension ProductsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductContentCell.identifier, for: indexPath) as? ProductContentCell else {
            return UICollectionViewCell()
        }
        cell.cellContent = products[indexPath.item]
        return cell
    }
    
    
}
extension ProductsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 10, height: 200)
    }
}
