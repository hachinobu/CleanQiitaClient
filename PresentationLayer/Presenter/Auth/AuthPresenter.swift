//
//  AuthPresenter.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol AuthPresenter {
    
    weak var view: AuthPresenterView? { get set }
    
    func checkAlreadyAuthToken()
    func fetchOAuthCode()
    func fetchAccessToken(with code: String)
    
}

public protocol AuthPresenterView: class {
    func segueAllItemList()
}
