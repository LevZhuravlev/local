//
//  viewWithRegistrationField.swift
//  local
//
//  Created by Zhuravlev Lev on 03.05.2021.
//

import UIKit

class ViewWithRegistrationField: UIView {
    
    private var mainScrollView = UIScrollView()
    
    var titleLabel: UILabel? = {
        
        let view = UILabel()
            
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Roboto-Bold", size: 24)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07

        // Line height: 30 pt

        view.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.48, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return view
    }()
    var desriptionLabel: UILabel? = {
        
        let view = UILabel()
            
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Roboto-Medium", size: 16)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 1)
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07

        // Line height: 30 pt

        view.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.48, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return view
    }()

    var textField: UITextView? = {
        
        var view = UITextView()

        view.layer.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1).cgColor
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1).cgColor
        return view
    }()
    var textFieldPlaceholder: String = "Placeholder"
    var nextFiledButton: UIButton?
   
    // MARK: - Init
    init(frame: CGRect, withName name: String, placeholder: String = "") {
        super.init(frame: frame)
        
        titleLabel?.text = name
        textFieldPlaceholder = placeholder
        
        addSubview(mainScrollView)

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTouch)))
        mainScrollView.delegate = self
        
        guard let titleLabel = titleLabel else {
            return
        }
        
        mainScrollView.addSubview(titleLabel)
        
        let titleLabelSize = titleLabel.text?.size(withAttributes: [.font: titleLabel.font!])
        let titleLabelHeight = titleLabelSize!.height * (((titleLabelSize!.width + 64) / UIScreen.main.bounds.width)).rounded(.up)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight).isActive = true
        
        if let desriptionLabel = desriptionLabel, placeholder != "" {
            mainScrollView.addSubview(desriptionLabel)
            
            desriptionLabel.text = placeholder
            let desriptionLabelSize = desriptionLabel.text?.size(withAttributes: [.font: desriptionLabel.font!])
            let desriptionLabelHeigth = titleLabelSize!.height * (((desriptionLabelSize!.width + 64) / UIScreen.main.bounds.width)).rounded(.up)
                        
            desriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            desriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
            desriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
            desriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
            desriptionLabel.heightAnchor.constraint(equalToConstant: desriptionLabelHeigth).isActive = true
        }
        
        guard let textField = textField else {
            return
        }
        mainScrollView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: desriptionLabel?.bottomAnchor ?? titleLabel.bottomAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 192).isActive = true
        textField.delegate = self
        textField.textColor = UIColor.lightGray
        textField.insetsLayoutMarginsFromSafeArea = true
        textField.textContainerInset = UIEdgeInsets(top: 24, left: 23, bottom: 24, right: 24)
        textField.font = UIFont(name: "Roboto-Medium", size: 16)
        textField.tintColor = .white
        textField.text = textFieldPlaceholder
        textField.textColor = UIColor.lightGray
        textField.becomeFirstResponder()
        mainScrollView.keyboardDismissMode = .interactive

        setNextFiledButton()
        registerForKeyboardNotification()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    private func setNextFiledButton() {
        
        nextFiledButton = {
            let view = UIButton()
            
            view.layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor
            view.layer.cornerRadius = 14

            let parent = self

            parent.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalTo: textField!.widthAnchor).isActive = true
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            view.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
            view.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true

            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                    UIFont.systemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "ДАЛЕЕ",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            
            view.backgroundColor = UIColor(red: 0.416, green: 0.827, blue: 0.655, alpha: 1)
            view.addTarget(nil, action: #selector(EventRegViewController.nextFiledTouched), for: .touchUpInside)
            view.isHidden = true

            return view
        }()
    }
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func deleteForKeyboardNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func hideKeyboardOnTouch() {
        endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseInOut) {
                self.nextFiledButton?.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight+8)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseInOut) {
            self.nextFiledButton?.transform = .identity
            self.mainScrollView.contentOffset = .zero
        }
    }
}

extension ViewWithRegistrationField: UITextViewDelegate, UIScrollViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .white
            desriptionLabel?.isHidden = false
            
            if desriptionLabel != nil {
                UIView.animate(withDuration: 0.2) {
                    self.desriptionLabel?.transform = .identity
                    self.textField?.transform = .identity
                }
            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if !textView.text.isEmpty {
            nextFiledButton?.isHidden = false

        } else {
            nextFiledButton?.isHidden = true
        }
    }
  
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            textView.text = textFieldPlaceholder
            textView.textColor = UIColor.lightGray
            nextFiledButton?.isHidden = true
            mainScrollView.contentOffset = .zero
            
            if desriptionLabel != nil {
                UIView.animate(withDuration: 0.2) {
                    self.desriptionLabel?.transform = CGAffineTransform(translationX: 0, y: +100)
                    self.textField?.transform = CGAffineTransform(translationX: 0, y: -(self.desriptionLabel?.frame.height ?? 40))
                    
                }
            }
        }
    }
}
