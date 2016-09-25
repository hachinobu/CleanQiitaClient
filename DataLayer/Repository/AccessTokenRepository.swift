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
    
    public let dataStore: AccessTokenDataStore
    
    public init(dataStore: AccessTokenDataStore) {
        self.dataStore = dataStore
    }
    
    public func save(accessToken: String, handler: (Bool) -> Void) {
        dataStore.save(accessToken: accessToken, handler: handler)
    }
    
    public func alreadyHasToken(handler: (Bool) -> Void) {
        dataStore.alreadyHasToken(handler: handler)
    }
    
}
