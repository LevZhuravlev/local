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
            
                }
                else {
        
                }
                
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
    
    override func viewDidAppear(_ animated: Bool) {
        mainScrollView.contentOffset.y = 0
    }
    
}



