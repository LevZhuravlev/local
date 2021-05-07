//
//  popUpForEventReg.swift
//  local
//
//  Created by Zhuravlev Lev on 05.05.2021.
//

import UIKit

class EventRegPopUp: UIView {

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
    fileprivate var popUpDescriprion: UILabel = {
        let view = UILabel()
                        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.underlineStyle: 0 ]
        
        let attributeString = NSMutableAttributedString(string: "Создание события не завершено",
                                                        attributes: yourAttributes)

        view.attributedText = attributeString
        view.textAlignment = .center
        view.tintColor = .white
       
        return view
    }()
    fileprivate var settingButton: UIButton = {
        let view = UIButton()
                        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.underlineStyle: 0 ]
        
        let attributeString = NSMutableAttributedString(string: "Выйти",
                                                        attributes: yourAttributes)

        view.setAttributedTitle(attributeString, for: .normal)
        view.tintColor = .white
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        view.addTarget(nil, action: #selector(EventRegViewController.goOutIsTouched), for: .touchUpInside)
        
        return view
    }()
    fileprivate var logoutButton: UIButton = {
        let view = UIButton()
                        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.underlineStyle: 0 ]
        
        let attributeString = NSMutableAttributedString(string: "Удалить",
                                                        attributes: yourAttributes)

        view.setAttributedTitle(attributeString, for: .normal)
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        view.addTarget(nil, action: #selector(EventRegViewController.deleteIsTouched), for: .touchUpInside)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.frame = UIScreen.main.bounds

        addSubview(viewForSettings)

        // view
        viewForSettings.heightAnchor.constraint(equalToConstant: 112).isActive = true
        viewForSettings.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewForSettings.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        viewForSettings.widthAnchor.constraint(equalToConstant: 320).isActive = true

        // stack
        viewForSettings.addSubview(stackForSettings)
        stackForSettings.translatesAutoresizingMaskIntoConstraints = false
        stackForSettings.trailingAnchor.constraint(equalTo: viewForSettings.trailingAnchor).isActive = true
        stackForSettings.leadingAnchor.constraint(equalTo: viewForSettings.leadingAnchor).isActive = true
        stackForSettings.topAnchor.constraint(equalTo: viewForSettings.topAnchor).isActive = true
        stackForSettings.bottomAnchor.constraint(equalTo: viewForSettings.bottomAnchor).isActive = true
        
        // buttons
        stackForSettings.addArrangedSubview(popUpDescriprion)
        let stackForButtons = UIStackView()
        stackForSettings.addArrangedSubview(stackForButtons)
        stackForButtons.distribution = .fillEqually
        stackForButtons.spacing = 0.5
        stackForButtons.insetsLayoutMarginsFromSafeArea = true
        stackForButtons.backgroundColor = .lightGray
        stackForButtons.addArrangedSubview(logoutButton)
        stackForButtons.addArrangedSubview(settingButton)
        
     self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
     self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(animateOut)))
        animateIn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc fileprivate func animateOut() {

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {
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
