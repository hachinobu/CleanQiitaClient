//
//  ItemRoutingImpl.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/10/04.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer
import PresentationLayer

class ItemRoutingImpl: ItemRouting {
    
    weak var viewController: UIViewController? {
        didSet {
            viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    func segueItemList(userId: String) {
        
        let repository = UserItemListRepositoryImpl.shared
        let useCase = UserItemListUseCaseImpl(repository: repository, userId: userId)
        let presenter = UserItemListPresenterImpl(useCase: useCase)
        
        let navigationController = UIStoryboard(name: "ItemListScreen", bundle: Bundle(for: ItemListViewController.self)).instantiateInitialViewController() as! UINavigationController
        let vc = navigationController.topViewController as! ItemListViewController
        
        let routing = UserItemListRoutingImpl()
        routing.viewController = vc
        vc.injection(presenter: presenter, routing: routing)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
