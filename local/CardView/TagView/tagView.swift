//
//  tagView.swift
//  cards
//
//  Created by Zhuravlev Lev on 30.03.2021.
//

import UIKit

protocol TagView: class {
    
    var tagNameList: [String] {get set}
    var tagList: [UIButton] {get}
    func makeTag(for text: String, isChoosen: Bool) -> UIButton
    
//    func setCurrentPage(currentPage: Int)
//    func setupBarsStackView(numberOfPages: Int, currentPage: Int, for scroolView: UIScrollView) -> UIView
}

class Tags: UIScrollView, TagView {
    
    
    // MARK: TO-DO: ModelView
    var tagNameList: [String] = ["Ретро", "Музыка", "18+","Funk", "Rock", "То", "Это" ,"Движ", "Музыка"]
    lazy var tagList: [UIButton] = tagNameList.map { (text) -> UIButton in
        return self.makeTag(for: text)
    }
    
    var tagListSize: [CGSize] = []
    
    var tagStack = UIStackView()
    
    // Settings For Bar
    var needInBar = false
    var numberOfPages = 0
    var totalWidth: CGFloat = 0

    // MARK: - Style Propeties

    var backgroundForTag = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
    var colorForTint = UIColor(red: 0.416, green: 0.827, blue: 0.655, alpha: 1)
    var fontForTint = UIFont(name: "Roboto-Regular", size: 14)
    
    // MARK: - initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let tagScroll = self
        tagScroll.addSubview(tagStack)
        
        tagStack.translatesAutoresizingMaskIntoConstraints = false
        tagStack.topAnchor.constraint(equalTo: tagScroll.topAnchor).isActive = true
        tagStack.leadingAnchor.constraint(equalTo: tagScroll.leadingAnchor).isActive = true
        tagStack.trailingAnchor.constraint(equalTo: tagScroll.trailingAnchor).isActive = true
        tagStack.bottomAnchor.constraint(equalTo: tagScroll.bottomAnchor).isActive = true
        
        tagStack.axis = .horizontal
        tagStack.spacing = 8
        let _ = tagList

        
        
//        tagScroll.contentSize = CGSize(
//            width: tagList.reduce(into: 0, { (res, button)  in res += button.bounds.width + 8}),
//            height:  tagScroll.bounds.height)
        
        
        tagScroll.layer.cornerRadius = 12
        tagScroll.clipsToBounds = true
        tagScroll.isPagingEnabled = true
        tagScroll.showsHorizontalScrollIndicator = false
        tagScroll.heightAnchor.constraint(equalTo: tagStack.heightAnchor).isActive = true

        
        numberOfPages = Int((totalWidth /  UIScreen.main.bounds.width).rounded(.up))
        
        
//        let tagBarStackView = setupBarsStackView(numberOfPages: numberOfPages, currentPage: 0, for: tagScroll)
//        setCurrentPage()
//        addSubview(tagBarStackView)
        
        if tagNameList.isEmpty {
            return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Making Tags

    func makeTag(for text: String, isChoosen: Bool = false) -> UIButton {
        
        let tagButton = UIButton()
        tagStack.addArrangedSubview(tagButton)
        
        tagButton.translatesAutoresizingMaskIntoConstraints = false
        
        let tagLabel = text
        tagButton.setTitle(tagLabel, for: .normal)
        
        let font = UIFont(name: "Roboto-Bold", size: 24)
        tagButton.titleLabel?.font = fontForTint ?? UIFont.systemFont(ofSize: 14)
        tagButton.layer.backgroundColor = backgroundForTag.cgColor
        
        let attr = [NSAttributedString.Key.font: font]
        let size = (tagLabel as NSString).size(withAttributes: attr as [NSAttributedString.Key : Any])
        tagButton.titleLabel?.textAlignment = .center
        tagButton.widthAnchor.constraint(equalToConstant: size.width + 18).isActive = true
        tagButton.heightAnchor.constraint(equalToConstant: size.height + 12).isActive = true
        tagButton.layer.cornerRadius = 12
        
        
        
        let yourAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont(name: "Roboto-Regular", size: 14) ??
                UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.416, green: 0.827, blue: 0.655, alpha: 1),
            NSAttributedString.Key.underlineStyle : 0 ]
        let attributeString = NSMutableAttributedString(string: text,
                                                        attributes: yourAttributes)
        
        tagButton.setAttributedTitle(attributeString, for: .normal)
        tagButton.tintColor = .red
        
