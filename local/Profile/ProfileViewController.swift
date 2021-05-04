//
//  ProfileViewController.swift
//  local
//
//  Created by Zhuravlev Lev on 27.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Navigation Bar
    private var customNavigationBar: UIView?
    private var backButton: UIButton?
    private var settingButton: UIButton?

    // Main scroll view
    private var mainScrollView: UIScrollView?
    
    // Profile data
    private var profileLabel: UILabel?
    private var profilePicture: UIImageView?
    private var viewForMessnger: UIView?
    private var stackForProfileData: UIStackView?
    
    // Segmented controll
    private var customSegmentedControll: UIStackView?
    private var customSegmentedControllForNavigationBar: UIStackView?
    private var customSegmentedControllForNavigationBarTopAnchor: NSLayoutConstraint?
    private var barForSegmentedControll: UIView?
    private var likedLabel: UIButton?
    private var createdLabel: UIButton?
    
    // Collection controll
    private var collectionScrollView: UIScrollView?
    private var stackForCollecionView: UIStackView?
    private var scrollViewHelperAvailable = false
    private var heigthForStacks: CGFloat?
    
    // Create new event
    private var eventCreationButton: UIButton?
    private var lilEventCreationButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        setCustomNavigationBar()
        setMainScrollView()
        setProfileData()
        setCustomSegmentedControll()
        setCustomSegmentedControllForNavifationBar()
        setCollectionScrollView()
        setEventCreationButton()
        setLilEventCreationButton()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    private func setMainScrollView() {
        mainScrollView = {
            let view = UIScrollView()
            
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: self.customNavigationBar!.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            view.showsVerticalScrollIndicator = false
            view.delegate = self
            return view
        }()
    }
    
    private func setCustomNavigationBar() {
        customNavigationBar = UIView()
        
        if let customNavigationBar = customNavigationBar {
            view.addSubview(customNavigationBar)
            customNavigationBar.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
            customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            customNavigationBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
            customNavigationBar.clipsToBounds = true
            
            backButton = {
                let view = UIButton()
                let parent = customNavigationBar
                parent.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: 40).isActive = true
                view.heightAnchor.constraint(equalToConstant: 40).isActive = true
                view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
                view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 16).isActive = true
                view.addTarget(self, action: #selector(backbuttonTouched), for: .touchUpInside)
                view.setImage(#imageLiteral(resourceName: "arrow-left"), for: .normal)
                return view
            }()
    
            settingButton = {
                let view = UIButton()
                let parent = customNavigationBar
                parent.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: 40).isActive = true
                view.heightAnchor.constraint(equalToConstant: 40).isActive = true
                view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
                
                view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 16).isActive = true
                view.addTarget(self, action: #selector(settingsButtonTouched), for: .touchUpInside)
                view.setImage(#imageLiteral(resourceName: "more-dots"), for: .normal)
                return view
            }()
            
        }
    }
    
    private func setProfileData() {
        
        stackForProfileData = {
            let view = UIStackView()
            
            if let mainScrollView = mainScrollView {
                
                mainScrollView.addSubview(view)
                view.axis = .vertical
                view.spacing = 13
                view.translatesAutoresizingMaskIntoConstraints = false
                view.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
                view.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
                view.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
            }
            
            return view
        }()
        
        let parent = stackForProfileData
        
        profilePicture = {
            let parentForImageView = UIView()
            
            parent?.addArrangedSubview(parentForImageView)
            parentForImageView.translatesAutoresizingMaskIntoConstraints = false
            parentForImageView.heightAnchor.constraint(equalToConstant: 124).isActive = true
            
            let view = UIImageView()
            if parent != nil {
                parentForImageView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalToConstant: 124).isActive = true
                view.widthAnchor.constraint(equalToConstant: 124).isActive = true
                view.centerXAnchor.constraint(equalTo: parentForImageView.centerXAnchor).isActive = true
                view.topAnchor.constraint(equalTo: parentForImageView.topAnchor).isActive = true
                
                // MARK: TO-DO Model View
                view.image = #imageLiteral(resourceName: "profileimage")
                view.contentMode = .scaleAspectFit
                view.layer.cornerRadius = 62
                view.clipsToBounds = true

            }
            
            return view
        }()
        
        profileLabel = {
            
            let view = UILabel()

            view.textColor = .white
            view.font = UIFont(name: "Roboto-Bold", size: 20)
            
            // MARK: TO-DO Model View
            let text = "Innokentiy Istrebitel"
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.68
          
            if let parent = parent {

                parent.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalToConstant: 24).isActive = true
            }
            
            view.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            view.textAlignment = .center

            return view
        }()
        
        viewForMessnger = {
            let view = UIView()
            
            parent?.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 100).isActive = true

            let horizontalStack = UIStackView()
            parent?.addArrangedSubview(horizontalStack)
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false

            // MARK: TO-DO: model view
            let _: [UIView] = ["Телефон", "Telegram", "What's app", "Instagram" ].map { (name) -> UIView in

                let verticalStack = UIStackView()
                verticalStack.axis = .vertical

                horizontalStack.addArrangedSubview(verticalStack)
                verticalStack.translatesAutoresizingMaskIntoConstraints = false

                // icon
                let icon = UIImageView()
                verticalStack.addArrangedSubview(icon)
                icon.image = UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
                icon.contentMode = .scaleAspectFit
                icon.translatesAutoresizingMaskIntoConstraints = false
                icon.heightAnchor.constraint(equalToConstant: 44).isActive = true

                return verticalStack
            }

            _ = horizontalStack.arrangedSubviews.map { (colorView) in
                colorView.widthAnchor.constraint(equalTo: parent?.widthAnchor ?? view.widthAnchor, multiplier: 1/4, constant: -20).isActive = true
            }

            view.addSubview(horizontalStack)

            horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            return view
        }()
        
    }
    
    private func setCustomSegmentedControllForNavifationBar() {
        
        customSegmentedControllForNavigationBar = {
            let view = UIStackView()
            view.isLayoutMarginsRelativeArrangement = true
            view.distribution = .fillEqually
            
            if let customNavigationBar = customNavigationBar {
                customNavigationBar.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.centerYAnchor.constraint(equalTo: backButton!.centerYAnchor).isActive = true
                view.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 64).isActive = true
                view.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -48).isActive = true
                view.heightAnchor.constraint(equalTo: customNavigationBar.heightAnchor, constant: -8).isActive = true
                view.alpha = 0
            }
            return view
            }()
        
        guard let customSegmentedControllForNavigationBar = customSegmentedControllForNavigationBar else {
            return
        }
        
        let parent = customSegmentedControllForNavigationBar

        // Label "Liked"
        likedLabel = {
            
            let view = UIButton()
                            
            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 16) ??
                    UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "Понравившиеся",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            view.addTarget(nil, action: #selector(likedLabelTouched), for: .touchUpInside)
            
            parent.addArrangedSubview(view)
            return view
        }()
        
        // Label "Created"
        createdLabel = {
        
            let view = UIButton()
                            
            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 16) ??
                    UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "Созданные",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            view.addTarget(nil, action: #selector(createdLabelTouched), for: .touchUpInside)
            parent.addArrangedSubview(view)
            view.alpha = 0.3
            return view
        }()
    }
    
    private func setCustomSegmentedControll() {
        
        if customSegmentedControll == nil {
            
            customSegmentedControll = {
                
                let view = UIStackView()
                view.isLayoutMarginsRelativeArrangement = true
                view.distribution = .fillEqually
                
                return view
                }()
        }
        
        guard let customSegmentedControll = customSegmentedControll else {
            return
        }
        
        if let mainScrollView = mainScrollView,
           let stackForProfileData = stackForProfileData {
        
        mainScrollView.addSubview(customSegmentedControll)
        customSegmentedControll.translatesAutoresizingMaskIntoConstraints = false
        customSegmentedControll.topAnchor.constraint(equalTo: stackForProfileData.bottomAnchor).isActive = true
        customSegmentedControll.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        customSegmentedControll.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        customSegmentedControll.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        let parent = customSegmentedControll

        // Label "Liked"
        likedLabel = {
            
            let view = UIButton()
                            
            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 16) ??
                    UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "Понравившиеся",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            view.addTarget(nil, action: #selector(likedLabelTouched), for: .touchUpInside)
            
            parent.addArrangedSubview(view)
            return view
        }()
        
        // Label "Created"
        createdLabel = {
        
            let view = UIButton()
                            
            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 16) ??
                    UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "Созданные",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            view.addTarget(nil, action: #selector(createdLabelTouched), for: .touchUpInside)
            parent.addArrangedSubview(view)
            view.alpha = 0.3
            return view
        }()
        
        barForSegmentedControll = {
            let view = UIView()
            
            view.layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor
            view.layer.cornerRadius = 2

            parent.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 64).isActive = true
            view.heightAnchor.constraint(equalToConstant: 4).isActive = true
            view.centerXAnchor.constraint(equalTo: likedLabel?.centerXAnchor ?? parent.centerXAnchor).isActive = true
            view.topAnchor.constraint(equalTo: likedLabel?.bottomAnchor ?? parent.topAnchor, constant: -6).isActive = true

            return view
        }()
    }
    
    private func setCollectionScrollView() {
        
        collectionScrollView = {
            let view = UIScrollView()
            
            if let stackForProfileData = stackForProfileData,
               let mainScrollView = mainScrollView {
                
                mainScrollView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.topAnchor.constraint(equalTo: customSegmentedControll?.bottomAnchor ?? stackForProfileData.bottomAnchor).isActive = true
                view.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
                view.heightAnchor.constraint(equalToConstant: 1700).isActive = true
                view.isPagingEnabled = true
//                view.bounces = false

                view.delegate = self
                
            }
            return view
        }()
        
        stackForCollecionView = {
            let view = UIStackView()
            view.distribution = .fillEqually
            
            guard let collectionScrollView = collectionScrollView else {return view}
            collectionScrollView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: collectionScrollView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: collectionScrollView.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: collectionScrollView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: collectionScrollView.trailingAnchor).isActive = true
            view.heightAnchor.constraint(equalToConstant: 1700).isActive = true
                        
            let likedView = UIView()
            likedView.backgroundColor = .orange
            view.addArrangedSubview(likedView)
            likedView.translatesAutoresizingMaskIntoConstraints = false
            likedView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

            let createdView = UIView()
            createdView.backgroundColor = .red
            view.addArrangedSubview(createdView)
            createdView.translatesAutoresizingMaskIntoConstraints = false
            createdView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    
            return view
        }()
        
    }
    
    private func setEventCreationButton() {
        eventCreationButton = {
            let view = UIButton()
            
            view.layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor

            view.layer.cornerRadius = 14

            let parent = self.view!

            parent.addSubview(view)

            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 336).isActive = true
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            view.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
            view.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true

            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 14) ??
                    UIFont.systemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "СОЗДАТЬ СОБЫТИЕ",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            
            view.addTarget(self, action: #selector(setEventCreationButtonTouched), for: .touchUpInside)
            
            return view
        }()
    }
    
    private func setLilEventCreationButton() {
        lilEventCreationButton = {
            let view = UIButton()
            
            view.layer.backgroundColor = UIColor(red: 1, green: 0.275, blue: 0.533, alpha: 1).cgColor

            view.layer.cornerRadius = 14

            let parent = self.view!

            parent.addSubview(view)

            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 48).isActive = true
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            view.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
            view.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

            let yourAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 24) ??
                    UIFont.systemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle: 0 ]
            
            let attributeString = NSMutableAttributedString(string: "+",
                                                            attributes: yourAttributes)

            view.setAttributedTitle(attributeString, for: .normal)
            view.tintColor = .white
            view.alpha = 0
            view.addTarget(self, action: #selector(setEventCreationButtonTouched), for: .touchUpInside)

            return view
        }()
    }
        
    @objc func backbuttonTouched() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func settingsButtonTouched() {
        view.addSubview(SettingsPopUp())
    }
    
    @objc func likedLabelTouched() {
        UIView.animate(withDuration: 0.2) {
            self.collectionScrollView?.contentOffset.x = 0
        }

    }
    
    @objc func createdLabelTouched() {
        UIView.animate(withDuration: 0.2) {
            self.collectionScrollView?.contentOffset.x = UIScreen.main.bounds.width
        }
    }
    
    @objc func setEventCreationButtonTouched() {
        let eventRegViewController = EventRegViewController()
        navigationController?.pushViewController(eventRegViewController, animated: true)
    }
}

