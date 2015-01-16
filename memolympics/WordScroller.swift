//
//  WordScroller.swift
//  memolympics
//
//  Created by Gabriel Ruiz on 1/1/15.
//  Copyright (c) 2015 Destroy Me Productions. All rights reserved.
//

import Foundation
import UIKit

func generateText(#text: String, #x: CGFloat, #y: CGFloat) -> UILabel {

    // get size of screen
    let screenRect : CGRect = UIScreen.mainScreen().bounds
    let screenWidth : CGFloat = screenRect.width
    
    ///////////////////
    //text attributes//
    ///////////////////
    let labelContainerRect = CGRect(x: x, y: y, width: 200.0, height: 200.0)
    let labelAlignment = NSTextAlignment.Center
    let labelFont : UIFont = UIFont(name:"HelveticaNeue-Light", size:22)!

    
    // generation
    let newLabel = UILabel()
    
    newLabel.frame = labelContainerRect
    newLabel.textAlignment = labelAlignment
    newLabel.text = text
    newLabel.font = labelFont
    
    return newLabel
}


func generateCountdownText() {
    // potential start of a new countdown
    var fadeAnimation = CABasicAnimation(keyPath: "alpha")
    fadeAnimation.fromValue = 0.0
    fadeAnimation.toValue = 1.0
    fadeAnimation.duration = 1.0
    
}