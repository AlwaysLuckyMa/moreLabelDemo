# 文字末尾加上查看更多和图片

#### GIF 示例 (不挂 VPN 查看不了 GIF)

<div style="display: flex; justify-content: space-between;">
  <img src="img/1.PNG" marginTop="0" width="40%" height="40%"> 
  <img src="img/2.PNG" width="40%" height="40%"> 
  <img src="img/3.jpg" width="40%" height="40%"> 
  <img src="img/4.jpg" width="40%" height="40%"> 
</div>

### 核心方法

```swift
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
```

## 如有问题或疑问，请通过电子邮件或 QQ 联系我！

##### If you have any questions or concerns, please contact me via email or QQ!

E-mail：matsonga@163.com
