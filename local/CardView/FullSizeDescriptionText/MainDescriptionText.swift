//
//  MainDescriptionText.swift
//  local
//
//  Created by Zhuravlev Lev on 07.04.2021.
//

import UIKit

protocol MainDesriptionTextDelegate: class {
    var viewWidth: CGFloat {get set}
}


class MainDesriptionText: UIStackView {
    
    
    var moreButton: UIButton?
    var textField: TextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
     
        textField = TextField()

        guard let textField = textField else {
            return
        }
        
        axis = .vertical
        addArrangedSubview(textField)
        
        if textField.needButton {
            addArrangedSubview(setMoreButton())

        }
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setMoreButton() -> UIButton {
        let text = "Читать полностью"
        let buttonTitleSize = (text as NSString).size(withAttributes: [
                                                        
                                                         NSAttributedString.Key.font : UIFont(name: "Roboto-Regular",
                                                                                              size: 14) ?? UIFont.systemFont(ofSize: 14),
                                                         NSAttributedString.Key.underlineStyle : 0])
        
        moreButton = UIButton()
        guard let moreButton = moreButton else {
            return UIButton()
        }
        moreButton.heightAnchor.constraint(equalToConstant: buttonTitleSize.height).isActive = true
        
        
        let yourAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.416, green: 0.827, blue: 0.655, alpha: 1),
            NSAttributedString.Key.underlineStyle : 0 ]
        
        let attributeString = NSMutableAttributedString(string: text,
                                                        attributes: yourAttributes)
        
        moreButton.setAttributedTitle(attributeString, for: .normal)
        moreButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        moreButton.addTarget(nil, action: #selector(moreButtonTouched), for: .touchUpInside)
        
        return moreButton
    }
    
    @objc func moreButtonTouched(_ sender: UIButton) {
        moreButton?.isHidden = true
        if let textField = textField {
            textField.fullTextIsAvalible()
        }
    }
    
    override var isHidden: Bool {
        willSet {
            if newValue {
                if let textField = textField {
                    textField.isHidden = true
                }
            } else {
                if let textField = textField {
                    textField.isHidden = false
                }
            }
    
        }
    }
    
    deinit {
     
    }
}





