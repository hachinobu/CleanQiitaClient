//
//  AuthDataStore.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result

public protocol AuthDataStore {
    func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<PublishAccessTokenNetworkRequest.Response, SessionTaskError>) -> ())
}

public struct AuthDataStoreNetworkImpl: AuthDataStore {
    
    public init() {
        
    }
    
    public func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<PublishAccessTokenNetworkRequest.Response, SessionTaskError>) -> ()) {
        
        let request = PublishAccessTokenNetworkRequest(clientId: clientId, clientSecret: clientSecret, code: code)
        Session.send(request, callbackQueue: nil, handler: handler)
        
    }
    
}
