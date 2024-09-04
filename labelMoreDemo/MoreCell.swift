//
//  MoreCell.swift
//  labelMoreDemo
//
//  Created by Matsonga on 2024/8/29.
//

import UIKit

class MoreCell: UITableViewCell {
    var model: String = "" {
        didSet {
            titleL.text = model
            Tools_TextMoreAndImgToCell(in: titleL, replace: "... 介绍更多", changeText: "介绍更多", changeColor: .green, image: UIImage(named: "jieshao"), isShowImg: false)
        }
    }

    @IBOutlet var titleL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
