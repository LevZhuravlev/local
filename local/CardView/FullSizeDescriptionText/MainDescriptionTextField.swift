//
//  MainDescriptionTextField.swift
//  local
//
//  Created by Zhuravlev Lev on 08.04.2021.
//

import UIKit

class TextField: UILabel {

    var needButton = false
    var height: CGFloat = 0
    var maxHeight: CGFloat = 0
    var textHeightAnchor: NSLayoutConstraint!
    var descriptionTextSize: CGSize = CGSize(width: 0, height: 0)
    var maxLine: CGFloat = 5

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

// MARK: - TEXT FOR MODEL OPTIONAL
        let myText = "I'm the author of FXLabel, and whilst I don't know Manish, I believe he was trying to help (if he was advertising for me, I certainly didn't ask him to, and I'm not paying him - sorry Manish!). One of FXLabel's features is that it respects the UIContentMode property of the label, as set in Interface builder. This means you can set label.contentMode = UIViewContentModeTop; to align the text to the top of the label view \n I'm the author of FXLabel, and whilst I don't know Manish, I believe he was trying to help (if he was advertising for me, I certainly didn't ask him to, and I'm not paying him - sorry Manish!). One of FXLabel's features is that it respects \t the UIContentMode property of the label, as set in Interface builder. This means you can set label.contentMode = UIViewContentModeTop; to align the text😁 to the top of the label view \n \n I'm the author of FXLabel, and whilst I don't know Manish, I believe he was trying to help (if he was ad😁vertising for me, I certainly didn't ask him to, and I'm not paying him - sorry Manish!). One of FXLabel's features is that it respects the UIContentMode property of the label, as set in Interface builder. This means you can set label.contentMode = UIViewContentModeTop; to align the text to the top of the label view😁 I'm the author of FXLabel, and whilst I don't know Manish, I believe he was trying to help (if he was advertising for me, I certainly didn't ask him to, and I'm not paying him - sorry Manish!). One of FXLabel's features is that it respects the UIContentMode property of the label, as set in Interface builder. This means you can set label.contentMode = UIViewContentModeTop; to align the text to the top of the label view \n I'm the author of FXLabel, and whilst I don't know Manish, I believe he was trying to help (if he was advertising for me, I certainly didn't ask him to, and I'm not paying him - sorry Manish!). One of FXLabel's features is that it respects \t the UIContentMode property of the label, as set in Interface builder. This means you can set label.contentMode = UIViewContentModeTop; to align the text😁 to the top of the label view \n \n I'm the author of FXLabel, and whilst I don't know Manish, "

        numberOfLines = 0

        // Checking size of text
        let font = UIFont(name: "Roboto-Regular", size: 14)
        let attr = [NSAttributedString.Key.font: font]
        let asymbolLengh = ("A" as NSString).size(withAttributes: attr as [NSAttributedString.Key: Any])

        let mysymbolSize: CGFloat = asymbolLengh.width.rounded(.up)
        let maxLineLenght = UIScreen.main.bounds.width

        var lineLengh: CGFloat = 0
        var necessaryCountOfLine: CGFloat = 1

        // My way to count size of text
        for i in myText where i != " " {

                if lineLengh <= maxLineLenght {

                    if i != "\n", i != "\t" {
                        lineLengh += mysymbolSize
                    } else {
                        necessaryCountOfLine += 1
                        lineLengh = 0

                    }

                } else {
                    necessaryCountOfLine += 1
                    lineLengh = 0
                }
        }

        text = myText
        textColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 1)
        self.font = font

        let lines = necessaryCountOfLine

        // Make disidion, how we will show our text

        if lines > maxLine {
            needButton = true
            height = asymbolLengh.height.rounded(.up) * (maxLine)
            maxHeight = asymbolLengh.height.rounded(.up) * (lines)

        } else {
            needButton = false
            height = asymbolLengh.height.rounded(.up) * lines
        }

        textHeightAnchor = heightAnchor.constraint(equalToConstant: height)
        textHeightAnchor.isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fullTextIsAvalible() {
        textHeightAnchor.isActive = false
        textHeightAnchor = heightAnchor.constraint(equalToConstant: maxHeight)
        textHeightAnchor.isActive = true
    }

    override var isHidden: Bool {
        willSet {
            if newValue {
                textHeightAnchor.isActive = false

            } else {

                textHeightAnchor.isActive = true
            }
        }
    }

    deinit {
    }
}
