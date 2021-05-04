//
//  EventRegViewController.swift
//  local
//
//  Created by Zhuravlev Lev on 03.05.2021.
//

import UIKit

class EventRegViewController: UIViewController {

    // Navigation Bar
    private var customNavigationBar: UIView?
    private var backButton: UIButton?
    private var settingButton: UIButton?
    
    // Main Views
    private var mainScrollView: UIScrollView?
    private var mainStackView: UIStackView?
    
    // NameSettings
    private var nameSettingView: ViewWithRegistrationField?
    private var descriptionSettingView: ViewWithRegistrationField?
    private var tagSettingView: ViewWithRegistrationField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        setCustomNavigationBar()
        setMainScrollView()
        setMainStackView()
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
 
    private func setMainScrollView() {
        mainScrollView = {
            let view = UIScrollView()
            
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: self.customNavigationBar!.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            view.isPagingEnabled = true
//            view.isScrollEnabled = false
            view.showsHorizontalScrollIndicator = false
            view.delegate = self
            return view
        }()
    }

    private func setMainStackView() {
        
        guard let mainScrollView = mainScrollView else { return }

        mainStackView = {
            let view = UIStackView()
            
            mainScrollView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
            view.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor).isActive = true
            view.distribution = .fillEqually
            
            nameSettingView = ViewWithRegistrationField(frame: CGRect(), withName: "Дайте имя вашему событию!", placeholder: "Придумайте короткую броскую фразу")
            view.addArrangedSubview(nameSettingView!)
            
            descriptionSettingView = ViewWithRegistrationField(frame: CGRect(), withName: "Добавьте описание", placeholder: "Введите краткое описание, чтобы гости могли знать, чего ожидать")
            view.addArrangedSubview(descriptionSettingView!)
                    
            view.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: CGFloat(view.arrangedSubviews.count)).isActive = true

            return view
        }()
    }
    
    private func setNameSettings() {
    }
        
    @objc func backbuttonTouched() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func settingsButtonTouched() {
        view.addSubview(SettingsPopUp())
    }
    
    @objc func nextFiledTouched(textField: UITextField) {
        mainScrollView?.setContentOffset(CGPoint(x: UIScreen.main.bounds.width, y: 0), animated: true)
    }
}

extension EventRegViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            
            let index = Int((scrollView.contentOffset.x / scrollView.frame.width).rounded(.up))

            if (scrollView.contentOffset.x / UIScreen.main.bounds.width) == (scrollView.contentOffset.x / UIScreen.main.bounds.width).rounded(.up) {
                let currentview = mainStackView?.arrangedSubviews[index] as? ViewWithRegistrationField
                
                guard let view = currentview else {
                    return
                }
                
                if view.textField?.text == view.textFieldPlaceholder {
                    view.textField?.becomeFirstResponder()
                }
            }
        }
    }
}
