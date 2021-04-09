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
  
    
        
    override init(frame: CGRect) {
        super .init(frame: frame)
    
        backgroundColor = .gray
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func makeActive() {
    }
}
