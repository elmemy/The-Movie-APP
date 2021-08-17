//
//  ShadowView.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import UIKit

class ShadowView: UIView {
    
    var setupShadowDone: Bool = false
    
    public func setupShadow() {
        if setupShadowDone { return }
        print("Setup shadow!")
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
                                                                                                    8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        setupShadowDone = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Layout subviews!")
        setupShadow()
    }
}



extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
  
        
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOffset = CGSize(width: 4, height: 3)
        containerView.layer.shadowRadius = cornerRadious
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
                                                                                                    8)).cgPath
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    
}
