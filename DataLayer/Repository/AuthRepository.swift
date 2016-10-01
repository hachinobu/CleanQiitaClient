//
//  AuthRepository.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol AuthRepository {
    func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<PublishAccessTokenNetworkRequest.Response, SessionTaskError>) -> ())
}

public struct AuthRepositoryImpl: AuthRepository {
    
    public static let shared: AuthRepositoryImpl = AuthRepositoryImpl()
    
    public func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<PublishAccessTokenNetworkRequest.Response, SessionTaskError>) -> ()) {
        let dataStore = AuthDataStoreFactory.createAuthDataStore()
        dataStore.publishAccessToken(clientId: clientId, clientSecret: clientSecret, code: code, handler: handler)
    }
    
}
