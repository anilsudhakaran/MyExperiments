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

    @IBOutlet var myLabel:UILabel

    @IBOutlet var myView:MyView!

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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fontSize = 30
        myLabelString = "WWDC 2014"
        
        myView.backgroundColor = UIColor.clearColor()
        myView.backColor = backgroundColor
        myView.setNeedsDisplay()

//        if myView {
//            myView.frame = CGRectMake((CGRectGetWidth(bounds)-240)/2, (CGRectGetHeight(bounds)-240)/2, 240, 240)
//        }
//        else {
//            myView = MyView(frame: CGRectMake((CGRectGetWidth(bounds)-240)/2, (CGRectGetHeight(bounds)-240)/2, 240, 240))
//            myView.backgroundColor = UIColor.clearColor()
//            myView.backColor = backgroundColor
//            self.addSubview(myView)
//        }
//        myView.setNeedsDisplay()

    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect)
//    {
//    }
    
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
        backgroundColor = backColor;
    }
    
}
