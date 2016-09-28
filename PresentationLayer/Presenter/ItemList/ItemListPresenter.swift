//
//  ItemListPresenter.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer

public protocol ItemListPresenter {
    
    weak var view: ItemListPresenterView? { get set }
    
    func setupUI()
    func refreshData()
    func fetchMorePageItem()
    func reachedBottom(index: Int, isAnimation: Bool)
    func selectedItem(index: Int)
    
}

public protocol ItemListPresenterView: class {
    func showErrorAlert(message: String)
    func setupNavigation(title: String)
    func setupRefreshControl()
    func segueItemDetailScreen(itemId: String)
    func reloadView(itemListSummaryProtocol: ItemListSummaryProtocol)
    func startIndicator()
    func stopIndicator()
}
