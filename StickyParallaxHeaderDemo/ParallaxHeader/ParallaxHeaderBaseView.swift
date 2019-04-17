//
//  SPHeader.swift
//  StickeyParallaxHeaderDemo
//
//  Created by Yiyin Shen on 17/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class ParallaxHeaderBaseView: UIView {
    var alphaModifiableViews: [UIView] = []
    var headerMinHeight: CGFloat = 150
    var headerMaxHeight: CGFloat = 0
    var minHeightToStretch: CGFloat = 0
    
    private var autoResize: Bool = true
    
    func configure(minHeight: CGFloat, maxHeight: CGFloat, scrollView: UIScrollView, autoResize: Bool? = true, minHeightToStretch: CGFloat? = nil) {
        headerMaxHeight = maxHeight
        headerMinHeight = minHeight
        self.minHeightToStretch = minHeightToStretch ?? headerMaxHeight * 0.7
        self.autoResize = autoResize ?? true
        clipsToBounds = true
        scrollViewDidScroll(scrollView)
    }
    
    func updateViews(scale: CGFloat) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = headerMaxHeight - (scrollView.contentOffset.y + headerMaxHeight)
        let currentHeight = max(y, headerMinHeight)
        
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: currentHeight)
        
        let heightMaxDelta: CGFloat = headerMaxHeight - headerMinHeight
        let currentHeightDelta: CGFloat = currentHeight - headerMinHeight
        updateViews(scale: currentHeightDelta / heightMaxDelta)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        guard autoResize else { return }
        let offsetY = scrollView.contentOffset.y
        
        if frame.height <= headerMinHeight || offsetY <= -headerMaxHeight {
            return
        }
        
        if offsetY <= -minHeightToStretch {
            UIView.animate(withDuration: 0.6) {
                self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.headerMaxHeight)
                scrollView.setContentOffset(CGPoint(x: 0, y: -self.headerMaxHeight), animated: false)
                self.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.6) {
                self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.headerMinHeight)
                scrollView.setContentOffset(CGPoint(x: 0, y: -self.headerMinHeight), animated: false)
                self.layoutIfNeeded()
            }
        }
    }
}
