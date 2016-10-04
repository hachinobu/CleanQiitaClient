//
//  UserItemListRoutingImpl.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/10/04.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer
import PresentationLayer

public class UserItemListRoutingImpl: AllItemListRoutingImpl {
    
    override public func segueItem(id: String) {
        
        let stockersRepository = StockersRepositoryImpl.shared
        let stockRepository = StockItemRepositoryImpl.shared
        let itemRepository = ItemRepositoryImpl.shared
        let useCase = AllItemUseCaseImpl(stockItemRepository: stockRepository, stockersRepository: stockersRepository, itemRepository: itemRepository, itemId: id)
        
        //ItemPresenterImplFromUserItemを使うとタップした時にRoutingを呼ばないPresenter
        //        let presenter = ItemPresenterImplFromUserItem(useCase: useCase)
        
        let presenter = ItemPresenterImplFromAllItem(useCase: useCase)
        
        let vc = UIStoryboard(name: "ItemScreen", bundle: Bundle(for: ItemViewController.self)).instantiateInitialViewController() as! ItemViewController
        let routing = UserItemRoutingImpl()
        routing.viewController = vc
        
        vc.injection(presenter: presenter, routing: routing)
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
