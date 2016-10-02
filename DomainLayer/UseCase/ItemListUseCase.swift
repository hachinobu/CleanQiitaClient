//
//  ItemListUseCase.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import APIKit
import Result
import DataLayer

public protocol ItemListUseCase {
    func fetchItemList(page: Int?, perPage: Int?, handler: @escaping (Result<[ListItemModel], SessionTaskError>) -> Void)
}

public struct AllItemListUseCaseImpl: ItemListUseCase {
    
    let repository: ItemListRepository
    
    public init(repository: ItemListRepository) {
        self.repository = repository
    }
    
    public func fetchItemList(page: Int?, perPage: Int?, handler: @escaping (Result<[ListItemModel], SessionTaskError>) -> Void) {
        
        repository.fetchItemList(page: page, perPage: perPage) { result in
            
            let r = generateItemModelsResultFromItemEntitiesResult(result: result)
            handler(r)
            
        }
        
    }
    
}

public struct UserItemListUseCaseImpl: ItemListUseCase {
    
    let repository: UserItemListRepository
    let userId: String
    
    public init(repository: UserItemListRepository, userId: String) {
        self.repository = repository
        self.userId = userId
    }
    
    public func fetchItemList(page: Int?, perPage: Int?, handler: @escaping (Result<[ListItemModel], SessionTaskError>) -> Void) {
        
        repository.fetchUserItemList(page: page, perPage: perPage, userId: userId) { result in
            
            let r = generateItemModelsResultFromItemEntitiesResult(result: result)
            handler(r)
                        
        }
        
    }
    
}

fileprivate func generateItemModelsResultFromItemEntitiesResult(result: Result<[ItemEntity], SessionTaskError>) -> Result<[ListItemModel], SessionTaskError> {
    
    guard let itemEntities = result.value else {
        return Result.failure(result.error!)
    }
    let listItemModels = ListItemModelsTranslator().translate(itemEntities)
    return Result.success(listItemModels)
    
}

