//
//  StockItemRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol StockItemRepository {
    func hasStock(itemId: String, handler: @escaping (Result<GetHasStockRequest.Response, SessionTaskError>) -> Void)
    func putStock(itemId: String, handler: @escaping (Result<PutStockRequest.Response, SessionTaskError>) -> Void)
    func deleteStock(itemId: String, handler: @escaping (Result<DeleteStockRequest.Response, SessionTaskError>) -> Void)
}

public struct StockItemRepositoryImpl: StockItemRepository {
    
    public static let shared: StockItemRepository = StockItemRepositoryImpl()
    
    public func hasStock(itemId: String, handler: @escaping (Result<GetHasStockRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = StockItemDataStoreFactory.createStockItemDataStoreNetworkImpl()
        dataStore.hasStock(itemId: itemId, handler: handler)
    }

    public func putStock(itemId: String, handler: @escaping (Result<PutStockRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = StockItemDataStoreFactory.createStockItemDataStoreNetworkImpl()
        dataStore.putStock(itemId: itemId, handler: handler)
    }
    
    public func deleteStock(itemId: String, handler: @escaping (Result<DeleteStockRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = StockItemDataStoreFactory.createStockItemDataStoreNetworkImpl()
        dataStore.deleteStock(itemId: itemId, handler: handler)
    }
    
}
