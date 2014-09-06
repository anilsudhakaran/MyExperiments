//
//  MyActivityItemProvider.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/25/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyActivityItemProvider: UIActivityItemProvider, UIActivityItemSource {
   
    override func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        if (activityType == UIActivityTypeMail) {
            return "Hello Mail App"
        }
        else if (activityType == UIActivityTypeMessage) {
            return "Hello Message App"
        }
        return nil
    }
    
    override func activityViewController(activityViewController: UIActivityViewController, subjectForActivityType activityType: String?) -> String {
        if (activityType == UIActivityTypeMail) {
            return "Mail!!"
        }
        else if (activityType == UIActivityTypeMessage) {
            return "Message!!"
        }
        return "Activity not supported"
    }
    
}
