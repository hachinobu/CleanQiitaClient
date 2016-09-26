//
//  AppDelegate.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Utility
import DataLayer
import DomainLayer
import PresentationLayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var authScreen: UIViewController {
        
        let authDataStore = AuthDataStoreNetworkImpl()
        let authRepository = AuthRepositoryImpl(dataStore: authDataStore)
        
        let tokenDataStore = AccessTokenDataStoreImpl()
        let tokenRepository = AccessTokenRepositoryImpl(dataStore: tokenDataStore)
        
        let useCase = AuthUseCaseImpl(authRepository: authRepository, accessTokenRepository: tokenRepository)
        let presenter = AuthPresenterImpl(useCase: useCase)
        let viewController = UIStoryboard(name: "AuthScreen", bundle: Bundle(for: AuthViewController.self)).instantiateInitialViewController() as! AuthViewController
        viewController.injection(presenter: presenter, routing: AuthScreenRoutingImpl())
        
        return viewController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureStyling()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = authScreen
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        fetchAuthorizeCode(from: url)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

