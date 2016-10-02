//
//  UserItemListRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol UserItemListRepository {
    func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void)
}

public struct UserItemListRepositoryImpl: UserItemListRepository {
    
    public static let shared: UserItemListRepository = UserItemListRepositoryImpl()
    
    public func fetchUserItemList(page: Int?, perPage: Int?, userId: String, handler: @escaping (Result<GetUserItemListRequest.Response, SessionTaskError>) -> Void) {
        let dataStore = UserItemListDataStoreFactory.createUserItemListDataStore()
        dataStore.fetchUserItemList(page: page, perPage: perPage, userId: userId, handler: handler)
    }
    
}
