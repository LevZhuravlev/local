//
//  MainFullDescriptionContactsView.swift
//  local
//
//  Created by Zhuravlev Lev on 19.04.2021.
//

import UIKit

// Here i've got a contact's for full view

extension MainFullDescriptionStackView {

    func setContactsFullView() {

        if let contacts = contacts {

            let buttonConnect = UIButton()
            let stackForTop = UIStackView()
            let stackForLabels = UIStackView()
            let contactsImageView = UIImageView()

            // Main stack setting
            contacts.axis = .vertical
            contacts.isLayoutMarginsRelativeArrangement = true
            contacts.layoutMargins = .init(top: 8, left: 8, bottom: 8, right: 8)
            contacts.spacing = 12
            contacts.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
            addArrangedSubview(contacts)

            contacts.translatesAutoresizingMaskIntoConstraints = false
            contacts.heightAnchor.constraint(equalToConstant: 164).isActive = true
            contacts.layer.cornerRadius = 20

            // StackForTop setting
            contacts.addArrangedSubview(stackForTop)
            stackForTop.spacing = 12

            // Image setting
            stackForTop.addArrangedSubview(contactsImageView)
            contactsImageView.backgroundColor = .blue
            contactsImageView.layer.cornerRadius = 20

            contactsImageView.translatesAutoresizingMaskIntoConstraints = false

            contactsImageView.widthAnchor.constraint(equalToConstant: 88).isActive = true
            contactsImageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
            contactsImageView.image = #imageLiteral(resourceName: "Image")

            // Label's setting
            stackForTop.addArrangedSubview(stackForLabels)
            stackForLabels.axis = .vertical
            stackForLabels.distribution = .fillEqually

            // NameLabel

            let placeNameLabel = UILabel()

            placeNameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            placeNameLabel.font = UIFont(name: "Roboto-Bold", size: 16)

            let placeNameLabelparagraphStyle = NSMutableParagraphStyle()
            placeNameLabelparagraphStyle.lineHeightMultiple = 1.07
            placeNameLabel.numberOfLines = 0
            placeNameLabel.attributedText = NSMutableAttributedString(string: "\nHarat’s", attributes: [NSAttributedString.Key.kern: 0.12, NSAttributedString.Key.paragraphStyle: placeNameLabelparagraphStyle])

            stackForLabels.addArrangedSubview(placeNameLabel)

            // AdressLabel

            let placeAdressLabel = UILabel()
            placeAdressLabel.textColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 1)
            placeAdressLabel.font = UIFont(name: "Roboto-Regular", size: 14)
            let placeAdressLabelparagraphStyle = NSMutableParagraphStyle()
            placeAdressLabelparagraphStyle.lineHeightMultiple = 1.22
            placeAdressLabel.numberOfLines = 2

            placeAdressLabel.attributedText = NSMutableAttributedString(string: "Красноармейская, 66 \n", attributes: [NSAttributedString.Key.paragraphStyle: placeAdressLabelparagraphStyle])

            stackForLabels.addArrangedSubview(placeAdressLabel)

            // button setting
            contacts.addArrangedSubview(buttonConnect)

            buttonConnect.translatesAutoresizingMaskIntoConstraints = false
            buttonConnect.heightAnchor.constraint(equalToConstant: 48).isActive = true
            buttonConnect.backgroundColor = UIColor(red: 0.335, green: 0.892, blue: 0.925, alpha: 1)
            buttonConnect.layer.cornerRadius = 18
            buttonConnect.addTarget(nil, action: #selector(MainCardViewController.buttonConnectTouched), for: .touchUpInside)

            let buttonConnectLabel = UILabel()

            buttonConnectLabel.textColor = .white
            buttonConnectLabel.font = UIFont(name: "Roboto-Bold", size: 14)

            let buttonConnectLabelParagraphStyle = NSMutableParagraphStyle()
            buttonConnectLabelParagraphStyle.lineHeightMultiple = 0.98

            buttonConnectLabel.attributedText = NSMutableAttributedString(string: "СВЯЗАТЬСЯ", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: buttonConnectLabelParagraphStyle])

            buttonConnect.addSubview(buttonConnectLabel)
            buttonConnectLabel.translatesAutoresizingMaskIntoConstraints = false

            buttonConnectLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
            buttonConnectLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

            buttonConnectLabel.centerYAnchor.constraint(equalTo: buttonConnect.centerYAnchor).isActive = true

            buttonConnectLabel.centerXAnchor.constraint(equalTo: buttonConnect.centerXAnchor).isActive = true
        }
    }

    func setMainStack() {
    }

}
