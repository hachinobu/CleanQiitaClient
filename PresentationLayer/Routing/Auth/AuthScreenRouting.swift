//
//  AuthScreenRouting.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer

public protocol AuthScreenRouting: Routing {
    func segueAllItemListScreen()
}

public struct AuthScreenRoutingImpl: AuthScreenRouting {
    
    weak public var viewController: UIViewController?
    
    public init() {
        
    }
    
    public func segueAllItemListScreen() {
        
        let dataStore = AllItemDataStoreNetworkImpl()
        let repository = AllItemRepositoryImpl(dataStore: dataStore)
        let useCase = AllItemListUseCaseImpl(repository: repository)
        let presenter = AllItemListPresenterImpl(useCase: useCase)
        
        let navigationController = UIStoryboard(name: "ItemListScreen", bundle: Bundle(for: ItemListViewController.self)).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! ItemListViewController
        
        let routing = AllItemListRoutingImpl()
        routing.viewController = viewController
        viewController.injection(presenter: presenter, routing: routing)
        
        UIApplication.shared.delegate?.window!?.rootViewController = navigationController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = navigationController
        appDelegate?.window??.makeKeyAndVisible()
        
    }
    
}
