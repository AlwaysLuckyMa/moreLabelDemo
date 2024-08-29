
//
//  Tool.swift
//
//
//  Created by Matsonga on 2024/08/29.
//

import CoreText

func Tools_TextMoreAndImgToCell(in label: UILabel,
                                alignment: NSTextAlignment = .justified,
                                replace replacementText: String = "... 查看更多",
                                changeText: String = "查看更多",
                                changeColor: UIColor = UIColor.black,
                                image: UIImage? = UIImage(systemName: "chevron.right")) {
    guard let originalText = label.text, !originalText.isEmpty else { return }
    guard let image = image else { return }
    label.text = ""

    let numberLine = label.numberOfLines
    let font = label.font ?? UIFont.systemFont(ofSize: 13)
    let labelWidth = label.frame.width
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = alignment
    paragraphStyle.lineSpacing = 5.0
    let fullAttributedText = NSMutableAttributedString(string: originalText, attributes: [.font: font, .paragraphStyle: paragraphStyle])

    let textRect = fullAttributedText.boundingRect(with: CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
    let totalHeight = textRect.height
    let lineHeightWithSpacing = font.lineHeight + paragraphStyle.lineSpacing
    let allLines = Int(ceil(totalHeight / lineHeightWithSpacing))

    if numberLine == 0 || allLines <= numberLine {
        label.attributedText = fullAttributedText
        return
    }
    let imgAttributed = NSTextAttachment()
    imgAttributed.image = image
    let imageHeight = font.capHeight
    let imageWidth = image.size.width * (imageHeight / image.size.height)
    imgAttributed.bounds = CGRect(x: 0, y: (font.capHeight - imageHeight) / 2, width: imageWidth, height: imageHeight)

    var truncatedText = originalText
    var truncatedAttributedText: NSMutableAttributedString

    var start = 0
    var end = originalText.count

    // 二分查找算法
    // 使用二分查找主要是为了在多 cell 的时候优化性能
    while start < end {
        let mid = (start + end) / 2
        let substring = String(originalText.prefix(mid))
        truncatedAttributedText = NSMutableAttributedString(string: substring + replacementText, attributes: [.font: font, .paragraphStyle: paragraphStyle])
        let range = (substring + replacementText).range(of: changeText)
        if let range = range {
            let nsRange = NSRange(range, in: substring + replacementText)
            truncatedAttributedText.addAttributes([.foregroundColor: changeColor], range: nsRange)
        }
        truncatedAttributedText.append(NSAttributedString(attachment: imgAttributed))

        let truncatedRect = truncatedAttributedText.boundingRect(with: CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        let truncatedHeight = truncatedRect.height
        let numberOfLinesUsed = Int(ceil(truncatedHeight / lineHeightWithSpacing))

        if numberOfLinesUsed <= numberLine {
            start = mid + 1
            truncatedText = substring
        } else {
            end = mid
        }
    }
    truncatedText = String(originalText.prefix(start - 1))
    truncatedAttributedText = NSMutableAttributedString(string: truncatedText + replacementText, attributes: [.font: font, .paragraphStyle: paragraphStyle])
    let range = (truncatedText + replacementText).range(of: changeText)
    if let range = range {
        let nsRange = NSRange(range, in: truncatedText + replacementText)
        truncatedAttributedText.addAttributes([.foregroundColor: changeColor], range: nsRange)
    }
    truncatedAttributedText.append(NSAttributedString(attachment: imgAttributed))
    label.attributedText = truncatedAttributedText
    label.sizeToFit()
}

func Tools_TextMoreAndImgToView(in label: UILabel,
                                alignment: NSTextAlignment = .justified,
                                replace replacementText: String = "... 查看更多",
                                changeText: String = "查看更多",
                                changeColor: UIColor = UIColor.black,
                                image: UIImage? = UIImage(systemName: "chevron.right")) {
    guard let originalText = label.text, !originalText.isEmpty else { return }
    guard let image = image else { return }
    label.text = ""
    DispatchQueue.main.async {
        let numberLine = label.numberOfLines
        let font = label.font ?? UIFont.systemFont(ofSize: 13)
        let labelWidth = label.frame.width
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = 5.0
        let fullAttributedText = NSMutableAttributedString(string: originalText, attributes: [.font: font, .paragraphStyle: paragraphStyle])

        let textRect = fullAttributedText.boundingRect(with: CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        let totalHeight = textRect.height
        let lineHeightWithSpacing = font.lineHeight + paragraphStyle.lineSpacing
        let allLines = Int(ceil(totalHeight / lineHeightWithSpacing))

        if numberLine == 0 || allLines <= numberLine {
            label.attributedText = fullAttributedText
            return
        }
        let imgAttributed = NSTextAttachment()
        imgAttributed.image = image
        let imageHeight = font.capHeight + 2
        let imageWidth = image.size.width * (imageHeight / image.size.height)
        imgAttributed.bounds = CGRect(x: 0, y: (font.capHeight - imageHeight) / 2, width: imageWidth - 2, height: imageHeight)

        var truncatedText = originalText
        var truncatedAttributedText: NSMutableAttributedString

        var start = 0
        var end = originalText.count

        // 二分查找算法
        while start < end {
            let mid = (start + end) / 2
            let substring = String(originalText.prefix(mid))
            truncatedAttributedText = NSMutableAttributedString(string: substring + replacementText, attributes: [.font: font, .paragraphStyle: paragraphStyle])
            let range = (substring + replacementText).range(of: changeText)
            if let range = range {
                let nsRange = NSRange(range, in: substring + replacementText)
                truncatedAttributedText.addAttributes([.foregroundColor: changeColor], range: nsRange)
            }
            truncatedAttributedText.append(NSAttributedString(attachment: imgAttributed))
            let truncatedRect = truncatedAttributedText.boundingRect(with: CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
            let truncatedHeight = truncatedRect.height
            let numberOfLinesUsed = Int(ceil(truncatedHeight / lineHeightWithSpacing))
            if numberOfLinesUsed <= numberLine {
                start = mid + 1
                truncatedText = substring
            } else {
                end = mid
            }
        }
        truncatedText = String(originalText.prefix(start - 1))
        truncatedAttributedText = NSMutableAttributedString(string: truncatedText + replacementText, attributes: [.font: font, .paragraphStyle: paragraphStyle])
        let range = (truncatedText + replacementText).range(of: changeText)
        if let range = range {
            let nsRange = NSRange(range, in: truncatedText + replacementText)
            truncatedAttributedText.addAttributes([.foregroundColor: changeColor], range: nsRange)
        }
        truncatedAttributedText.append(NSAttributedString(attachment: imgAttributed))
        label.attributedText = truncatedAttributedText
        label.sizeToFit()
    }
}

import UIKit
