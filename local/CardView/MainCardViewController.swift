//
//  ViewController.swift
//  local
//
//  Created by Zhuravlev Lev on 05.04.2021.
//

import UIKit

class MainCardViewController: UIViewController {
    
    // MainView
    var mainScrollView: UIScrollView!
    var mainStackView: UIStackView!
    var needToScrollBack = false
    
    // Gallery
    var imageGalleryScrollView: UIScrollView!
    var imageGalleryScrollLayer: UIView!
    var barStackView: UIStackView!
    lazy var galleryHeight: CGFloat = view.frame.width * 1.5
    
    // Despription
    var descriptionCard: DescriptionCardView!
    var nameLabel: UILabel! 
    var priceLabel: UILabel?
    var tags: TagsWithBar?
    var infoButton: UIButton!
    
    // Despription Anchor's
    var paddingForCard: CGFloat = 18 
    var desriptionHeight: NSLayoutConstraint! {
        willSet {
            if let desriptionHeight = desriptionHeight {
                desriptionHeight.isActive = false
            }
        }
        
        didSet {
            if let desriptionHeight = desriptionHeight {
                desriptionHeight.isActive = true
            }
        }
    }
    var despriptionLeading: NSLayoutConstraint! {
        willSet {
            if let despriptionLeading = despriptionLeading {
                despriptionLeading.isActive = false
            }
        }
        
        didSet {
            if let despriptionLeading = despriptionLeading {
                despriptionLeading.isActive = true
            }
        }
    }
    var despriptionTrailing: NSLayoutConstraint! {
        willSet {
            if let despriptionTrailing = despriptionTrailing {
                despriptionTrailing.isActive = false
            }
        }
        
        didSet {
            if let despriptionTrailing = despriptionTrailing {
                despriptionTrailing.isActive = true
            }
        }
    }

    // Full Despription
    var isFullDesriptionAvailable = false {
        didSet {
            if oldValue != isFullDesriptionAvailable {
                if oldValue == false {
                    
                    
                    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) {
                        self.infoButton.setImage(#imageLiteral(resourceName: "Vector-1"), for: .normal)
                        self.infoButton.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
                        self.infoButton.transform = CGAffineTransform(translationX: -30, y: -30).scaledBy(x:  1.2, y:  1.2)
                        self.infoButton.layer.cornerRadius = 9

                    }
                }
                
                else {
                    
                   
                    

                    UIView.animate(withDuration: 0.2) {
                        self.infoButton.setImage(#imageLiteral(resourceName: "info"), for: .normal)
                        self.infoButton.backgroundColor = .none
                        self.infoButton.transform =  .identity

                    }
                }
                
                // info button settings
                
              
                
                setFullDesription()

            }
        }
    }
    var fullDespriptionStack: MainFullDescriptionStackView?
    
    // Bottom
    var bottomViewForStack: UIView!
    var stackWithButtons: UIStackView!
    var bottomStackHeight: NSLayoutConstraint!
    lazy var bottomHeight: CGFloat = view.frame.height - galleryHeight + 15
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setMainScrollView()
        setMainStackView()
        setImageGalleryScrollView()
        setMainCatdBottom()
        setDescrpitionCard()
    
    }
    
    @objc func buttonConnectTouched() {
        let popUp = PopUp()
        view.addSubview(popUp)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainScrollView.contentOffset.y = 0
    }
    


    
}



