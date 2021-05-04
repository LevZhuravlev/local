//
//  popUp.swift
//  local
//
//  Created by Zhuravlev Lev on 20.04.2021.
//

import UIKit

class PopUp: UIView {

    fileprivate var animateOutWork = false
    fileprivate lazy var viewForContacts: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 26
        view.isUserInteractionEnabled = true
        return view
    }()

    fileprivate lazy var pushRectangle: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 1).cgColor
        view.layer.cornerRadius = 2
        return view
    }()

    // MARK: - StackForContacts
    fileprivate lazy var stackForContacts: UIStackView = {

        let horizontalStack = UIStackView()
        horizontalStack.spacing = 16

        // MARK: TO-DO: model view
        let viewsForStack: [UIView] = ["Телефон", "Telegram", "What's app", "Instagram" ].map { (name) -> UIView in

            let verticalStack = UIStackView()
            verticalStack.axis = .vertical
            verticalStack.spacing = 11

            horizontalStack.addArrangedSubview(verticalStack)
            verticalStack.translatesAutoresizingMaskIntoConstraints = false

            // icon
            let icon = UIImageView()
            verticalStack.addArrangedSubview(icon)

            icon.image = UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
            icon.contentMode = .scaleAspectFit
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.heightAnchor.constraint(equalToConstant: 44).isActive = true

            // label
            let label = UILabel()
            verticalStack.addArrangedSubview(label)

            label.text = name
            label.textColor = .white
            label.font = UIFont(name: "Roboto-Regular", size: 14)

            var labelparagraphStyle = NSMutableParagraphStyle()

            labelparagraphStyle.lineHeightMultiple = 1.22
            label.attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: labelparagraphStyle])
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: 22).isActive = true

            return verticalStack

        }

        return horizontalStack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.frame = UIScreen.main.bounds

        addSubview(viewForContacts)

        // view

        viewForContacts.heightAnchor.constraint(equalToConstant: 184).isActive = true
        viewForContacts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        viewForContacts.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        viewForContacts.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

        // pushRectangle
        viewForContacts.addSubview(pushRectangle)
        pushRectangle.translatesAutoresizingMaskIntoConstraints = false
        pushRectangle.widthAnchor.constraint(equalToConstant: 32).isActive = true
        pushRectangle.heightAnchor.constraint(equalToConstant: 4).isActive = true
        pushRectangle.centerXAnchor.constraint(equalTo: viewForContacts.centerXAnchor).isActive = true
        pushRectangle.topAnchor.constraint(equalTo: viewForContacts.topAnchor, constant: 8).isActive = true

        // stackForContacts
        viewForContacts.addSubview(stackForContacts)
        stackForContacts.translatesAutoresizingMaskIntoConstraints = false

        _ = stackForContacts.arrangedSubviews.map { (colorView) in
            colorView.widthAnchor.constraint(equalTo: viewForContacts.widthAnchor, multiplier: 1/4, constant: -20).isActive = true

        }

        stackForContacts.centerYAnchor.constraint(equalTo: viewForContacts.centerYAnchor).isActive = true
        stackForContacts.centerXAnchor.constraint(equalTo: viewForContacts.centerXAnchor).isActive = true

        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        viewForContacts.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeTheViewForContacts)))

        animateIn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc fileprivate func animateOut() {

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {
                self.viewForContacts.transform = CGAffineTransform(translationX: 0, y: +500)
                self.alpha = 0
            } completion: { (complete) in
                if complete {
                    self.removeFromSuperview()
                }
            }
        }

    @objc fileprivate func animateIn() {

        self.viewForContacts.transform = CGAffineTransform(translationX: 0, y: +100)
        self.backgroundColor = .black
        self.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.viewForContacts.transform = .identity
            self.backgroundColor = UIColor(white: 0, alpha: 0.8)
            self.alpha = 1
        }
    }

    @objc fileprivate func swipeTheViewForContacts(gesture: UIPanGestureRecognizer) {

        if gesture.state == .changed {
            let transition = gesture.translation(in: self)

            if transition.y < 0 {
                viewForContacts.transform = .init(translationX: 0, y: (transition.y/4))
            } else {
                viewForContacts.transform = .init(translationX: 0, y: (transition.y/1.5))
                self.backgroundColor = UIColor(white: 0, alpha: 0.8)

            }

            if transition.y > 90 {
                animateOutWork = true
                self.viewForContacts.removeGestureRecognizer(gesture)
                animateOut()
            }

        } else if gesture.state == .ended && !animateOutWork {

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut) {

                self.viewForContacts.transform = .identity
                self.backgroundColor = UIColor(white: 0, alpha: 0.8)

            }
        }
    }
}
