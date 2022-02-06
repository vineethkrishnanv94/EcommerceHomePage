//
//  CarouselCell.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit

class CarouselCell: UITableViewCell {
    static let identifier = "CarouselCell"
    static var nib: UINib? {
        return UINib(nibName: identifier, bundle: nil)
    }
    var offers = [Offer]()
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func registerCells() {
        collectionView.register(CarouselContentCell.nib, forCellWithReuseIdentifier: CarouselContentCell.identifier)

    }
    
    func setupOffers(offerList:[Offer]) {
        self.offers = offerList
        self.pageControl.numberOfPages = offerList.count
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
extension CarouselCell: UICollectionViewDelegate {
    
}
extension CarouselCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselContentCell.identifier, for: indexPath) as? CarouselContentCell else {
            return UICollectionViewCell()
        }
        cell.cellContent = offers[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
    
}
extension CarouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
}
