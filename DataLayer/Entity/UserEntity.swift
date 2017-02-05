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
    public let description: String?
    public let facebookId: String?
    public let followeesCount: Int?
    public let followersCount: Int?
    public let githubLoginName: String?
    public let id: String
    public let itemsCount: Int?
    public let linkedinId: String?
    public let location: String?
    public let name: String?
    public let organization: String?
    public let permanentId: Int?
    public let profileImageUrl: String?
    public let twitterScreenName: String?
    public let websiteUrl: String?
}

extension UserEntity: ImmutableMappable {
    
    public init(map: Map) throws {
        description = try? map.value("description")
        facebookId = try? map.value("facebook_id")
        followeesCount = try? map.value("followees_count")
        followersCount = try? map.value("followers_count")
        githubLoginName = try? map.value("github_login_name")
        id = try map.value("id")
        itemsCount = try? map.value("items_count")
        linkedinId = try? map.value("linkedin_id")
        location = try? map.value("location")
        name = try? map.value("name")
        organization = try? map.value("organization")
        permanentId = try? map.value("permanent_id")
        profileImageUrl = try? map.value("profile_image_url")
        twitterScreenName = try? map.value("twitter_screen_name")
        websiteUrl = try? map.value("website_url")
    }
    
}

//extension UserEntity: Mappable {
//    
//    public init?(map: Map) {
//        
//    }
//    
//    mutating public func mapping(map: Map) {
//        description <- map["description"]
//        facebookId <- map["facebook_id"]
//        followeesCount <- map["followees_count"]
//        followersCount <- map["followers_count"]
//        githubLoginName <- map["github_login_name"]
//        id <- map["id"]
//        itemsCount <- map["items_count"]
//        linkedinId <- map["linkedin_id"]
//        location <- map["location"]
//        name <- map["name"]
//        organization <- map["organization"]
//        permanentId <- map["permanent_id"]
//        profileImageUrl <- map["profile_image_url"]
//        twitterScreenName <- map["twitter_screen_name"]
//        websiteUrl <- map["website_url"]
//    }
//    
//}
