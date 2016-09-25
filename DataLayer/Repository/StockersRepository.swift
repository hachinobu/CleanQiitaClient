//
//  StockersRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol StockersRepository {
    func fetchStockers(itemId: String, handler: @escaping (Result<GetItemStockersRequest.Response, SessionTaskError>) -> Void)
}

public struct StockersRepositoryImpl: StockersRepository {
    
    let dataStore: StockersDataStore
    
    public init(dataStore: StockersDataStore) {
        self.dataStore = dataStore
    }
    
    public func fetchStockers(itemId: String, handler: @escaping (Result<GetItemStockersRequest.Response, SessionTaskError>) -> Void) {
        dataStore.fetchStockers(itemId: itemId, handler: handler)
    }
    
}
