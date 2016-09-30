//
//  UserItemDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

protocol UserItemDataStore {
    func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void)
}

struct UserItemDataStoreNetworkImpl: UserItemDataStore {
    
    public init() {
        
    }
    
    public func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void) {
        let request = GetUserItemListRequest(page: page, perPage: perPage, userId: userId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}

struct UserItemDataStoreFactory {
    
    static func fetchUserItemDataStore(from: AcquisitionType) -> UserItemDataStore {
        switch from {
        case .api:
            return UserItemDataStoreNetworkImpl()
        case .db:
            return UserItemDataStoreNetworkImpl()
        }
    }
    
}
