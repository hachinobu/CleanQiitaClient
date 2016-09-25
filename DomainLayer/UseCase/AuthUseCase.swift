//
//  AccessTokenUseCase.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import Result
import APIKit
import DataLayer

public protocol AuthUseCase {
    func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<AccessTokenModel, SessionTaskError>) -> ())
    func save(accessToken: String, handler: (_ isSuccess: Bool) -> Void)
    func alreadyHasToken(handler: (_ hasToken: Bool) -> Void)
}

public struct AuthUseCaseImpl: AuthUseCase {
    
    private let authRepository: AuthRepository
    private let accessTokenRepository: AccessTokenRepository
    
    public init(authRepository: AuthRepository, accessTokenRepository: AccessTokenRepository) {
        self.authRepository = authRepository
        self.accessTokenRepository = accessTokenRepository
    }
    
    public func publishAccessToken(clientId: String, clientSecret: String, code: String, handler: @escaping (Result<AccessTokenModel, SessionTaskError>) -> ()) {
        authRepository.publishAccessToken(clientId: clientId, clientSecret: clientSecret, code: code) { result in
            guard let entity = result.value else {
                handler(Result.failure(result.error!))
                return
            }
            let model = AccessTokenModelTranslator().translate(entity)
            handler(Result.success(model))
        }
    }
    
    public func save(accessToken: String, handler: (Bool) -> Void) {
        accessTokenRepository.save(accessToken: accessToken, handler: handler)
    }
    
    public func alreadyHasToken(handler: (Bool) -> Void) {
        accessTokenRepository.alreadyHasToken(handler: handler)
    }
    
}
