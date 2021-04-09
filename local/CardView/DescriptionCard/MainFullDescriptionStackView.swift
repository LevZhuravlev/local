//
//  MainFullDescriptionStackView.swift
//  local
//
//  Created by Zhuravlev Lev on 07.04.2021.
//

import UIKit




class MainFullDescriptionStackView: UIStackView {
    
    var desriptionText: MainDesriptionText? = nil
    var blueView: UIView? = nil
    
    override init(frame: CGRect) {
        
        
        
        super.init(frame: frame)
        
        axis = .vertical

        desriptionText = MainDesriptionText()
        if let desriptionText = desriptionText {
            addArrangedSubview(desriptionText)
            desriptionText.translatesAutoresizingMaskIntoConstraints = false
            desriptionText.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
        

        
        blueView = UIView()
        
        if let blueView = blueView {
            blueView.backgroundColor = .systemBlue
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
