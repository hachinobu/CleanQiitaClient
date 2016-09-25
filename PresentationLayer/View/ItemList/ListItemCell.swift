//
//  ListItemCell.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Kingfisher

public protocol ListItemDisplayProtocol {
    func displayPostUserInfo() -> String?
    func displayTitle() -> String?
    func fetchProfileImageURL() -> URL?
    func displayTag() -> String?
    func userName() -> String
}

class ListItemCell: UITableViewCell {

    static let identifier: String = "ListItemCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postUserLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContents(displayVM: ListItemDisplayProtocol) {
        postUserLabel.text = displayVM.displayPostUserInfo()
        titleLabel.text = displayVM.displayTitle()
        tagLabel.text = displayVM.displayTag()
        downloadUserProfileImage(displayVM: displayVM)
    }
    
    private func downloadUserProfileImage(displayVM: ListItemDisplayProtocol) {
        guard let imageURL = displayVM.fetchProfileImageURL() else {
            return
        }
        let resource = ImageResource(downloadURL: imageURL, cacheKey: displayVM.userName())
        profileImageView.kf.indicatorType = .activity
        profileImageView.kf.setImage(with: resource, placeholder: nil, options: [.transition(ImageTransition.fade(1)), .cacheMemoryOnly], progressBlock: nil, completionHandler: nil)
    }

}
