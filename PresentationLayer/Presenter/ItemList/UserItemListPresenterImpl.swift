//
//  UserItemListPresenterImpl.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

class UserItemListPresenterImpl: AllItemListPresenterImpl {
    
    override func setupUI() {
        view?.setupNavigation(title: "ユーザー投稿一覧")
    }
    
}
