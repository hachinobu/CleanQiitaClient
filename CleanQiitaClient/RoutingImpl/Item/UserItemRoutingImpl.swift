//
//  UserItemRoutingImpl.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/10/04.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer
import DomainLayer
import PresentationLayer

class UserItemRoutingImpl: ItemRoutingImpl {
    
    override func segueItemList(userId: String) {
        let _ = viewController?.navigationController?.popViewController(animated: true)
    }
    
}
