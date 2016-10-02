//
//  ItemListDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

protocol ItemListDataStore {
    func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void)
}

struct ItemListDataStoreNetworkImpl: ItemListDataStore {
    
    func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void) {
        let request = GetAllItemListRequest(page: page, perPage: perPage)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}

struct ItemListDataStoreFactory {
    
    static func createItemListDataStore() -> ItemListDataStore {
        return ItemListDataStoreNetworkImpl()
    }
    
}
