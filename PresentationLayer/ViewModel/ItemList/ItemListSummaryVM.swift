//
//  ItemListSummaryVM.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer

public protocol ItemListSummaryProtocol {
    
    func fetchItemCount() -> Int
    func fetchListItemDisplayProtocol(index: Int) -> ListItemDisplayProtocol
    
}

struct ItemListSummaryVM {
    
    fileprivate let itemList: [ListItemModel]
    
    init(itemList: [ListItemModel]) {
        self.itemList = itemList
    }
    
}

extension ItemListSummaryVM: ItemListSummaryProtocol {
    
    func fetchItemCount() -> Int {
        return itemList.count
    }
    
    func fetchListItemDisplayProtocol(index: Int) -> ListItemDisplayProtocol {
        guard itemList.count > index else {
            fatalError()
        }
        let displayItem = itemList[index]
        
        return ListItemDisplayVM(item: displayItem)
    }
    
}
