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
    
    let dataStore: ItemDataStore
    
    public init(dataStore: ItemDataStore) {
        self.dataStore = dataStore
    }
    
    public func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void) {
        dataStore.fetchItemDetail(itemId: itemId, handler: handler)
    }
    
}
