//
//  ItemSummaryVM.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation
import DomainLayer

protocol ItemSummaryProtocol {
    func tableRowCount() -> Int
    func fetchItemHeaderVM() -> ItemHeaderCellProtocol
    func fetchItemBodyVM() -> ItemBodyCellProtocol
}

struct ItemSummaryVM {
    
    fileprivate let itemModel: ItemModel
    
    init(itemModel: ItemModel) {
        self.itemModel = itemModel
    }
    
}

extension ItemSummaryVM: ItemSummaryProtocol {
    
    func tableRowCount() -> Int {
        return 2
    }
    
    func fetchItemHeaderVM() -> ItemHeaderCellProtocol {
        return ItemHeaderVM(itemModel: itemModel)
    }
    
    func fetchItemBodyVM() -> ItemBodyCellProtocol {
        return ItemBodyVM(body: itemModel.htmlBody)
    }
    
}

//MARK: ItemHeaderVM
struct ItemHeaderVM {
    fileprivate let itemModel: ItemModel
}

extension ItemHeaderVM: ItemHeaderCellProtocol {
    
    func userId() -> String {
        return itemModel.userId
    }
    
    func displayTitle() -> String? {
        return itemModel.title
    }
    
    func displayTag() -> String? {
        return itemModel.tagList.joined(separator: ",")
    }
    
    func userImageURL() -> URL? {
        return URL(string: itemModel.profileImageURL)
    }
    
    func userName() -> String? {
        return itemModel.userName
    }
    
    func stockCount() -> String? {
        if itemModel.stockCount > 99 {
            return "100+ ストック"
        }
        return "\(itemModel.stockCount)ストック"
    }
    
    func buttonTitle() -> String? {
        return itemModel.hasStock ? "ストック済み" : "ストック"
    }
    
    func buttonColorInfo() -> (backgroundColor: UIColor, textColor: UIColor)? {
        if itemModel.hasStock {
            return (UIColor.green, UIColor.white)
        }
        return (UIColor.white, UIColor.black)
    }
    
}

//MARK: ItemBodyVM
struct ItemBodyVM {
    fileprivate let body: String
}

extension ItemBodyVM: ItemBodyCellProtocol {
    
    func htmlBody() -> String {
        return body
    }
    
}

