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
    public let clientId: String?
    public let scopes: [String]?
    public let token: String?
}

extension AccessTokenEntity: ImmutableMappable {
    
    public init(map: Map) throws {
        clientId = try? map.value("client_id")
        scopes = try? map.value("scopes")
        token = try? map.value("token")
    }
    
}
