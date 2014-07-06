//
//  MyView.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/15/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import QuartzCore

class MyView: UIView {

    var backColor:UIColor = UIColor.whiteColor()
    
    let MPI:CGFloat = 22/7
    
    var path:UIBezierPath!
    var circlePath:UIBezierPath!
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        //initialize()
    }

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        //initialize()
    }

    func initialize(#rect: CGRect, color: UIColor) {
        path = UIBezierPath(rect: bounds)
        color.setFill()
        circlePath = UIBezierPath()
        let centerX = CGRectGetWidth(bounds) / 2.0
        let centerY = CGRectGetHeight(bounds) / 2.0
        let endAngle:CGFloat = 2.0*MPI
        circlePath.addArcWithCenter(CGPointMake(centerX, centerY), radius: centerX, startAngle: 0.0, endAngle: endAngle, clockwise: Bool.true)
        path.appendPath(circlePath)
        path.usesEvenOddFillRule = Bool.true
        path.fill()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        initialize(rect: rect, color: backColor)
    }
    

}
