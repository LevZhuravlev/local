//
//  MainViewSetting.swift
//  local
//
//  Created by Zhuravlev Lev on 05.04.2021.
//

import UIKit

extension MainCardViewController {
    
    func setMainScrollView() {
        
        mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        
        view.addSubview(mainScrollView)
        
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.delegate = self
        mainScrollView.bounces = false
        
        
    }
    
    func setMainStackView() {
        
        mainStackView = UIStackView()

        mainStackView.axis = .vertical
        mainScrollView.addSubview(mainStackView)
        mainStackView.backgroundColor = .orange
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        
    }
    
    func setColorViewInStack(with color: UIColor, height: CGFloat?) {
        
        bottomViewForStack = UIView()
        bottomViewForStack.backgroundColor = color
         
        mainStackView.addArrangedSubview(bottomViewForStack)
         
        if let height = height {

            bottomViewForStack.translatesAutoresizingMaskIntoConstraints = false
            bottomViewForStack.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}




