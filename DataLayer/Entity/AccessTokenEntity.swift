//
//  AccessTokenEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import ObjectMapper

public struct AccessTokenEntity {
    public var clientId: String?
    public var scopes: [String]?
    public var token: String?
}

extension AccessTokenEntity: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        clientId <- map["client_id"]
        scopes <- map["scopes"]
        token <- map["token"]
    }
    
}
