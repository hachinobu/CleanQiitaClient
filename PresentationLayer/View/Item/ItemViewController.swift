//
//  ItemViewController.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit

class ItemViewController: UITableViewController {

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
    
    func injection(presenter: ItemPresenter, routing: ItemRouting) {
        self.presenter = presenter
        self.routing = routing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        presenter.refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if itemSummaryVM == nil {
            return 0
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemSummaryVM.tableRowCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemHeaderCell", for: indexPath) as! ItemHeaderCell
            cell.presenter = presenter
            cell.vm = itemSummaryVM.fetchItemHeaderVM()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemBodyCell", for: indexPath) as! ItemBodyCell
        cell.itemBodyWebView.delegate = self
        cell.vm = itemSummaryVM.fetchItemBodyVM()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fetchTableHeight(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return fetchTableHeight(row: indexPath.row)
    }
    
    private func fetchTableHeight(row: Int) -> CGFloat {
        return row == 0 ? UITableViewAutomaticDimension : webViewHeight
    }
    
}

extension ItemViewController: ItemPresenterView {
    
    func reloadView(itemSummaryVM: ItemSummaryProtocol) {
        self.itemSummaryVM = itemSummaryVM
    }
    
    func segueItemListOfSelectedUser(userId: String) {
        routing.segueItemList(userId: userId)
    }
    
}

//MARK: UIWebViewDelegate
extension ItemViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let height = webView.scrollView.contentSize.height
        if webViewHeight == height {
            return
        }
        
        webViewHeight = height
        tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
    }
    
}

