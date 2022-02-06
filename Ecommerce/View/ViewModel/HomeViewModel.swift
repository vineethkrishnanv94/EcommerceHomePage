//
//  HomeViewModel.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//
import Foundation
import UIKit
protocol HomeDelegate: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadView()
}
enum HomeSection {
    case carousal
    case products
    case banner
}

class HomeViewModel: NSObject {
    weak var delegate: HomeDelegate?
    var sections = [HomeSection]()
    var homeResponse: HomeDetail?
    func fetchHomeDetails() {
        
        ServiceLayer.makeRequest(to: .getHomePageDetails, parameters:  nil, responseType: HomeDetail.self) { [weak self] (result) in
            self?.delegate?.hideLoadingIndicator()
            switch result {
            case .success( let homeDetail):
                print("Success")
                if let details = homeDetail {
                    self?.homeResponse = details
                    self?.setupSections(homeResponse: details)
                }
                self?.delegate?.reloadView()
            case .failure(_):
                print("FAILURE")
                break
            }
        }
    }
    
    func setupSections(homeResponse: HomeDetail) {
        if let offers = homeResponse.offers {
            if !offers.isEmpty {
                sections.append(.carousal)
            }
        }
        if let products = homeResponse.products {
            if !products.isEmpty {
                sections.append(.products)
            }
        }
        if let banner = homeResponse.banner {
            sections.append(.banner)
        }
        
    }
    
    //MARK: - TABLEVIEW HELPER FUNCTIONS
    func numberOfSections() -> Int {
        sections.count
    }
    
    func cellFor(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell()
        switch sections[indexPath.section] {
        
        case .carousal:
            cell = getCarousalCell(tableView: tableView, indexPath: indexPath)
        case .products:
            cell = getProductCell(tableView: tableView, indexPath: indexPath)
        case .banner:
            cell = getBannerCell(tableView: tableView, indexPath: indexPath)
        }
        return cell
    }
    
    fileprivate func returnEmptyCell() -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    fileprivate func getBannerCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {
            return returnEmptyCell()
        }
        if let banner = homeResponse?.banner {
            cell.cellContent = banner
        }
        return cell
    }
    
    fileprivate func getCarousalCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselCell.identifier, for: indexPath) as? CarouselCell else {
            return returnEmptyCell()
        }
        if let offers = homeResponse?.offers {
            cell.setupOffers(offerList: offers)
        }
        return cell
    }

    fileprivate func getProductCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.identifier, for: indexPath) as? ProductsCell else {
            return returnEmptyCell()
        }
        if let products = homeResponse?.products {
            cell.setupDetails(productList: products)
        }
        return cell
    }

    
}
