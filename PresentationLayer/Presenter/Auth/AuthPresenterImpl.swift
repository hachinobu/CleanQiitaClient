//
//  AuthPresenterImpl.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer
import Utility

public struct AuthPresenterImpl: AuthPresenter {
    
    public weak var view: AuthPresenterView?
    
    public let useCase: AuthUseCase
    
    public init(useCase: AuthUseCase) {
        self.useCase = useCase
    }
    
    public func checkAlreadyAuthToken() {
        useCase.alreadyHasToken { result in
            guard result else {
                return
            }
            self.view?.segueAllItemList()
        }
    }
    
    public func fetchOAuthCode() {
        let url: String = "http://qiita.com/api/v2/oauth/authorize?client_id=\(Secrets.clientId)&scope=read_qiita+write_qiita&state=\(Secrets.accessTokenState)"
        UIApplication.shared.open(URL(string: url)!)
    }
    
    public func fetchAccessToken(with code: String) {
        useCase.publishAccessToken(clientId: Secrets.clientId, clientSecret: Secrets.clientSecret, code: code) { result in
            guard let token = result.value?.token else {
                return
            }
            self.save(accessToken: token)
        }
    }
    
    private func save(accessToken: String) {
        useCase.save(accessToken: accessToken) { result in
            guard result else {
                return
            }
            self.view?.segueAllItemList()
        }
    }
    
}

