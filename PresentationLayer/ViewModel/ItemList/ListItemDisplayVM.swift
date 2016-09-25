//
//  ListItemDisplayVM.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer

struct ListItemDisplayVM {
    
    fileprivate let item: ListItemModel
    
    init(item: ListItemModel) {
        self.item = item
    }
    
}

extension ListItemDisplayVM: ListItemDisplayProtocol {
    
    func displayPostUserInfo() -> String? {
        return item.userName + "が投稿しました"
    }
    
    func displayTitle() -> String? {
        return item.title
    }
    
    func displayTag() -> String? {
        return item.tagList.joined(separator: ",")
    }
    
    func fetchProfileImageURL() -> URL? {
        return URL(string: item.profileImageURL)
    }
    
    func userName() -> String {
        return item.userName
    }
    
}
