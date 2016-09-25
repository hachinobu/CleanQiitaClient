//
//  ItemBodyCell.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit

protocol ItemBodyCellProtocol {
    func htmlBody() -> String
}

class ItemBodyCell: UITableViewCell {

    @IBOutlet weak var itemBodyWebView: UIWebView!
    
    var vm: ItemBodyCellProtocol! {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemBodyWebView.scrollView.isScrollEnabled = false
    }
    
    private func updateCell() {
        itemBodyWebView.loadHTMLString(vm.htmlBody(), baseURL: nil)
    }

}
