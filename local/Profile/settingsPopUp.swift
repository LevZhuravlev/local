//
//  settingsPopUp.swift
//  local
//
//  Created by Zhuravlev Lev on 01.05.2021.
//

import UIKit

class SettingsPopUp: UIView {

    fileprivate var animateOutWork = false
    fileprivate lazy var viewForSettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    fileprivate lazy var stackForSettings: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    fileprivate var settingButton: UIButton = {
        let view = UIButton()
                        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.underlineStyle: 0 ]
        
        let attributeString = NSMutableAttributedString(string: "Настройки",
                                                        attributes: yourAttributes)

        view.setAttributedTitle(attributeString, for: .normal)
        view.tintColor = .white
        view.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
        return view
    }()
    fileprivate var logoutButton: UIButton = {
        let view = UIButton()
                        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.underlineStyle: 0 ]
        
        let attributeString = NSMutableAttributedString(string: "Выход        ",
                                                        attributes: yourAttributes)

        view.setAttributedTitle(attributeString, for: .normal)
        view.tintColor = .white
        view.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.frame = UIScreen.main.bounds

        addSubview(viewForSettings)

        // view
        viewForSettings.heightAnchor.constraint(equalToConstant: 112).isActive = true
        viewForSettings.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        viewForSettings.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        viewForSettings.widthAnchor.constraint(equalToConstant: 160).isActive = true

        // stack
        viewForSettings.addSubview(stackForSettings)
        stackForSettings.translatesAutoresizingMaskIntoConstraints = false
        stackForSettings.trailingAnchor.constraint(equalTo: viewForSettings.trailingAnchor).isActive = true
        stackForSettings.leadingAnchor.constraint(equalTo: viewForSettings.leadingAnchor).isActive = true
        stackForSettings.topAnchor.constraint(equalTo: viewForSettings.topAnchor).isActive = true
        stackForSettings.bottomAnchor.constraint(equalTo: viewForSettings.bottomAnchor).isActive = true
        
        // buttons
        stackForSettings.addArrangedSubview(settingButton)
        stackForSettings.addArrangedSubview(logoutButton)
        
     self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
     self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(animateOut)))
        animateIn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc fileprivate func animateOut() {

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {
                self.viewForSettings.transform = CGAffineTransform(translationX: 0, y: -500)
                self.alpha = 0
            } completion: { (complete) in
                if complete {
                    self.removeFromSuperview()
                }
            }
        }

    @objc fileprivate func animateIn() {

        self.viewForSettings.transform = CGAffineTransform(translationX: 0, y: +100)
        self.backgroundColor = .black
        self.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.viewForSettings.transform = .identity
            self.backgroundColor = UIColor(white: 0, alpha: 0.8)
            self.alpha = 1
        }
    }

    @objc fileprivate func swipeTheViewForContacts(gesture: UIPanGestureRecognizer) {

        if gesture.state == .changed {
            let transition = gesture.translation(in: self)

            if transition.y < 0 {
                viewForSettings.transform = .init(translationX: 0, y: (transition.y/4))
            } else {
                viewForSettings.transform = .init(translationX: 0, y: (transition.y/1.5))
                self.backgroundColor = UIColor(white: 0, alpha: 0.8)

            }

            if transition.y > 90 {
                animateOutWork = true
                self.viewForSettings.removeGestureRecognizer(gesture)
                animateOut()
            }

        } else if gesture.state == .ended && !animateOutWork {

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {

                self.viewForSettings.transform = .identity
                self.backgroundColor = UIColor(white: 0, alpha: 0.8)

            }
        }
    }
}
