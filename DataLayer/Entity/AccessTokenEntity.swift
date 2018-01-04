//
//  AccessTokenEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct AccessTokenEntity: Codable {
    public let clientId: String?
    public let scopes: [String]?
    public let token: String?
    
    private enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case scopes
        case token
    }
    
}
