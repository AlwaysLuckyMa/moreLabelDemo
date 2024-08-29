//
//  OnlyViewVC.swift
//  labelMoreDemo
//
//  Created by Matsonga on 2024/8/29.
//

import UIKit

class OnlyViewVC: UIViewController {
    @IBOutlet var titleL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen

        titleL.numberOfLines = 3
        titleL.text = "这是一个多语言字符串的示例。我们将展示不同语言的文本内容。每种语言都带有自己的特色和表达方式。希望这个例子能帮助您了解如何在不同语言中使用文本。这是一个多语言字符串的示例。我们将展示不同语言的文本内容。每种语言都带有自己的特色和表达方式。希望这个例子能帮助您了解如何在不同语言中使用文本。这是一个多语言字符串的示例。我们将展示不同语言的文本内容。每种语言都带有自己的特色和表达方式。希望这个例子能帮助您了解如何在不同语言中使用文本。"

        Tools_TextMoreAndImgToView(in: titleL, replace: "... 查看更多", changeText: "查看更多")
    }
}