extension ProfileViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return (navigationController?.viewControllers.count)! > 1
    }
}

extension ProfileViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Collection Scroll
        if scrollView == collectionScrollView {
            
            // Back to root when swipe left
            if scrollView.contentOffset.x < -15 {
                navigationController?.popViewController(animated: true)
                return
            }
            
            barForSegmentedControll?.transform = CGAffineTransform(translationX: +((scrollView.contentOffset.x)/2), y: 0)
            
            if let createdLabel = customSegmentedControllForNavigationBar?.arrangedSubviews[1], let likedLabel = customSegmentedControllForNavigationBar?.arrangedSubviews[0] {
                
                createdLabel.alpha = (0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x)) > 0 ? 0.3 + 0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x) : 0.3
                likedLabel.alpha =  (UIScreen.main.bounds.width > scrollView.contentOffset.x) ? 1 - 0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x) : 0.3
            }
            
            if let createdLabel = customSegmentedControll?.arrangedSubviews[1], let likedLabel = customSegmentedControll?.arrangedSubviews[0] {
                
                createdLabel.alpha = (0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x)) > 0 ? 0.3 + 0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x) : 0.3
                likedLabel.alpha =  (UIScreen.main.bounds.width > scrollView.contentOffset.x) ? 1 - 0.7 / (UIScreen.main.bounds.width/scrollView.contentOffset.x) : 0.3
            }
        }
        
        // Main Scroll
        if scrollView == mainScrollView,
           let stackForProfileData = stackForProfileData {
            
            if heigthForStacks == nil {
                heigthForStacks = stackForProfileData.frame.height + customNavigationBar!.frame.height * 1/2
            }
            
            guard let heigthForStacks = heigthForStacks else {
                return
            }
            
            // scrolling ⬇️
            if scrollView.contentOffset.y > heigthForStacks && !scrollViewHelperAvailable {
                
                UIView.animate(withDuration: 0.2) {
                    self.view!.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
                    self.customNavigationBar!.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
                    self.customSegmentedControllForNavigationBar?.alpha = 1
                    self.lilEventCreationButton?.alpha = 1
                    self.eventCreationButton?.transform = CGAffineTransform(translationX: +UIScreen.main.bounds.width, y: 0)
                }
                mainScrollView?.showsVerticalScrollIndicator = true
                scrollViewHelperAvailable = true
            }
                        
            // scrolling ⬆️
            if scrollView.contentOffset.y < heigthForStacks && scrollViewHelperAvailable {
                
                UIView.animate(withDuration: 0.2) {
                    self.view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
                    self.customNavigationBar!.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
                    self.customSegmentedControllForNavigationBar?.alpha = 0
                    self.lilEventCreationButton?.alpha = 0
                    self.eventCreationButton?.transform = .identity
                }
                
                mainScrollView?.showsVerticalScrollIndicator = false
                scrollViewHelperAvailable = false
            }
        }
    }
}
