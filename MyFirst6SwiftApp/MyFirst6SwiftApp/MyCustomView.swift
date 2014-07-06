//
//  MyCustomView.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/11/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class MyCustomView: UIView {

    var myLabel: UILabel!

    var myView: MyView!

    @IBInspectable var myLabelString:NSString? {
        didSet {
            updateMyLabelsText();
        }
    }
    
    @IBInspectable var fontSize:CGFloat = 20.0 {
        didSet {
            updateMyLabelsFontSize()
        }
    }

    @IBInspectable var backColor:UIColor? {
        didSet {
            updateMyBackgroundColor()
        }
    }
    
    var myImageLayer:CALayer!
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        // Initialization code

        myLabel = UILabel(frame: CGRectMake(0, 0, 240, 240))
        addSubview(myLabel)
        myLabel.center = center
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.textColor = UIColor.lightGrayColor()
        myLabel.backgroundColor = UIColor(red: 255.0/255.0, green: 215.0/255.0, blue:0.0/255.0, alpha: 1.0)
        
        myView = MyView(frame: CGRectMake(0, 0, 240, 240))
        addSubview(myView)
        myView.center = center
        myView.backgroundColor = UIColor.clearColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fontSize = 30
        myLabelString = "WWDC 2014"
        myLabel.center = CGPointMake(center.x, CGRectGetHeight(bounds)/2.0)
        myView.center = myLabel.center
        myView.backColor = backgroundColor
        myView.setNeedsLayout()
    }
    
    func updateMyLabelsText() {
        if myLabel {
            myLabel.text = myLabelString
        }
    }
    
    func updateMyLabelsFontSize() {
        if myLabel {
            let fontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline)
            myLabel.font = UIFont(descriptor: fontDescriptor, size: fontSize)
        }
    }
    
    func updateMyBackgroundColor() {
        backgroundColor = backColor
    }
    
}
