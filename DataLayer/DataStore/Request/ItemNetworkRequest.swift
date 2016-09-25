//
//  ItemDetailNetworkRequest.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Networking
import APIKit

public struct GetItemNetworkRequest: QiitaRequest {
    
    public typealias Response = ItemEntity
    
    private let itemId: String
    
    public init(itemId: String) {
        self.itemId = itemId
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/api/v2/items/\(itemId)"
    }
    
}

