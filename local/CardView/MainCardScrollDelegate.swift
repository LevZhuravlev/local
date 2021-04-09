//
//  MainCardScrollDelegate.swift
//  local
//
//  Created by Zhuravlev Lev on 06.04.2021.
//

import UIKit

// Realisation of scrolling methods

extension MainCardViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == imageGalleryScrollView {
            
            let pageIndex = (imageGalleryScrollView.contentOffset.x / imageGalleryScrollView.frame.width)
            let roundedPageIndex  = Int(pageIndex.rounded())
            setPage(currentPage: roundedPageIndex, for: barStackView)
            
        }
        
        else {
            if  mainScrollView.contentOffset.y < 0 {
                mainScrollView.showsVerticalScrollIndicator = false
                mainScrollView.contentOffset.y = 0
                needToScrollBack = false
            }
            
            if  mainScrollView.contentOffset.y > 10 && !isFullDesriptionAvailable {
                isFullDesriptionAvailable = true
            }
            
            if  mainScrollView.contentOffset.y == 0 && isFullDesriptionAvailable {
                isFullDesriptionAvailable = false
            }
            
            
        }
    }
}