        tagListSize.append(size)
        
        
        // Counting of total width
        totalWidth += size.width + tagStack.spacing + 36
        
        if totalWidth > UIScreen.main.bounds.width {
            needInBar = true
        }
        
        if isChoosen {
            tagButton.layer.borderColor = colorForTint.cgColor
            tagButton.layer.borderWidth = 1
        }
        
        return tagButton
    }
}





// MARK: - ClassWithBar
class TagsWithBar: UIView {
    
    var tagScroll: Tags!
    lazy var colorForTint = UIColor(red: 0.416, green: 0.827, blue: 0.655, alpha: 1)
    lazy var barForTagScroll = UIView()
    lazy var stackForTagsAndBar = UIStackView()
    lazy var widthForBar = tagScroll.numberOfPages
    var currentPage: Int = 0 {
        
        willSet {
            setCurrentPage(currentPage: newValue)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tagScroll = Tags()
        tagScroll.delegate = self
        stackForTagsAndBar.addArrangedSubview(tagScroll) // <-
        

        stackForTagsAndBar.axis = .vertical
        stackForTagsAndBar.spacing = 12

        
        
        if tagScroll.needInBar {

        barForTagScroll = setupBarsStackView(numberOfPages: tagScroll.numberOfPages, currentPage: currentPage)
        stackForTagsAndBar.addArrangedSubview(barForTagScroll)
        }
        
 
        addSubview(stackForTagsAndBar)

        stackForTagsAndBar.translatesAutoresizingMaskIntoConstraints = false
        stackForTagsAndBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackForTagsAndBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackForTagsAndBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        
        heightAnchor.constraint(equalTo: stackForTagsAndBar.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - BarSetup
    
    var viewsForFlex: [UIView] = []
    var barStackView: UIStackView!
    
    func setupBarsStackView(numberOfPages: Int, currentPage: Int) -> UIView {
        
        
        barStackView = UIStackView()
        barStackView.spacing = 4
        barStackView.axis = .horizontal
        barStackView.distribution = .fill
        
        (0..<numberOfPages).forEach{ (_)  in
            let locview = UIView()
            locview.backgroundColor = colorForTint
            locview.layer.cornerRadius = 2
            barStackView.addArrangedSubview(locview)
            viewsForFlex.append(locview)
            widthAnchors.append(locview.widthAnchor.constraint(equalToConstant: 4))
        }
        
        
        barStackView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        barStackView.isLayoutMarginsRelativeArrangement = true
        
        // MARK:  BarWidthSetup

        
        let n = CGFloat(tagScroll.numberOfPages)
        
        let barStackViewPadding: CGFloat = ((UIScreen.main.bounds.width - 36 - 36 - 16 - ((n - 1) * barStackView.arrangedSubviews[0].layer.cornerRadius + (n - 1)*barStackView.spacing + 3 * barStackView.arrangedSubviews[0].layer.cornerRadius))/2).rounded(.down)
        
//        let barStackViewPadding: CGFloat = 130
        

        
        barStackView.layoutMargins = UIEdgeInsets(top: 0, left: barStackViewPadding, bottom: 0, right: barStackViewPadding)
        setCurrentPage()
        
        return barStackView
        
    }
    
    var dragDirection: Bool?  // true for right false left
    
    var widthAnchors: [NSLayoutConstraint] = []
    var notFirstTime = false
    
    func setCurrentPage(currentPage: Int = 0) {
        

        UIView.animate(withDuration: 0.2, animations: {
            self.widthAnchors[currentPage].isActive = false
            self.viewsForFlex[currentPage].backgroundColor = self.colorForTint
            
            for i in self.widthAnchors.indices where i != currentPage {
                
                self.widthAnchors[i].isActive = true
                self.viewsForFlex[i].backgroundColor = .systemGray
            }
            
            if self.notFirstTime {
                self.barStackView.layoutIfNeeded()
            }
            
            self.notFirstTime = true
            
        })
    
    }
}
    


extension TagsWithBar: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = Int((tagScroll.contentOffset.x/tagScroll.frame.width).rounded(.up))
        

        if pageIndex < 0 || pageIndex > tagScroll.numberOfPages - 1 {
            return
        } else {
            
            if self.currentPage != pageIndex {
                self.dragDirection = (self.currentPage < pageIndex)
                self.currentPage = pageIndex
        }
        
        }
    }
}

