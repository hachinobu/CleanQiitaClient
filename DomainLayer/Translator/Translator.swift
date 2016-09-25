//
//  Translator.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/22.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

protocol Translator {
    associatedtype Input
    associatedtype Output
    
    func translate(_: Input) -> Output
}
