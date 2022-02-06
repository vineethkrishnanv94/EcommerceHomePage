//
//  HomepageViewController.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import UIKit

class HomepageViewController: UIViewController {

    @IBOutlet weak var homeTable: UITableView!
    var viewModel: HomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCells()
        viewModel = HomeViewModel()
        viewModel?.delegate = self
        viewModel?.fetchHomeDetails()
    }
    
    private func registerCells() {
        homeTable.register(BannerCell.nib, forCellReuseIdentifier: BannerCell.identifier)
        homeTable.register(CarouselCell.nib, forCellReuseIdentifier: CarouselCell.identifier)
        homeTable.register(ProductsCell.nib, forCellReuseIdentifier: ProductsCell.identifier)        
    }
    
}
extension HomepageViewController: UITableViewDelegate {
    
}
extension HomepageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cellFor(tableView: tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    
}
extension HomepageViewController: HomeDelegate {
    func showLoadingIndicator() {
        //show loading indicator
    }
    
    func hideLoadingIndicator() {
        //hide loading 
    }
    func reloadView() {
        DispatchQueue.main.async {
            self.homeTable.reloadData()
        }
    }
    
}
