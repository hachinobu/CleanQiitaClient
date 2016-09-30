//
//  NibLoadableView.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/09/30.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: NibLoadableView {}
