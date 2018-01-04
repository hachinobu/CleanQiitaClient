//
//  TagEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct TagEntity: Codable {
    public let name: String?
    public let versions: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case versions
    }
    
}
