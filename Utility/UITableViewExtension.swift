//
//  UITableViewExtension.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/09/30.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("")
        }
        return cell
    }
    
}
