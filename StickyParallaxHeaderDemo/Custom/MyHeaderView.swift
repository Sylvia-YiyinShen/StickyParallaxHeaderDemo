//
//  MyHeaderView.swift
//  StickeyParallaxHeaderDemo
//
//  Created by Yiyin Shen on 17/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class MyHeaderView: ParallaxHeaderBaseView {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.bounds.width / 2
        avatarImage.clipsToBounds = true
    }
    
    override func updateViews(scale: CGFloat) {
        super.updateViews(scale: scale)
        imageWidth.constant = 100 * scale
        avatarImage.layer.cornerRadius = imageWidth.constant / 2
        topView.alpha = scale
        bottomView.alpha = scale
    }
}
