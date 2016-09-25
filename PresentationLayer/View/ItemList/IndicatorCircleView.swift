//
//  IndicatorCircleView.swift
//  OAuthSample
//
//  Created by Nishinobu.Takahiro on 2016/09/13.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import UIKit

class IndicatorCircleView: UIView {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicator.hidesWhenStopped = true
        indicator.isHidden = true
    }
    
    func startAnimation() {
        if indicator.isAnimating {
            return
        }
        indicator.startAnimating()
    }
    
    func stopAnimation() {
        guard indicator.isAnimating else {
            return
        }
        indicator.stopAnimating()
    }
    
    func isAnimating() -> Bool {
        return indicator.isAnimating
    }
    
}
