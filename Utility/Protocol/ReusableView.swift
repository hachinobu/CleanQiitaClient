//
//  ReusableView.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/09/30.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView {}
