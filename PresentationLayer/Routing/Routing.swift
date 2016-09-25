//
//  Routing.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol Routing {
    weak var viewController: UIViewController? { get set }
}
