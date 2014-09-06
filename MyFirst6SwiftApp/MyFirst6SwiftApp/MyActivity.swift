//
//  MyActivity.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/26/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit


func activityCategory() -> UIActivityCategory {
    return UIActivityCategory.Action
}

class MyActivity:UIActivity {
    
    var myString:String?
    var myURL:NSURL?
    
    override func activityType() -> String? {
        return "com.anils.myFirstSwiftApp"
    }
    
    override func activityTitle() -> String? {
        return NSLocalizedString("MyApp", tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for obj in activityItems {
            if obj is String {
                myString = obj as? String
            }
            else if obj is NSURL {
                myURL = obj as? NSURL
            }
        }
    }
    
    override func performActivity() {
        var alertView:UIAlertController = UIAlertController(title: "My Activity", message: "Testing My Activity", preferredStyle: UIAlertControllerStyle.Alert)
        var alertAction:UIAlertAction = UIAlertAction(title: myString!+myURL!.absoluteString!, style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.activityDidFinish(true)
        }
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return true
    }
    
    override func activityViewController() -> UIViewController? {
        var myActivityVC:MyActivityVC = MyActivityVC()
        myActivityVC.view.backgroundColor = UIColor.orangeColor()
        myActivityVC.myString = myString
        myActivityVC.myURL = myURL
        myActivityVC.completionBlock = {() -> Void in self.activityDidFinish(true)}
        return myActivityVC
    }
}




