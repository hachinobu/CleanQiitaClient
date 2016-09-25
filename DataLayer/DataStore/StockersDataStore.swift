//
//  StockersDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol StockersDataStore {
    func fetchStockers(itemId: String, handler: @escaping (Result<GetItemStockersRequest.Response, SessionTaskError>) -> Void)
}

public struct StockersDataStoreNetworkImpl: StockersDataStore {
    
    public init() {
        
    }
    
    public func fetchStockers(itemId: String, handler: @escaping (Result<GetItemStockersRequest.Response, SessionTaskError>) -> Void) {
        let request = GetItemStockersRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}
