//
//  UserItemListDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

protocol UserItemListDataStore {
    func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void)
}

struct UserItemListDataStoreNetworkImpl: UserItemListDataStore {
    
    public func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void) {
        let request = GetUserItemListRequest(page: page, perPage: perPage, userId: userId)
        Session.send(request, callbackQueue: nil, handler: handler)
    }
    
}

struct UserItemListDataStoreFactory {
    
    static func createUserItemListDataStore() -> UserItemListDataStore {
        return UserItemListDataStoreNetworkImpl()
    }
    
}
