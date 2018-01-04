//
//  ItemViewController.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Utility

fileprivate extension Selector {
    static let refreshAction = #selector(ItemViewController.refreshData)
}

@objcMembers
public class ItemViewController: UITableViewController {

    private var presenter: ItemPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    fileprivate var routing: ItemRouting!
    
    fileprivate var itemSummaryVM: ItemSummaryProtocol! {
        didSet {
            tableView.reloadData()
        }
    }
    
    fileprivate var webViewHeight: CGFloat = 0.0
    
    public func injection(presenter: ItemPresenter, routing: ItemRouting) {
        self.presenter = presenter
        self.routing = routing
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupUI()
        presenter.refreshData()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func refreshData() {
        presenter.refreshData()
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        if itemSummaryVM == nil {
            return 0
        }
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemSummaryVM.tableRowCount()
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ItemHeaderCell
            cell.presenter = presenter
            cell.vm = itemSummaryVM.fetchItemHeaderVM()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ItemBodyCell
        cell.itemBodyWebView.delegate = self
        cell.vm = itemSummaryVM.fetchItemBodyVM()
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fetchTableHeight(row: indexPath.row)
    }
    
    override public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return fetchTableHeight(row: indexPath.row)
    }
    
    private func fetchTableHeight(row: Int) -> CGFloat {
        return row == 0 ? UITableViewAutomaticDimension : webViewHeight
    }
    
}

extension ItemViewController: ItemPresenterView {
    
    public func setupNavigation(title: String) {
        self.title = title
    }
    
    public func setupTable() {
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    public func setupRefreshControl() {
        guard refreshControl == nil else {
            return
        }
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .qiitaMainColor
        refreshControl?.addTarget(self, action: .refreshAction, for: .valueChanged)
    }
    
    public func reloadView(itemSummaryVM: ItemSummaryProtocol) {
        self.itemSummaryVM = itemSummaryVM
    }
    
    public func segueItemListOfSelectedUser(userId: String) {
        routing.segueItemList(userId: userId)
    }
    
}

//MARK: UIWebViewDelegate
extension ItemViewController: UIWebViewDelegate {
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        let height = webView.scrollView.contentSize.height
        if webViewHeight == height {
            return
        }
        
        webViewHeight = height
        tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
    }
    
}

