//
//  ViewController.swift
//  flex
//
//  Created by Zhuravlev Lev on 31.03.2021.
//

import UIKit

class DescriptionCardView: UIView {

    var paddingForCard = 18
    var nameLabel = UILabel()
    var blur: UIVisualEffectView?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setBlur()
        layer.cornerRadius = 10
        layer.masksToBounds = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setBlur() {

        let blurEffect = UIBlurEffect(style: .dark)
        blur = UIVisualEffectView(effect: blurEffect)

        if let blur = blur {

            addSubview(blur)

            blur.translatesAutoresizingMaskIntoConstraints = false
            blur.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            blur.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            blur.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            blur.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

            self.sendSubviewToBack(blur)

        }

        UIView.animate(withDuration: 0.6) {
            self.backgroundColor = .none
        }
    }

    func resetBlur() {
        backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        blur?.removeFromSuperview()
    }

    @objc func makeActive() {
    }

}
