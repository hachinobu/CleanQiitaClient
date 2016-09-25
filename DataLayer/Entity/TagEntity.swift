//
//  TagEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TagEntity {
    public var name: String?
    public var versions: [String]?
}

extension TagEntity: Mappable {
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        name <- map["name"]
        versions <- map["versions"]
    }
    
}
