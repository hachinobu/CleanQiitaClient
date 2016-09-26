//
//  AuthViewController.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Utility

private extension Selector {
    static let receiveAccessKey = #selector(AuthViewController.receiveOAuthCode(notification:))
}

public class AuthViewController: UIViewController {
    
    private var presenter: AuthPresenter! {
        didSet {
            presenter.view = self
        }
    }
    fileprivate var routing: AuthScreenRouting!
    
    public func injection(presenter: AuthPresenter, routing: AuthScreenRouting) {
        self.presenter = presenter
        self.routing = routing
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.checkAlreadyAuthToken()
        setupNotificationObserver()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: .receiveAccessKey, name: NSNotification.Name(rawValue: AuthInfo.accessTokenNotificationKey), object: nil)
    }
    
    @objc fileprivate func receiveOAuthCode(notification: Notification) {
        guard let userInfo = notification.userInfo, let code = userInfo["code"] as? String else {
            return
        }
        presenter.fetchAccessToken(with: code)
    }
    
    @IBAction func authenticateAction(_ sender: AnyObject) {
        presenter.fetchOAuthCode()
    }

}

extension AuthViewController: AuthPresenterView {
    
    public func segueAllItemList() {
        routing.segueAllItemListScreen()
    }
    
}
