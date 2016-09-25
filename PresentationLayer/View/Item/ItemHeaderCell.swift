//
//  ItemHeaderCell.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/25.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Kingfisher

protocol ItemHeaderCellProtocol {
    func userId() -> String
    func displayTitle() -> String?
    func displayTag() -> String?
    func userImageURL() -> URL?
    func userName() -> String?
    func stockCount() -> String?
    func buttonTitle() -> String?
    func buttonColorInfo() -> (backgroundColor: UIColor, textColor: UIColor)?
}

fileprivate extension Selector {
    static let tappedUser = #selector(ItemHeaderCell.tappedUserButton(sender:))
    static let tappedStock = #selector(ItemHeaderCell.tappedStockButton(sender:))
}

class ItemHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var stockCountLabel: UILabel!
    @IBOutlet weak var stockButton: UIButton!
    
    var vm: ItemHeaderCellProtocol! {
        didSet {
            updateCell()
        }
    }
    var presenter: ItemPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stockButton.layer.cornerRadius = 4.0
        userButton.addTarget(self, action: .tappedUser, for: .touchUpInside)
        stockButton.addTarget(self, action: .tappedStock, for: .touchUpInside)
    }
    
    func updateCell() {
        titleLabel.text = vm.displayTitle()
        tagLabel.text = vm.displayTag()
        stockCountLabel.text = vm.stockCount()
        downloadUserProfileImage(vm: vm)
        
        let buttonColorInfo = vm.buttonColorInfo()
        stockButton.backgroundColor = buttonColorInfo?.backgroundColor
        stockButton.setTitleColor(buttonColorInfo?.textColor, for: .normal)
        stockButton.setTitle(vm.buttonTitle(), for: .normal)
        userButton.setTitle(vm.userName(), for: .normal)
    }
    
    private func downloadUserProfileImage(vm: ItemHeaderCellProtocol) {
        
        guard let imageURL = vm.userImageURL() else {
            return
        }
        
        let resource = ImageResource(downloadURL: imageURL, cacheKey: vm.userName())
        profileImageView.kf.indicatorType = .activity
        profileImageView.kf.setImage(with: resource, placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: nil, completionHandler: nil)
    }
    
    func tappedStockButton(sender: AnyObject) {
        presenter?.tappedStock()
    }
    
    func tappedUserButton(sender: AnyObject) {
        presenter?.tappedUser(userId: vm.userId())
    }

}
