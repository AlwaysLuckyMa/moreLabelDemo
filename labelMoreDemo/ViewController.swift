//
//  ViewController.swift
//  labelMoreDemo
//
//  Created by Matsonga on 2024/8/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    private let titleArr = ["这是一个多语言字符串的示例。我们将展示不同语言的文本内容。每种语言都带有自己的特色和表达方式。希望这个例子能帮助您了解如何在不同语言中使用文本。\n这是一个多语言字符串的示例。我们将展示不同语言的文本内容。每种语言都带有自己的特色和表达方式。希望这个例子能帮助您了解如何在不同语言中使用文本。",

                            "This is a sample of a multi-language string. We will display text content in different languages. Each language comes with its own unique features and expressions. Hopefully, this example helps you understand how to use text in various languages.This is a sample of a multi-language string. We will display text content in different languages. Each language comes with its own unique features and expressions. Hopefully, this example helps you understand how to use text in various languages.",

                            "これは多言語文字列のサンプルです。異なる言語でのテキスト内容を表示します。各言語には独自の特徴や表現があります。この例が、異なる言語でのテキストの使い方を理解する手助けになればと思います。これは多言語文字列のサンプルです。異なる言語でのテキスト内容を表示します。各言語には独自の特徴や表現があります。この例が、異なる言語でのテキストの使い方を理解する手助けになればと思います。",

                            "이것은 다국어 문자열의 예입니다. 각 언어의 특성과 표현 방식이 담긴 텍스트 콘텐츠를 보여드릴 것입니다. 이 예제가 다양한 언어에서 텍스트를 사용하는 방법을 이해하는 데 도움이 되기를 바랍니다.이것은 다국어 문자열의 예입니다. 각 언어의 특성과 표현 방식이 담긴 텍스트 콘텐츠를 보여드릴 것입니다. 이 예제가 다양한 언어에서 텍스트를 사용하는 방법을 이해하는 데 도움이 되기를 바랍니다.",

                            "Это пример многоязычной строки. Мы продемонстрируем текстовый контент на разных языках, каждый из которых имеет свои особенности и выражения. Надеюсь, этот пример поможет вам понять, как использовать текст на разных языках.",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MoreCell", bundle: nil), forCellReuseIdentifier: "MoreCell")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as! MoreCell
        cell.model = titleArr[indexPath.row]
//        cell.backgroundColor = UIColor(red: CGFloat(Double(arc4random_uniform(256)) / 255.0), green: CGFloat(Double(arc4random_uniform(256)) / 255.0), blue: CGFloat(Double(arc4random_uniform(256)) / 255.0), alpha: 1.0)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginVC = OnlyViewVC()
        present(loginVC, animated: true)
    }
}
