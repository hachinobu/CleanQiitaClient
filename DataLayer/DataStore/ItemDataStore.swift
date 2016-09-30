//
//  ItemDetailDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Result
import APIKit

protocol ItemDataStore {
    func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void)
}

struct ItemDataStoreNetworkImpl: ItemDataStore {
    
    public func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void) {
        let request = GetItemNetworkRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}


struct ItemDataStoreFactory {
    
    static func fetchItemDataStore(type: AcquisitionType) -> ItemDataStore {
        switch type {
        case .api:
            return ItemDataStoreNetworkImpl()
        case .db:
            return ItemDataStoreNetworkImpl()
        }
    }
    
}
