//
//  MainFullDescriptionCardView.swift
//  local
//
//  Created by Zhuravlev Lev on 06.04.2021.
//

import UIKit


// Setting full view desrition when swipeDown
extension MainCardViewController {
    
  
    func setFullDesription() {
        descriptionCard.resetBlur()

        if isFullDesriptionAvailable {            
            bottomStackHeight.isActive = false
            bottomStackHeight =  bottomViewForStack.heightAnchor.constraint(equalToConstant: view.frame.height - galleryHeight + 10)
            self.mainScrollView.showsVerticalScrollIndicator = true

            UIView.animate(withDuration: 0.5, animations: {
                [weak self] in
                guard let self = self else {return}
                self.showFullDesription()
            })
        
        }
           
        
        else {
            self.descriptionCard.setBlur()

            UIView.animate(withDuration: 0.3, animations: {
                self.mainScrollView.contentOffset.y = 0
            })
            
            bottomStackHeight.isActive = false
            bottomStackHeight =  bottomViewForStack.heightAnchor.constraint(equalToConstant: view.frame.height - galleryHeight + 10)
           
            
        
            UIView.animate(withDuration: 0.2, animations: {
                [weak self] in
                guard let self = self else {return}
                self.hideFullDesription()
                


            })
            bottomStackHeight.isActive = true
        }
    }
    func setFullStack() {
        
        if fullDespriptionStack == nil  {
            self.fullDespriptionStack = MainFullDescriptionStackView()
            descriptionCard.addSubview(self.fullDespriptionStack!)
        }
        
        
        self.fullDespriptionStack!.translatesAutoresizingMaskIntoConstraints = false
        self.fullDespriptionStack!.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        self.fullDespriptionStack!.widthAnchor.constraint(equalToConstant: view.frame.width - 36).isActive = true
        self.fullDespriptionStack!.bottomAnchor.constraint(equalTo: descriptionCard.bottomAnchor).isActive = true
        self.fullDespriptionStack!.centerXAnchor.constraint(equalTo: descriptionCard.centerXAnchor).isActive = true
        
    }
    
    func showFullDesription() {
        
        self.despriptionLeading = self.descriptionCard.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor, constant: 0)
        self.despriptionTrailing = self.descriptionCard.trailingAnchor.constraint(equalTo: self.mainScrollView.trailingAnchor, constant: 0)
        self.bottomStackHeight.isActive = false
        self.bottomStackHeight = self.bottomViewForStack.heightAnchor.constraint(equalToConstant: 1500)
        self.bottomStackHeight.isActive = true
        
        self.descriptionCard.layer.cornerRadius = 0
        self.desriptionHeight = self.descriptionCard.heightAnchor.constraint(equalToConstant: 1500)
        
        self.setFullStack()

        self.descriptionCard.layoutIfNeeded()
        
        self.mainStackView.layoutIfNeeded()
        self.mainScrollView.layoutIfNeeded()
        
        self.mainScrollView.contentOffset.y = self.imageGalleryScrollLayer.frame.maxY/2
        self.descriptionCard.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        
        self.tags?.isHidden = true
        
        if let fullDespriptionStack = fullDespriptionStack {
            fullDespriptionStack.isHidden = false
        }        

    }
    func hideFullDesription() {
        
        hideFullStack()

        self.despriptionLeading = self.descriptionCard.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor, constant: 0)
        self.despriptionTrailing = self.descriptionCard.trailingAnchor.constraint(equalTo: self.mainScrollView.trailingAnchor, constant: 0)
        self.bottomStackHeight.isActive = false
        self.bottomStackHeight = self.bottomViewForStack.heightAnchor.constraint(equalToConstant: self.bottomHeight)
        self.bottomStackHeight.isActive = true
        self.desriptionHeight = self.descriptionCard.heightAnchor.constraint(equalToConstant: 142)
        self.descriptionCard.layer.cornerRadius = 10
        self.mainScrollView.showsVerticalScrollIndicator = false
        self.despriptionLeading = self.descriptionCard.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor, constant: self.paddingForCard)
        self.despriptionTrailing = self.descriptionCard.trailingAnchor.constraint(equalTo: self.mainScrollView.trailingAnchor, constant: -self.paddingForCard)
        self.mainStackView.layoutIfNeeded()
        self.mainScrollView.layoutIfNeeded()

//        self.descriptionCard.backgroundColor = .gray
        self.tags?.isHidden = false
    }
    func hideFullStack() {
        
        if let fullDespriptionStack = fullDespriptionStack {
            fullDespriptionStack.isHidden = true
        }
    }
    
    
}
