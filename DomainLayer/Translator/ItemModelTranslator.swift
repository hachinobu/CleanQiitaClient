//
//  ItemModelTranslator.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer

struct ItemModelTranslator: Translator {
    
    func translate(_ entities: (itemEntity: ItemEntity, stockers: [UserEntity], hasStock: Bool)) -> ItemModel {
        
        let itemId = entities.itemEntity.id ?? ""
        let userId = entities.itemEntity.user?.id ?? ""
        let userName = entities.itemEntity.user?.id ?? ""
        let profileImageURL = entities.itemEntity.user?.profileImageUrl ?? ""
        let title = entities.itemEntity.title ?? ""
        let tagList = entities.itemEntity.tagList?.flatMap { $0.name } ?? []
        let htmlBody = entities.itemEntity.renderedBody ?? ""
        let stockCount = entities.stockers.count
        let hasStock = entities.hasStock
        
        return ItemModel(itemId: itemId,
                         userId: userId,
                         userName: userName,
                         profileImageURL: profileImageURL,
                         title: title,
                         tagList: tagList,
                         htmlBody: htmlBody,
                         stockCount: stockCount,
                         hasStock: hasStock)
        
    }
    
}
