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
    public let createdAt: String?
    public let id: Int
    public let name: String?
    public let isPrivate: Bool?
    public let updatedAt: String?
    public let urlName: String?
}

extension GroupEntity: ImmutableMappable {
    
    public init(map: Map) throws {
        createdAt = try? map.value("created_at")
        id = try map.value("id")
        name = try? map.value("name")
        isPrivate = try? map.value("private")
        updatedAt = try? map.value("updated_at")
        urlName = try? map.value("url_name")
    }
    
}

//extension GroupEntity: Mappable {
//    
//    public init?(map: Map) {
//        
//    }
//    
//    mutating public func mapping(map: Map) {
//        createdAt <- map["created_at"]
//        id <- map["id"]
//        name <- map["name"]
//        isPrivate <- map["private"]
//        updatedAt <- map["updated_at"]
//        urlName <- map["url_name"]
//    }
//    
//}
