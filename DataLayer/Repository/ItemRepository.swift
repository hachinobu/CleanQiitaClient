//
//  ItemDetailRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol ItemRepository {
    func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void)
}

public struct ItemRepositoryImpl: ItemRepository {
    
    public static let shared: ItemRepository = ItemRepositoryImpl()
    
    public func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = ItemDataStoreFactory.createItemDataStore()
        dataStore.fetchItemDetail(itemId: itemId, handler: handler)
    }
    
}
