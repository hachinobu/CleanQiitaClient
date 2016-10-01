//
//  AccessTokenRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol AccessTokenRepository {
    func save(accessToken: String, handler: (_ isSuccess: Bool) -> Void)
    func alreadyHasToken(handler: (_ hasToken: Bool) -> Void)
}

public struct AccessTokenRepositoryImpl: AccessTokenRepository {
    
    public static let shared: AccessTokenRepositoryImpl = AccessTokenRepositoryImpl()
    
    public func save(accessToken: String, handler: (Bool) -> Void) {
        let dataStore = AccessTokenDataStoreFactory.createAccessTokenDataStore()
        dataStore.save(accessToken: accessToken, handler: handler)
    }
    
    public func alreadyHasToken(handler: (Bool) -> Void) {
        let dataStore = AccessTokenDataStoreFactory.createAccessTokenDataStore()
        dataStore.alreadyHasToken(handler: handler)
    }
    
}
