//
//  AllItemListPresenterImpl.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer
import Kingfisher
import Networking
import APIKit
import Result

public class AllItemListPresenterImpl: ItemListPresenter {
    
    weak public var view: ItemListPresenterView?
    let useCase: ItemListUseCase
    
    private var currentPage: Int = 1
    let perPage = 20
    
    private var listItemModels: [ListItemModel] = [] {
        didSet {
            reloadView(listItemModels: listItemModels)
        }
    }
    private var isFinishMoreLoad: Bool = false
    
    public init(useCase: ItemListUseCase) {
        self.useCase = useCase
    }
    
    public func setupUI() {
        view?.setupNavigation(title: "全ての投稿")
        view?.setupRefreshControl()
    }
    
    public func refreshData() {
        
        ImageCache.default.clearMemoryCache()
        
        let firstPage = 1
        useCase.fetchItemList(page: firstPage, perPage: perPage) { result in
            
            switch result {
            case .success(let listItemModels):
                self.currentPage = firstPage
                self.listItemModels = listItemModels
                
            case .failure(.responseError(let qiitaError as QiitaError)):
                self.view?.showErrorAlert(message: qiitaError.message)
                
            case .failure(let error):
                self.view?.showErrorAlert(message: error.localizedDescription)
            }
            
        }
    }
    
    public func fetchMorePageItem() {
        
        view?.startIndicator()
        let nextPage = currentPage + 1
        useCase.fetchItemList(page: nextPage, perPage: perPage) { result in
            
            self.view?.stopIndicator()
            guard let listItemModels = result.value else {
                return
            }
            self.currentPage = nextPage
            if listItemModels.count == 0 {
                self.isFinishMoreLoad = true
            }
            self.listItemModels = self.mergeItemList(currentListItemModels: self.listItemModels, fetchListItemModels: listItemModels)
            
        }
    }
    
    public func reachedBottom(index: Int, isAnimation: Bool) {
        let bottomIndex = listItemModels.count - 1
        guard bottomIndex == index && !isAnimation && !isFinishMoreLoad else {
            return
        }
        fetchMorePageItem()
    }
    
    public func selectedItem(index: Int) {
        guard listItemModels.count > index else {
            return
        }
        let item = listItemModels[index]
        view?.segueItemDetailScreen(itemId: item.id)
    }
    
    private func mergeItemList(currentListItemModels: [ListItemModel], fetchListItemModels: [ListItemModel]) -> [ListItemModel] {
        return fetchListItemModels.reduce(currentListItemModels) { (currentList, fetchItem) in
            return currentList.contains { $0.id == fetchItem.id } ? currentList : currentList + [fetchItem]
        }
    }
    
    private func reloadView(listItemModels: [ListItemModel]) {
        let summaryVM = ItemListSummaryVM(itemList: listItemModels)
        view?.reloadView(itemListSummaryProtocol: summaryVM)
    }
    
}
