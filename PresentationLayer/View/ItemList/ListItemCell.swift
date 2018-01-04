//
//  ListItemCell.swift
//  CleanQiitaClient
//
//  Created by Takahiro Nishinobu on 2016/09/23.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit
import Nuke

public protocol ListItemDisplayProtocol {
    func displayPostUserInfo() -> String?
    func displayTitle() -> String?
    func fetchProfileImageURL() -> URL?
    func displayTag() -> String?
    func userName() -> String
}

class ListItemCell: UITableViewCell {

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
        profileImageView.image = nil
        Manager.shared.loadImage(with: imageURL, into: profileImageView)
    }

}
