//
//  AuthScreenRoutingImpl.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/10/04.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer
import PresentationLayer

public struct AuthScreenRoutingImpl: AuthScreenRouting {
    
    weak public var viewController: UIViewController?
    
    public init() {
        
    }
    
    public func segueAllItemListScreen() {
        
        let repository = ItemListRepositoryImpl.shared
        let useCase = AllItemListUseCaseImpl(repository: repository)
        let presenter = AllItemListPresenterImpl(useCase: useCase)
        
        let navigationController = UIStoryboard(name: "ItemListScreen", bundle: Bundle(for: ItemListViewController.self)).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! ItemListViewController
        
        let routing = AllItemListRoutingImpl()
        routing.viewController = viewController
        viewController.injection(presenter: presenter, routing: routing)
        
        UIApplication.shared.delegate?.window??.rootViewController = navigationController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = navigationController
        appDelegate?.window??.makeKeyAndVisible()
        
    }
    
}

