//
//  GetCardView.swift
//  SampleAPI
//
//  Created by MacBook on 23/11/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import Foundation
import UIKit



@IBDesignable class GetCardView: UIView {
    
    
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    
    @IBInspectable var shadowOffSetWidth : Int = 0
    @IBInspectable var shadowOffSetHight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.3
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity

   }
}
