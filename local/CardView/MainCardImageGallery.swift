//
//  ImageGallery.swift
//  local
//
//  Created by Zhuravlev Lev on 05.04.2021.
//

import UIKit

extension MainCardViewController {

    func setProfileButton() {
        profileButton = {
            let view = UIButton()
            view.frame = CGRect()
            view.layer.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1).cgColor
            view.layer.cornerRadius = 12
            view.setImage(#imageLiteral(resourceName: "user"), for: .normal)
            view.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
            return view

        }()

        if let profileButton = profileButton {
            mainScrollView.addSubview(profileButton)
            profileButton.translatesAutoresizingMaskIntoConstraints = false
            profileButton.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 36).isActive = true
            profileButton.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor, constant: 16).isActive = true
            profileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            profileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }

    func setImageGalleryScrollView() {

        imageGalleryScrollLayer = UIView()

        mainStackView.addArrangedSubview(imageGalleryScrollLayer)

        imageGalleryScrollLayer.translatesAutoresizingMaskIntoConstraints = false
        imageGalleryScrollLayer.heightAnchor.constraint(equalToConstant: galleryHeight).isActive = true
        imageGalleryScrollLayer.backgroundColor = .blue

        imageGalleryScrollView = UIScrollView()
        imageGalleryScrollLayer.addSubview(imageGalleryScrollView)

        imageGalleryScrollView.backgroundColor = .gray
        imageGalleryScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageGalleryScrollView.trailingAnchor.constraint(equalTo: imageGalleryScrollLayer.trailingAnchor).isActive = true
        imageGalleryScrollView.topAnchor.constraint(equalTo: imageGalleryScrollLayer.topAnchor).isActive = true
        imageGalleryScrollView.bottomAnchor.constraint(equalTo: imageGalleryScrollLayer.bottomAnchor).isActive = true
        imageGalleryScrollView.leadingAnchor.constraint(equalTo: imageGalleryScrollLayer.leadingAnchor).isActive = true

        imageGalleryScrollView.delegate = self

        // Here I set photo's proportion
        imageGalleryScrollView.heightAnchor.constraint(equalToConstant: galleryHeight).isActive = true

        let viewCollection = [UIImage(named: "page1"), UIImage(named: "page2"), UIImage(named: "page 3")]

        imageGalleryScrollView.contentSize.width = view.frame.width * CGFloat(viewCollection.count)
        imageGalleryScrollView.contentSize.height = galleryHeight

        _ = viewCollection.reduce(into: 0) { (res, image) in

            let view = UIImageView(frame: CGRect(x: CGFloat(res), y: .zero, width: self.view.bounds.width, height: imageGalleryScrollView.contentSize.height))

            view.image = image
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            imageGalleryScrollView.addSubview(view)
            res += Int(self.view.bounds.width)
        }

        imageGalleryScrollView.isPagingEnabled = true
        imageGalleryScrollView.showsHorizontalScrollIndicator = false

        if viewCollection.count > 1 {
            setupBarforImageGalleryScrollView(numberOfPages: viewCollection.count, currentPage: 1)
        }

    }
    func setupBarforImageGalleryScrollView(numberOfPages: Int, currentPage: Int) {

            barStackView = UIStackView()
            imageGalleryScrollLayer.addSubview(barStackView)

            barStackView.translatesAutoresizingMaskIntoConstraints = false
        if let profileButton = profileButton {
            barStackView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: view.safeAreaInsets.top + 8 ).isActive = true
        } else {
            barStackView.topAnchor.constraint(equalTo: imageGalleryScrollLayer.topAnchor, constant: view.safeAreaInsets.top + 40 ).isActive = true
        }

            barStackView.heightAnchor.constraint(equalToConstant: 4).isActive = true
            barStackView.leadingAnchor.constraint(equalTo: imageGalleryScrollLayer.leadingAnchor, constant: 4).isActive = true
            barStackView.trailingAnchor.constraint(equalTo: imageGalleryScrollLayer.trailingAnchor, constant: -4).isActive = true

            barStackView.spacing = 4
            barStackView.distribution = .fillEqually
            (0..<numberOfPages).forEach { (_) in
                let barVIew = UIView()
                barVIew.layer.backgroundColor = UIColor(red: 0.887, green: 0.887, blue: 0.887, alpha: 1).cgColor
                barVIew.layer.cornerRadius = 2
                barStackView.addArrangedSubview(barVIew)
            }

            setPage(for: barStackView)
        }
    func setPage(currentPage: Int = 0, for barStackView: UIStackView) {

            barStackView.arrangedSubviews.forEach {
                $0.layer.backgroundColor = UIColor(red: 0.887, green: 0.887, blue: 0.887, alpha: 1).cgColor
            }

            barStackView.arrangedSubviews[currentPage].layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor

        }

    @objc func goToProfile() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)

    }
}
