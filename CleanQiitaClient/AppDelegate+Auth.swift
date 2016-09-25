//
//  AppDelegate+Auth.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Utility

extension AppDelegate {
    
    func fetchAuthorizeCode(from url: URL) {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard
            let scheme = urlComponents?.scheme,
            scheme.hasPrefix(Secrets.redirectUrlScheme),
            let queryItems = urlComponents?.queryItems else {
            return
        }
        
        let queryInfo = queryItems.reduce([String: String]()) { (dict, item) in
            var queryInfo = dict
            let value = item.value ?? ""
            queryInfo[item.name] = value
            return queryInfo
        }
        
        guard let code = queryInfo["code"], let state = queryInfo["state"], state == Secrets.accessTokenState else {
            return
        }
        
        let authorizeCodeInfo = ["code": code]
        post(authorizeCodeInfo: authorizeCodeInfo)
        
    }
    
    private func post(authorizeCodeInfo info: [AnyHashable : Any]?) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Secrets.accessTokenNotificationKey), object: nil, userInfo: info)
    }
    
}
