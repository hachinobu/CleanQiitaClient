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
    
    private let dataStore: AuthDataStore
    
    public init(dataStore: AuthDataStore) {
        self.dataStore = dataStore
    }
    
    public func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<PublishAccessTokenNetworkRequest.Response, SessionTaskError>) -> ()) {
        
        dataStore.publishAccessToken(clientId: clientId, clientSecret: clientSecret, code: code, handler: handler)
        
    }
    
}
