//
//  MainFullDescriptionStackView.swift
//  local
//
//  Created by Zhuravlev Lev on 07.04.2021.
//

import UIKit

class MainFullDescriptionStackView: UIStackView {

    var tags: Tags?
    var desriptionText: MainDesriptionText?
    var playList: UIStackView?
    var contacts: UIStackView?

    var blueView: UIView?

    override init(frame: CGRect) {

        super.init(frame: frame)

        axis = .vertical
        spacing = 12

// MARK: - Tags text

        tags = Tags()
        if tags != nil {
            setTagsForFullView()
        }

// MARK: - Desription text
        desriptionText = MainDesriptionText()
        if let desriptionText = desriptionText {
            addArrangedSubview(desriptionText)
            desriptionText.translatesAutoresizingMaskIntoConstraints = false
            desriptionText.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }

// MARK: - PlayList

        playList = UIStackView()

        if  playList != nil {
            setPlayListForFullView()
        }

// MARK: - Contacts

        contacts = UIStackView()

        if  contacts != nil {
            setContactsFullView()
        }

        blueView = UIView()

        if let blueView = blueView {
            addArrangedSubview(blueView)
            blueView.translatesAutoresizingMaskIntoConstraints = false
        }

//        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHidden: Bool {
        willSet {

            if newValue {
                desriptionText?.isHidden = true
                blueView?.isHidden = true
            } else {
                desriptionText?.isHidden = false
                blueView?.isHidden = false
            }
        }
    }

    deinit {

    }
}
