//
//  GroupEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GroupEntity {
    public var createdAt: String?
    public var id: Int?
    public var name: String?
    public var isPrivate: Bool?
    public var updatedAt: String?
    public var urlName: String?
}

extension GroupEntity: Mappable {
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        createdAt <- map["created_at"]
        id <- map["id"]
        name <- map["name"]
        isPrivate <- map["private"]
        updatedAt <- map["updated_at"]
        urlName <- map["url_name"]
    }
    
}
