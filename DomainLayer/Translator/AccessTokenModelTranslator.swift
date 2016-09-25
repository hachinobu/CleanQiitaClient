//
//  AccessTokenModelTranslator.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DataLayer

internal struct AccessTokenModelTranslator: Translator {
    
    internal func translate(_ entity: AccessTokenEntity) -> AccessTokenModel {
        let clientId: String = entity.clientId ?? ""
        let scopes: [String] = entity.scopes ?? []
        let token: String = entity.token ?? ""
        
        return AccessTokenModel(clientId: clientId, scopes: scopes, token: token)
    }
    
}
