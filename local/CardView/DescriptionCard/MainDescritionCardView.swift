//
//  MainDescritionCardView.swift
//  local
//
//  Created by Zhuravlev Lev on 06.04.2021.
//

import UIKit

extension MainCardViewController {
    
    func setDescrpitionCard() {
    
        descriptionCard = DescriptionCardView()
        mainStackView.addSubview(descriptionCard)
        
        descriptionCard.translatesAutoresizingMaskIntoConstraints = false
        
        despriptionLeading = descriptionCard.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: paddingForCard)
        despriptionTrailing = descriptionCard.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -paddingForCard)
        descriptionCard.bottomAnchor.constraint(equalTo: stackWithButtons.topAnchor, constant: -12).isActive = true
        desriptionHeight = descriptionCard.heightAnchor.constraint(equalToConstant: 142)
        
        
        // Info button
        let button = UIButton(frame: CGRect(x: view.frame.maxX - 90, y: 0, width: 45, height: 45))
        descriptionCard.addSubview(button)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(makeActive), for: .touchUpInside)
        
        // NameLabel
        nameLabel = UILabel(frame: descriptionCard.frame(forAlignmentRect: CGRect(x: .zero+18, y: .zero, width: 270, height: 80)))
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 2
        descriptionCard.addSubview(nameLabel)
    
        let text = "Red Hot Chili Peppers Tribute Red Hot Chili Peppers Tribute"

        
        nameLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        nameLabel.lineBreakMode = .byTruncatingTail
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        

        nameLabel.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: -0.48, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        nameLabel.textColor = .white
        
        // Price Label
        priceLabel = UILabel()
        if let priceLabel = priceLabel {
            mainStackView.addSubview(priceLabel)
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: descriptionCard.topAnchor, constant: -10).isActive = true
            
            //
            let priceText = "200₽"
            priceLabel.text = priceText
            
            let font = UIFont(name: "Roboto-Bold", size: 24)
            priceLabel.font = font
            priceLabel.textColor = .white
            priceLabel.layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor
            
            let attr = [NSAttributedString.Key.font: font]
            let size = (priceText as NSString).size(withAttributes: attr as [NSAttributedString.Key : Any])
            priceLabel.textAlignment = .center
            priceLabel.widthAnchor.constraint(equalToConstant: size.width + 27).isActive = true
            priceLabel.heightAnchor.constraint(equalToConstant: size.height + 12).isActive = true
            priceLabel.layer.cornerRadius = 8
            
        
        // Tag Bar
            tags = TagsWithBar()
            
            if let tags = tags {
                
                descriptionCard.addSubview(tags)
                tags.translatesAutoresizingMaskIntoConstraints = false
                tags.bottomAnchor.constraint(equalTo: descriptionCard.bottomAnchor, constant: -9).isActive = true
                tags.trailingAnchor.constraint(equalTo: descriptionCard.trailingAnchor, constant: -18).isActive = true
                tags.leadingAnchor.constraint(equalTo: descriptionCard.leadingAnchor,constant: 18).isActive = true
            }
        }
        
        

    }
    
    @objc func makeActive() {
        isFullDesriptionAvailable = !isFullDesriptionAvailable
    }
}
