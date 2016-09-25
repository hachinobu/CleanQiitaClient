//
//  UserEntity.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserEntity {
    public var description: String?
    public var facebookId: String?
    public var followeesCount: Int?
    public var followersCount: Int?
    public var githubLoginName: String?
    public var id: String?
    public var itemsCount: Int?
    public var linkedinId: String?
    public var location: String?
    public var name: String?
    public var organization: String?
    public var permanentId: Int?
    public var profileImageUrl: String?
    public var twitterScreenName: String?
    public var websiteUrl: String?
}

extension UserEntity: Mappable {
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        description <- map["description"]
        facebookId <- map["facebook_id"]
        followeesCount <- map["followees_count"]
        followersCount <- map["followers_count"]
        githubLoginName <- map["github_login_name"]
        id <- map["id"]
        itemsCount <- map["items_count"]
        linkedinId <- map["linkedin_id"]
        location <- map["location"]
        name <- map["name"]
        organization <- map["organization"]
        permanentId <- map["permanent_id"]
        profileImageUrl <- map["profile_image_url"]
        twitterScreenName <- map["twitter_screen_name"]
        websiteUrl <- map["website_url"]
    }
    
}
