//
//  MainBottom.swift
//  local
//
//  Created by Zhuravlev Lev on 05.04.2021.
//

import UIKit

extension MainCardViewController {
    
    func setMainCatdBottom(){
        
        bottomViewForStack = UIView()
        bottomViewForStack.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        
        mainStackView.addArrangedSubview(bottomViewForStack)
        
        
        bottomStackHeight =  bottomViewForStack.heightAnchor.constraint(equalToConstant: bottomHeight)
        bottomViewForStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStackHeight.isActive = true
        
        // Buttons Settings
        
        stackWithButtons = UIStackView()
        
        let likeButton = UIButton()
        let disLikeButton = UIButton()
        let leftMargin: CGFloat = 96
        let rightMargin: CGFloat = 96
        let spacing: CGFloat = 80
        let height: CGFloat  = (view.frame.width - leftMargin - rightMargin - spacing)/2

                
        likeButton.setImage(#imageLiteral(resourceName: "Like"), for: .normal)
        disLikeButton.setImage(#imageLiteral(resourceName: "Shit"), for: .normal)
        
        bottomViewForStack.addSubview(stackWithButtons)
        
        stackWithButtons.addArrangedSubview(disLikeButton)
        stackWithButtons.addArrangedSubview(likeButton)
        
        stackWithButtons.translatesAutoresizingMaskIntoConstraints = false
        stackWithButtons.leadingAnchor.constraint(equalTo: bottomViewForStack.leadingAnchor).isActive = true
        stackWithButtons.trailingAnchor.constraint(equalTo: bottomViewForStack.trailingAnchor).isActive = true
        stackWithButtons.bottomAnchor.constraint(equalTo: bottomViewForStack.bottomAnchor, constant: -height/2).isActive = true
        stackWithButtons.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        stackWithButtons.isLayoutMarginsRelativeArrangement = true
        stackWithButtons.layoutMargins = .init(top: 0, left: leftMargin, bottom: 0, right: rightMargin)
        
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = spacing
        
        
        }

}
