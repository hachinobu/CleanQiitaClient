//
//  ItemRouting.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer

protocol ItemRouting: Routing {
    func segueItemList(userId: String)
}

struct ItemRoutingImpl: ItemRouting {
    
    weak var viewController: UIViewController? {
        didSet {
            viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    func segueItemList(userId: String) {
        
        let dataStore = UserItemDataStoreNetworkImpl()
        let repository = UserItemRepositoryImpl(dataStore: dataStore)
        let useCase = UserItemListUseCaseImpl(repository: repository, userId: userId)
        let presenter = UserItemListPresenterImpl(useCase: useCase)
        
        let navigationController = UIStoryboard(name: "ItemListScreen", bundle: Bundle(for: ItemListViewController.self)).instantiateInitialViewController() as! UINavigationController
        let vc = navigationController.topViewController as! ItemListViewController
        
        var routing = AllItemListRoutingImpl()
        routing.viewController = vc
        vc.injection(presenter: presenter, routing: routing)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
