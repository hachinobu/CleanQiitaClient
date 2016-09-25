//
//  ItemEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ItemEntity {
    public var renderedBody: String?
    public var body: String?
    public var coediting: Bool?
    public var createdAt: String?
    public var group: GroupEntity?
    public var id: String?
    public var isPrivate: Bool?
    public var tagList: [TagEntity]?
    public var title: String?
    public var updatedAt: String?
    public var url: String?
    public var user: UserEntity?
}

extension ItemEntity: Mappable {
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        renderedBody <- map["rendered_body"]
        body <- map["body"]
        coediting <- map["coediting"]
        createdAt <- map["created_at"]
        group <- map["group"]
        id <- map["id"]
        isPrivate <- map["private"]
        tagList <- map["tags"]
        title <- map["title"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        user <- map["user"]
    }
    
}
