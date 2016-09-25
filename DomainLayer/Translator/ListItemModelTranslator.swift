//
//  ListItemModelTranslator.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer

struct ListItemModelsTranslator: Translator {
    
    func translate(_ entities: [ItemEntity]) -> [ListItemModel] {
        return entities.map { ListItemModelTranslator().translate($0) }
    }
    
}

struct ListItemModelTranslator: Translator {
    
    func translate(_ entity: ItemEntity) -> ListItemModel {
        
        let id = entity.id ?? ""
        let userName = entity.user?.id ?? ""
        let title = entity.title ?? ""
        let tagList = entity.tagList?.flatMap { $0.name } ?? []
        let profileImageURL = entity.user?.profileImageUrl ?? ""
        
        return ListItemModel(id: id, userName: userName, title: title, tagList: tagList, profileImageURL: profileImageURL)
        
    }
    
}
