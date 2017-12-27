//
//  AppDelegate+Style.swift
//  CleanQiitaClient
//
//  Created by Nishinobu.Takahiro on 2016/09/26.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Utility

extension AppDelegate {
    
    func configureStyling() {
        
        let tintColor: UIColor = .qiitaMainColor
        
        window?.tintColor = tintColor
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)
        ]
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .blackTranslucent
    }
    
}
