//
//  StockNetworkRequest.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper
import Networking

public struct GetItemStockersRequest: QiitaRequest {
    
    public typealias Response = [UserEntity]
    
    let itemId: String
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/api/v2/items/\(itemId)/stockers"
    }
    
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Array<UserEntity> {
        guard
            let jsonArray = object as? [[String: Any]],
            let responseObject = Mapper<UserEntity>().mapArray(JSONArray: jsonArray) else {
                throw ResponseError.unexpectedObject(object)
        }
        return responseObject
    }
    
}

public struct GetHasStockRequest: QiitaRequest {
    
    public typealias Response = Bool
    
    let itemId: String
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/api/v2/items/\(itemId)/stock"
    }
    
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        switch urlResponse.statusCode {
        case 200..<300:
            return true
        default:
            return false
        }
    }
    
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Bool {
        return object as! Bool
    }
    
}

public struct PutStockRequest: QiitaRequest {
    
    public typealias Response = Void
    
    let itemId: String
    
    public var method: HTTPMethod {
        return .put
    }
    
    public var path: String {
        return "/api/v2/items/\(itemId)/stock"
    }
    
}

public struct DeleteStockRequest: QiitaRequest {
    
    public typealias Response = Void
    
    let itemId: String
    
    public var method: HTTPMethod {
        return .delete
    }
    
    public var path: String {
        return "/api/v2/items/\(itemId)/stock"
    }
    
}
