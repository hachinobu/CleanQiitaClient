//
//  AccessTokenDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Utility

public protocol AccessTokenDataStore {
    func save(accessToken: String, handler: (_ isSuccess: Bool) -> Void)
    func alreadyHasToken(handler: (_ hasToken: Bool) -> Void)
}

public struct AccessTokenDataStoreImpl: AccessTokenDataStore {
    
    public init() {
        
    }
    
    public func save(accessToken: String, handler: (Bool) -> Void) {
        let result = AccessTokenStorage.save(accesToken: accessToken)
        handler(result)
    }
    
    public func alreadyHasToken(handler: (Bool) -> Void) {
        let result = AccessTokenStorage.fetch() != nil ? true : false
        handler(result)
    }

}
