//
//  UserItemRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol UserItemRepository {
    func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void)
}

public struct UserItemRepositoryImpl: UserItemRepository {
    
    public static let shared: UserItemRepository = UserItemRepositoryImpl()
    
    init() {
        
    }
    
    public func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = UserItemDataStoreFactory.fetchUserItemDataStore(from: .api)
        dataStore.fetchUserItemList(page: page, perPage: perPage, userId: userId, handler: handler)
    }
    
}
