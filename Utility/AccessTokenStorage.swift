//
//  AccessTokenStorage.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct AccessTokenStorage {
    
    private static let key: String = "accessToken"
    
    public static func fetch() -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    public static func save(accesToken: String) -> Bool {
        UserDefaults.standard.set(accesToken, forKey: key)
        return UserDefaults.standard.synchronize()
    }
    
}
