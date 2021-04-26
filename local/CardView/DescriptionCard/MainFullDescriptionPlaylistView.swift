//
//  MainFullDescriptionPlaylistView.swift
//  local
//
//  Created by Zhuravlev Lev on 19.04.2021.
//

import UIKit

// Here i've got a playlist for full view

extension MainFullDescriptionStackView {
    
    func setPlayListForFullView() {
        
        if let playList = playList {
        
        
        let playListLabelstackView = UIStackView()
        let viewForImage = UIView()
        let playListImageView = UIImageView()


        playListLabelstackView.axis = .vertical

        
    // Play List Title Label

        let playListTitleLabel = UILabel()

        playListTitleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        playListTitleLabel.font = UIFont(name: "Roboto-Bold", size: 16)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07


        playListTitleLabel.attributedText = NSMutableAttributedString(string: "Playlist", attributes: [NSAttributedString.Key.kern: 0.12, NSAttributedString.Key.paragraphStyle: paragraphStyle])


        playListLabelstackView.addArrangedSubview(playListTitleLabel)

        playListTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        playListTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    // Play List Name Label
        
        let playListNameLabel = UILabel()

        playListNameLabel.frame = CGRect(x: 0, y: 0, width: 225, height: 20)


        playListNameLabel.alpha = 0.97
        playListNameLabel.textColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 1)
        playListNameLabel.font = UIFont(name: "Roboto-Regular", size: 14)

        let NameLabelparagraphStyle = NSMutableParagraphStyle()
        NameLabelparagraphStyle.lineHeightMultiple = 1.22

        playListNameLabel.attributedText = NSMutableAttributedString(string: "Red Hot Chili Peppers", attributes: [NSAttributedString.Key.paragraphStyle: NameLabelparagraphStyle])


        playListLabelstackView.addArrangedSubview(playListNameLabel)

        playListNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playListNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                    
        
    // Play List Image
        
        viewForImage.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
            
        
        playList.addArrangedSubview(playListLabelstackView)
        playList.addArrangedSubview(viewForImage)

        
        
        playList.isLayoutMarginsRelativeArrangement = true
        playList.layoutMargins = .init(top: 8, left: 20, bottom: 8, right: 8)
        playList.spacing = 8
        playList.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        addArrangedSubview(playList)
            
            playList.translatesAutoresizingMaskIntoConstraints = false
            playList.heightAnchor.constraint(equalToConstant: 64).isActive = true
            playList.layer.cornerRadius = 20
        
    // Image pefences


        
        
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        viewForImage.widthAnchor.constraint(equalTo: playList.widthAnchor, multiplier: 1/4).isActive = true
        viewForImage.layer.cornerRadius = 13
        viewForImage.clipsToBounds = true
        viewForImage.addSubview(playListImageView)
        
        // ModelView
        let playListImage = UIImage(named: "Vector")
        
        playListImageView.image = playListImage?.withRenderingMode(.alwaysOriginal)
        playListImageView.contentMode = .center
        
        
        playListImageView.translatesAutoresizingMaskIntoConstraints = false
        playListImageView.topAnchor.constraint(equalTo: viewForImage.topAnchor).isActive = true
        playListImageView.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor).isActive = true
        playListImageView.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor).isActive = true
        playListImageView.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor).isActive = true

        
        
        playListImageView.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
            
        }
    }
}

