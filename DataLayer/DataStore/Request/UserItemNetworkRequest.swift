//
//  UserItemNetworkRequest.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Networking
import APIKit
import ObjectMapper

public struct GetUserItemListRequest: QiitaRequest {
    
    public typealias Response = [ItemEntity]
    
    private let page: Int?
    private let perPage: Int?
    private let userId: String
    
    public init(page: Int?, perPage: Int?, userId: String) {
        self.page = page
        self.perPage = perPage
        self.userId = userId
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/api/v2/users/\(userId)/items"
    }
    
    public var queryParameters: [String: Any]? {
        
        var parameters: [String: Any]? = [:]
        
        if let page = page {
            parameters?["page"] = page
        }
        
        if let perPage = perPage {
            parameters?["per_page"] = perPage
        }
        
        return parameters
    }
    
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard
            let jsonArray = object as? [[String: Any]],
            let responseObject = Mapper<ItemEntity>().mapArray(JSONArray: jsonArray) else {
                throw ResponseError.unexpectedObject(object)
        }
        return responseObject
    }
    
}
