//
//  AccessTokenModel.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public struct AccessTokenModel {
    public let clientId: String
    public let scopes: [String]
    public let token: String
}
