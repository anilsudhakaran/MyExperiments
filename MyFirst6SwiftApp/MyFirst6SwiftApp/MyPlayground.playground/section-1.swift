// Playground - noun: a place where people can play

import UIKit
import QuartzCore

var myView = UIView(frame: CGRectMake(100, 100, 150, 150))
myView.backgroundColor = UIColor.orangeColor()

//Add image mask layer
let myMaskLayer = CAShapeLayer()
let insetBounds = CGRectInset(myView.bounds, 1, 1)
let innerPath = UIBezierPath(ovalInRect: insetBounds);
myMaskLayer.path = innerPath.CGPath
myMaskLayer.fillColor = UIColor.yellowColor().CGColor
myMaskLayer.frame = myView.bounds
myView.layer.addSublayer(myMaskLayer)

//Add image layer
let myImageLayer = CALayer()
myImageLayer.mask = myMaskLayer
myImageLayer.frame = myView.bounds
myImageLayer.backgroundColor = UIColor.groupTableViewBackgroundColor().CGColor
myImageLayer.contentsGravity = kCAGravityResizeAspect
myView.layer.addSublayer(myImageLayer)


//Add label
let myLabel = UILabel(frame: myView.bounds)
myLabel.text = "Hello!! What the hell is happening here"
myLabel.textColor = UIColor.lightGrayColor()
myLabel.shadowColor = UIColor.darkGrayColor()
myLabel.shadowOffset = CGSizeMake(1, 1)
myLabel.textAlignment = NSTextAlignment.Center
myLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
myLabel.numberOfLines = 0
myImageLayer.addSublayer(myLabel.layer)

myView.backgroundColor = UIColor.greenColor()

myLabel.text = "WWDC 2014"

myView.backgroundColor = UIColor.greenColor()

//Add image view
let myImage = UIImage(named: "/Users/anilsudhakaran/Pictures/vase")
let myImageView = UIImageView(image:nil)
myImageView.contentMode = UIViewContentMode.ScaleAspectFit
myImageView.frame = myView.bounds
myImageLayer.addSublayer(myImageView.layer)

myView.backgroundColor = UIColor.greenColor()

myImageView.image = myImage

myView.backgroundColor = UIColor.purpleColor();