//
//  AllItemDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol AllItemDataStore {
    func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void)
}

public struct AllItemDataStoreNetworkImpl: AllItemDataStore {
    
    public init() {
        
    }
    
    public func fetchAllItemList(page: Int?, perPage: Int?, handler: @escaping (Result<GetAllItemListRequest.Response, SessionTaskError>) -> Void) {
        let request = GetAllItemListRequest(page: page, perPage: perPage)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}
