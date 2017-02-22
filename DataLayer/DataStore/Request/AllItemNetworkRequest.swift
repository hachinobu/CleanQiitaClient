//
//  AllItemNetworkRequest.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper
import Networking

public struct GetAllItemListRequest: QiitaRequest {
    
    public typealias Response = [ItemEntity]
    
    private let page: Int?
    private let perPage: Int?
    
    public init(page: Int?, perPage: Int?) {
        self.page = page
        self.perPage = perPage
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/api/v2/items"
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
    
//    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
//        guard let jsonArray = object as? [[String: Any]] else {
//            throw ResponseError.unexpectedObject(object)
//        }
//        return try Mapper<ItemEntity>().mapArray(JSONArray: jsonArray)
//    }
    
//    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
//        guard let jsonArray = object as? [[String: Any]],
//            let responseObject = Array<ItemEntity>(JSONArray: jsonArray) else {
//            throw ResponseError.unexpectedObject(object)
//        }
//        return responseObject
//    }
    
}
