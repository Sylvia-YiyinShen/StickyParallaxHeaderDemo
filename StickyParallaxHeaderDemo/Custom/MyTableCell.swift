//
//  MyTableCell.swift
//  StickeyParallaxHeaderDemo
//
//  Created by Yiyin Shen on 17/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.themeYellow
        selectionStyle = .none
    }
}
