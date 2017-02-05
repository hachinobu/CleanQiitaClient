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
    public let name: String?
    public let versions: [String]?
}

extension TagEntity: ImmutableMappable {
    
    public init(map: Map) throws {
        name = try? map.value("name")
        versions = try? map.value("versions")
    }
    
}
