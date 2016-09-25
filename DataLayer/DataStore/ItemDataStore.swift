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

public protocol ItemDataStore {
    func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void)
}

public struct ItemDataStoreNetworkImpl: ItemDataStore {
    
    public init() {
        
    }
    
    public func fetchItemDetail(itemId: String, handler: @escaping (Result<GetItemNetworkRequest.Response, SessionTaskError>) -> Void) {
        let request = GetItemNetworkRequest(itemId: itemId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}
