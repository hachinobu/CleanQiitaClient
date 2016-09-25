//
//  AuthNetworkRequest.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Networking

public struct PublishAccessTokenNetworkRequest: QiitaRequest {
    
    public typealias Response = AccessTokenEntity
    
    private let clientId: String
    private let clientSecret: String
    private let code: String
    
    public init(clientId: String, clientSecret: String, code: String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.code = code
    }
    
    public var headerFields: [String : String] {
        return [:]
    }
    
    public var method: HTTPMethod {
        return .post
    }
    
    public var path: String {
        return "/api/v2/access_tokens"
    }
    
    public var parameters: Any? {
        return ["client_id": clientId, "client_secret": clientSecret, "code": code]
    }
    
}
