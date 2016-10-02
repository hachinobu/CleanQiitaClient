//
//  ItemListRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol ItemListRepository {
    func fetchItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void)
}

public struct ItemListRepositoryImpl: ItemListRepository {
    
    public static let shared: ItemListRepository = ItemListRepositoryImpl()
    
    public func fetchItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = ItemListDataStoreFactory.createItemListDataStore()
        dataStore.fetchAllItemList(page: page, perPage: perPage, handler: handler)
    }
    
}
