//
//  MainFullDescriptionTagsView.swift
//  local
//
//  Created by Zhuravlev Lev on 19.04.2021.
//

import UIKit

// Here i've got a tags for full view

extension MainFullDescriptionStackView {

    func setTagsForFullView() {

        if let tags = tags {

        let stackForTag = UIStackView()
        stackForTag.spacing = tags.tagStack.spacing
        addArrangedSubview(stackForTag)

        var horizontalView = UIView()

        stackForTag.axis = .vertical
        stackForTag.addArrangedSubview(horizontalView)
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        horizontalView.heightAnchor.constraint(equalToConstant: tags.tagListSize[0].height + 12).isActive = true

        var previous: CGFloat = 0
        let paddings: CGFloat = tags.tagStack.spacing
        let availableWidth = UIScreen.main.bounds.width - 36

        for i in tags.tagList.indices {

            if  previous + (tags.tagListSize[i].width + 18) > availableWidth {
                horizontalView = UIView()
                stackForTag.addArrangedSubview(horizontalView)
                horizontalView.translatesAutoresizingMaskIntoConstraints = false
                horizontalView.heightAnchor.constraint(equalToConstant: tags.tagListSize[0].height + 12).isActive = true
                previous = 0
            }

            let tag = tags.tagList[i]
            tag.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)

            horizontalView.addSubview(tag)
            tag.translatesAutoresizingMaskIntoConstraints = false
            tag.leadingAnchor.constraint(equalTo: horizontalView.leadingAnchor, constant: previous).isActive = true
            previous += (tags.tagListSize[i].width + paddings + 18)

            }
        }
    }
}
