//
//  MyView.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/15/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import QuartzCore

public class MyView: UIView {

    var backColor:UIColor = UIColor.whiteColor()
    
    let MPI:CGFloat = 22/7
    
    var path:UIBezierPath!
    var circlePath:UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        //initialize()
    }

    required public init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        //initialize()
    }

    public func initialize(#rect: CGRect, color: UIColor) {
        path = UIBezierPath(rect: bounds)
        color.setFill()
        circlePath = UIBezierPath()
        let centerX = CGRectGetWidth(bounds) / 2.0
        let centerY = CGRectGetHeight(bounds) / 2.0
        let endAngle:CGFloat = 2.0*MPI
        circlePath.addArcWithCenter(CGPointMake(centerX, centerY), radius: centerX, startAngle: 0.0, endAngle: endAngle, clockwise: true)
        UIColor.groupTableViewBackgroundColor().setStroke()
        circlePath.lineWidth = 20.0;
        circlePath.stroke()
        path.appendPath(circlePath)
        path.usesEvenOddFillRule = true
        path.fill()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func drawRect(rect: CGRect)
    {
        // Drawing code
        initialize(rect: rect, color: backColor)
    }
    
}
