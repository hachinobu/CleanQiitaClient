//
//  QiitaRequestType.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper
import Utility

public struct QiitaError: Error {
    let message: String
    
    init(object: AnyObject) {
        message = object["message"] as? String ?? "Unknown Error"
    }
}

public protocol QiitaRequest: Request {
}

public extension QiitaRequest {
    
    public var headerFields: [String: String] {
        guard let accessToken = AccessTokenStorage.fetch(), !accessToken.isEmpty else {
            return [:]
        }
        return ["Authorization": "Bearer \(accessToken)"]
    }
    
    public var baseURL: URL {
        return URL(string: "http://qiita.com")!
    }
    
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        switch urlResponse.statusCode {
        case 200..<300:
            return object
        case 400, 401, 402, 403, 404:
            throw QiitaError(object: object as AnyObject)
        default:
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
    }
    
}

public extension QiitaRequest where Response: Mappable {
    
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Self.Response {
        guard let json = object as? [String: Any], let responseObject = Mapper<Response>().map(JSON: json) else {
            throw ResponseError.unexpectedObject(object)
        }
        return responseObject
    }
    
}

public extension QiitaRequest where Response == Void {
    
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Self.Response {
        return ()
    }
    
}
