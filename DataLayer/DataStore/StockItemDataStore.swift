//
//  StockItemDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

protocol StockItemDataStore {
    func hasStock(itemId: String, handler: @escaping (Result<GetHasStockRequest.Response, SessionTaskError>) -> Void)
    func putStock(itemId: String, handler: @escaping (Result<PutStockRequest.Response, SessionTaskError>) -> Void)
    func deleteStock(itemId: String, handler: @escaping (Result<DeleteStockRequest.Response, SessionTaskError>) -> Void)
}

struct StockItemDataStoreNetworkImpl: StockItemDataStore {
    
    public init() {
        
    }
    
    public func hasStock(itemId: String, handler: @escaping (Result<GetHasStockRequest.Response, SessionTaskError>) -> Void) {
        let request = GetHasStockRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
    public func putStock(itemId: String, handler: @escaping (Result<PutStockRequest.Response, SessionTaskError>) -> Void) {
        let request = PutStockRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
    public func deleteStock(itemId: String, handler: @escaping (Result<DeleteStockRequest.Response, SessionTaskError>) -> Void) {
        let request = DeleteStockRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}

struct StockItemDataStoreFactory {
    
    static func fetchStockItemDataStore(from: AcquisitionType) -> StockItemDataStore {
        switch from {
        case .api:
            return StockItemDataStoreNetworkImpl()
        case .db:
            return StockItemDataStoreNetworkImpl()
        }
    }
    
}
