//
//  MyActivityItem.swift
//  MyImageViewer
//
//  Created by Anil Sudhakaran on 8/31/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import MobileCoreServices

class MyActivityItem: NSObject,UIActivityItemSource {
   
    var myItem:UIImage?
    
    override init() {
        super.init()
    }
        
    func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        println("ActivityType: \(activityType)")
        return myItem!
    }
    
    func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return UIImage()
    }
    
    func activityViewController(activityViewController: UIActivityViewController, dataTypeIdentifierForActivityType activityType: String) -> String {
        return kUTTypeImage as NSString
    }
}
