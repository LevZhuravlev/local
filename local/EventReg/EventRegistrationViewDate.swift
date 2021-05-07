//
//  File.swift
//  local
//
//  Created by Zhuravlev Lev on 05.05.2021.
//

import UIKit

class ViewWithRegistrationDate: ViewWithRegistrationField {
    
    let pickerForFirstField: UIDatePicker = {
        let view = UIDatePicker()
        view.preferredDatePickerStyle = .wheels
        view.addTarget(self, action: #selector(addDataFromFirstDatePicker), for: .valueChanged)
        return view
    }()
    
    let secondTextField: UITextView? = {
        var view = UITextView()

        view.layer.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1).cgColor
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1).cgColor
        return view
    }()
    
    // MARK: - Init
    
    init(frame: CGRect, withName name: String, placeholder: String = "") {
        super.init(frame: frame, withName: name, placeholder: placeholder)
        setSecondTextField()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTextField() {
        guard let textField = textField else {
            return
        }

        mainScrollView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: desriptionLabel?.bottomAnchor ?? mainScrollView.topAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        textFieldHeightAnchor = textField.heightAnchor.constraint(equalToConstant: 64)
        textFieldHeightAnchor?.isActive = true
        textField.delegate = self
        textField.textColor = UIColor.lightGray
        textField.insetsLayoutMarginsFromSafeArea = true
        textField.textContainerInset = UIEdgeInsets(top: 24, left: 23, bottom: 24, right: 24)
        textField.font = UIFont(name: "Roboto-Medium", size: 16)
        textField.tintColor = .white
        textField.inputView = pickerForFirstField
        textField.text = textFieldPlaceholder
        textField.textColor = UIColor.lightGray
        textField.isScrollEnabled = false
        textField.becomeFirstResponder()
    }
    
    func setSecondTextField() {
        guard let textField = secondTextField else {
            return
        }

        mainScrollView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.textField?.bottomAnchor ?? mainScrollView.topAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        textFieldHeightAnchor = textField.heightAnchor.constraint(equalToConstant: 64)
        textFieldHeightAnchor?.isActive = true
        textField.delegate = self
        textField.textColor = UIColor.lightGray
        textField.insetsLayoutMarginsFromSafeArea = true
        textField.textContainerInset = UIEdgeInsets(top: 24, left: 23, bottom: 24, right: 24)
        textField.font = UIFont(name: "Roboto-Medium", size: 16)
        textField.tintColor = .white
        textField.inputView = pickerForFirstField
        textField.text = "Выберите дату и время окончания"
        textField.textColor = UIColor.lightGray
        textField.becomeFirstResponder()
        textField.isScrollEnabled = false
    }
    
    @objc func addDataFromFirstDatePicker() {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy HH:mm"
        textField?.text = nil
        textField?.text = formater.string(from: pickerForFirstField.date)
        
        guard let textField = textField else {
            return
        }
        textViewDidChange(textField)
    }
    
    override func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textView == secondTextField ? "Выберите дату и время окончания" : textFieldPlaceholder
            textView.textColor = UIColor.lightGray
            nextFiledButton?.isHidden = true
            mainScrollView.contentOffset = .zero
            
            if desriptionLabel != nil {
                UIView.animate(withDuration: 0.2) {
                    self.desriptionLabel?.transform = CGAffineTransform(translationX: 0, y: +30)
                    self.textField?.transform = CGAffineTransform(translationX: 0, y: -(self.desriptionLabel?.frame.height ?? 40))
                    
                }
            }
        }
    }
    
    override func textViewDidBeginEditing(_ textView: UITextView) {
        
        textViewDidChange(textView)
        nextFiledButton?.isHidden = true
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .white
            desriptionLabel?.isHidden = false
            
            if textView == secondTextField {
                desriptionLabel?.text = "Выберите дату и время окончания"
                                
                UIView.animate(withDuration: 0.2) {
                    self.desriptionLabel?.transform = .identity
                    self.textField?.transform = CGAffineTransform(translationX: 0, y: -30)
                    self.desriptionLabel?.transform = CGAffineTransform(translationX: 0, y: +72)
                }
                
            } else {
                desriptionLabel?.text = textFieldPlaceholder
                
                UIView.animate(withDuration: 0.2) {
                    self.desriptionLabel?.transform = .identity
                    self.textField?.transform = .identity
                }
            }
        }
    }
    
    override func textViewDidChange(_ textView: UITextView) {
    
        if !textView.text.isEmpty {
            nextFiledButton?.isHidden = false
            
        } else {
            nextFiledButton?.isHidden = true
        }
    }
    
}
