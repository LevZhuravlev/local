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
    private var currentview: ViewWithRegistrationField?
    private var indexOfCurrentView: Int?
    private var nameSettingView: ViewWithRegistrationField?
    private var descriptionSettingView: ViewWithRegistrationField?
    private var tagSettingView: ViewWithRegistrationField?
    private var dateSettingView: ViewWithRegistrationDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        setCustomNavigationBar()
        setMainScrollView()
        setMainStackView()
        setCustomNavigationBar()
    }
    
    private func setCustomNavigationBar() {
        customNavigationBar = UIView()
        
        if let customNavigationBar = customNavigationBar {
            view.addSubview(customNavigationBar)
            customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            customNavigationBar.heightAnchor.constraint(equalToConstant: 45).isActive = true
            customNavigationBar.clipsToBounds = true
            
            settingButton = {
                let view = UIButton()
                let parent = customNavigationBar
                parent.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: 40).isActive = true
                view.heightAnchor.constraint(equalToConstant: 40).isActive = true
                view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
                
                view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 16).isActive = true
                view.addTarget(self, action: #selector(deleteButtonTouched), for: .touchUpInside)
                view.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
                return view
            }()
            
        }
    }
 
    private func setMainScrollView() {
        mainScrollView = {
            let view = UIScrollView()
            
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: customNavigationBar?.bottomAnchor ?? view.topAnchor, constant: -32).isActive = true
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            view.isPagingEnabled = true
            view.isScrollEnabled = false
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
            
            // MARK: - Name
            nameSettingView = ViewWithRegistrationField(frame: CGRect(), withName: "Дайте имя вашему событию!", placeholder: "Придумайте короткую броскую фразу")
            view.addArrangedSubview(nameSettingView!)

            currentview = nameSettingView
            indexOfCurrentView = 0
            
            // MARK: - Desription

            descriptionSettingView = ViewWithRegistrationField(frame: CGRect(), withName: "Добавьте описание", placeholder: "Введите краткое описание, чтобы гости могли знать, чего ожидать")
            view.addArrangedSubview(descriptionSettingView!)
            
            // MARK: - Tags

            tagSettingView = ViewWithRegistrationField(frame: CGRect(), withName: "Добавьте теги", placeholder: "Введите теги через запятую", isFieldOptional: true)
            view.addArrangedSubview(tagSettingView!)

            // MARK: - Dates
            
            dateSettingView = ViewWithRegistrationDate(frame: CGRect(), withName: "Выберите дату и продолжительность", placeholder: "Введите дату и время начала")
            view.addArrangedSubview(dateSettingView!)

            currentview = view.arrangedSubviews[0] as? ViewWithRegistrationField
            indexOfCurrentView = 0
            
            view.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: CGFloat(view.arrangedSubviews.count)).isActive = true
            return view
        }()
    }
        
    @objc func deleteButtonTouched() {
        
        guard let currentview = currentview else {return}
        
        currentview.endEditing(true)
                
        if indexOfCurrentView == 0 && (currentview.textField?.text == currentview.textFieldPlaceholder || currentview.textField?.text.isEmpty == true) {
            self.navigationController?.popViewController(animated: true)
        } else {
            view.addSubview(EventRegPopUp())

        }
    }
    
    @objc func nextFiledTouched() {
        
        if (indexOfCurrentView ?? 0) + 1 < mainStackView?.arrangedSubviews.count ?? 0 {
            mainScrollView?.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * CGFloat((indexOfCurrentView ?? 0) + 1), y: 0), animated: true)
            mainScrollView?.isScrollEnabled = true
        }
    }
    
    @objc func continueFiledTouched() {
        nextFiledTouched()
    }
    
    @objc func goOutIsTouched() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func deleteIsTouched() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EventRegViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            
            let index = Int((scrollView.contentOffset.x / scrollView.frame.width).rounded(.down))

            if (scrollView.contentOffset.x / UIScreen.main.bounds.width) == (scrollView.contentOffset.x / UIScreen.main.bounds.width).rounded(.up) {
                
                if currentview != nil {
                    currentview?.textField?.resignFirstResponder()
                }
                
                currentview = mainStackView?.arrangedSubviews[index] as? ViewWithRegistrationField
                indexOfCurrentView = index
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
