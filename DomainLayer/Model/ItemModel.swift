//
//  ItemModel.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct ItemModel {
    public let itemId: String
    public let userId: String
    public let userName: String
    public let profileImageURL: String
    public let title: String
    public let tagList: [String]
    public let htmlBody: String
    public let stockCount: Int
    public var hasStock: Bool
    
    mutating public func updateHasStock(state: Bool) {
        hasStock = state
    }
}
