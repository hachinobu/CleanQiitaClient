//
//  ItemUseCase.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/24.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import PromiseKit
import APIKit
import DataLayer
//https://github.com/Alamofire/Alamofire/issues/1271#issuecomment-224517739
//https://github.com/antitypical/Result/issues/77
import enum Result.Result

public protocol ItemUseCase {
    func putStock(handler: @escaping (Result<Void, SessionTaskError>) -> Void)
    func deleteStock(handler: @escaping (Result<Void, SessionTaskError>) -> Void)
    func fetchItem(handler: @escaping (Result<ItemModel, SessionTaskError>) -> Void)
}

public struct AllItemUseCaseImpl: ItemUseCase {
    
    let stockItemRepository: StockItemRepository
    let stockersRepository: StockersRepository
    let itemRepository: ItemRepository
    let itemId: String
    
    public init(stockItemRepository: StockItemRepository,
                stockersRepository: StockersRepository,
                itemRepository: ItemRepository,
                itemId: String) {
        self.stockItemRepository = stockItemRepository
        self.stockersRepository = stockersRepository
        self.itemRepository = itemRepository
        self.itemId = itemId
    }
    
    public func putStock(handler: @escaping (Result<Void, SessionTaskError>) -> Void) {
        stockItemRepository.putStock(itemId: itemId, handler: handler)
    }
    
    public func deleteStock(handler: @escaping (Result<Void, SessionTaskError>) -> Void) {
        stockItemRepository.deleteStock(itemId: itemId, handler: handler)
    }
    
    public func fetchItem(handler: @escaping (Result<ItemModel, SessionTaskError>) -> Void) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        firstly {
            when(fulfilled: generateStockersPromise(), generateItemEntityPromise(), generateStockStatePromise())
        }.then { (stockers, item, hasStock) -> Void in
            let itemModel = ItemModelTranslator().translate((itemEntity: item, stockers: stockers, hasStock: hasStock))
            handler(Result.success(itemModel))
        }.always {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }.catch { error in
            handler(Result.failure(error as! SessionTaskError))
        }
        
    }
    
}

extension AllItemUseCaseImpl {
    
    fileprivate func generateStockersPromise() -> Promise<GetItemStockersRequest.Response> {
        
        return Promise<GetItemStockersRequest.Response> { (fulfill, reject) in
            
            self.stockersRepository.fetchStockers(itemId: self.itemId) { result in
                guard let value = result.value else {
                    reject(result.error!)
                    return
                }
                fulfill(value)
            }
            
        }
        
    }
    
    fileprivate func generateStockStatePromise() -> Promise<GetHasStockRequest.Response> {
        
        return Promise<GetHasStockRequest.Response> { (fulfill, reject) in
            self.stockItemRepository.hasStock(itemId: self.itemId) { result in
                guard let value = result.value else {
                    reject(result.error!)
                    return
                }
                fulfill(value)
            }
        }
        
    }
    
    fileprivate func generateItemEntityPromise() -> Promise<GetItemNetworkRequest.Response> {
        
        return Promise<GetItemNetworkRequest.Response> { (fulfill, reject) in
            self.itemRepository.fetchItemDetail(itemId: self.itemId) { result in
                guard let value = result.value else {
                    reject(result.error!)
                    return
                }
                fulfill(value)
            }
        }
        
    }
    
}
