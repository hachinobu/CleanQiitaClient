//
//  ItemRouting.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol ItemRouting: Routing {
    func segueItemList(userId: String)
}

//public class ItemRoutingImpl: ItemRouting {
//    
//    weak public var viewController: UIViewController? {
//        didSet {
//            viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        }
//    }
//    
//    public func segueItemList(userId: String) {
//        
//        let repository = UserItemListRepositoryImpl.shared
//        let useCase = UserItemListUseCaseImpl(repository: repository, userId: userId)
//        let presenter = UserItemListPresenterImpl(useCase: useCase)
//        
//        let navigationController = UIStoryboard(name: "ItemListScreen", bundle: Bundle(for: ItemListViewController.self)).instantiateInitialViewController() as! UINavigationController
//        let vc = navigationController.topViewController as! ItemListViewController
//        
//        let routing = UserItemListRoutingImpl()
//        routing.viewController = vc
//        vc.injection(presenter: presenter, routing: routing)
//        
//        viewController?.navigationController?.pushViewController(vc, animated: true)
//        
//    }
//    
//}
//
//
//public class UserItemRoutingImpl: ItemRoutingImpl {
//    
//    override public func segueItemList(userId: String) {
//        let _ = viewController?.navigationController?.popViewController(animated: true)
//    }
//    
//}
