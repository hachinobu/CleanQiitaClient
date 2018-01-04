//
//  ItemEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct ItemEntity: Codable {
    public let renderedBody: String?
    public let body: String?
    public let coediting: Bool?
    public let createdAt: String?
    public let group: GroupEntity?
    public let id: String?
    public let likeCount: Int
    public let isPrivate: Bool?
    public let tagList: [TagEntity]?
    public let title: String?
    public let updatedAt: String?
    public let url: String?
    public let user: UserEntity?
    
    private enum CodingKeys: String, CodingKey {
        case renderedBody = "rendered_body"
        case body
        case coediting
        case createdAt = "created_at"
        case group
        case id
        case likeCount = "likes_count"
        case isPrivate = "private"
        case tagList = "tags"
        case title
        case updatedAt = "updated_at"
        case url
        case user
    }
}


