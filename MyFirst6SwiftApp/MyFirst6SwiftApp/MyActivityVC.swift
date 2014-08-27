//
//  MyActivityVC.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/26/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyActivityVC: UIViewController {

    var myString:String?
    var myURL: NSURL?
    
    var completionBlock: (() -> Void)?
    
    required override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        println("Hello")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var alertView:UIAlertController = UIAlertController(title: "My Activity", message: myString! + "\n" + myURL!.absoluteString!, preferredStyle: UIAlertControllerStyle.Alert)
        var alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.completionBlock!()
        }
        alertView.addAction(alertAction)
        
        self.presentViewController(alertView, animated: true, completion: nil)

    }
}
