//
//  GroupEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct GroupEntity: Codable {
    public let createdAt: String?
    public let id: Int
    public let name: String?
    public let isPrivate: Bool?
    public let updatedAt: String?
    public let urlName: String?
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case name
        case isPrivate = "private"
        case updatedAt = "updated_at"
        case urlName = "url_name"
    }
    
}
