//
//  AllItemRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol AllItemRepository {
    func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void)
}

public struct AllItemRepositoryImpl: AllItemRepository {
    
    private let dataStore: AllItemDataStore
    
    public init(dataStore: AllItemDataStore) {
        self.dataStore = dataStore
    }
    
    public func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void) {
        dataStore.fetchAllItemList(page: page, perPage: perPage, handler: handler)
    }
    
}
