//
//  ItemListViewController.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import DomainLayer
import Utility

fileprivate extension Selector {
    static let refreshAction = #selector(ItemListViewController.refreshData)
}

class ItemListViewController: UITableViewController {

    @IBOutlet weak var indicatorCircleView: IndicatorCircleView!
    private var presenter: ItemListPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    fileprivate var routing: ItemListRouting!
    
    fileprivate var itemListSummaryVM: ItemListSummaryProtocol! {
        didSet {
            tableView.reloadData()
        }
    }
    
    func injection(presenter: ItemListPresenter, routing: ItemListRouting) {
        self.presenter = presenter
        self.routing = routing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupUI()
        presenter.refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refreshData() {
        presenter.refreshData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSection = itemListSummaryVM == nil ? 0 : 1
        return numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListSummaryVM.fetchItemCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListItemCell
        let displayItemVM = itemListSummaryVM.fetchListItemDisplayProtocol(index: indexPath.row)
        cell.setupContents(displayVM: displayItemVM)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.reachedBottom(index: indexPath.row, isAnimation: indicatorCircleView.isAnimating())
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedItem(index: indexPath.row)
    }

}

extension ItemListViewController: ItemListPresenterView {
    
    func showErrorAlert(message: String) {
        refreshControl?.endRefreshing()
        routing.presentErrorAlert(message: message)
    }
    
    func setupNavigation(title: String) {
        self.title = title
    }
    
    func setupRefreshControl() {
        guard refreshControl == nil else {
            return
        }
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: .refreshAction, for: .valueChanged)
    }
    
    func segueItemDetailScreen(itemId: String) {
        routing.segueItem(id: itemId)
    }
    
    func reloadView(itemListSummaryProtocol: ItemListSummaryProtocol) {
        refreshControl?.endRefreshing()
        itemListSummaryVM = itemListSummaryProtocol
    }
    
    func startIndicator() {
        indicatorCircleView.startAnimation()
    }
    
    func stopIndicator() {
        indicatorCircleView.stopAnimation()
    }
    
}
