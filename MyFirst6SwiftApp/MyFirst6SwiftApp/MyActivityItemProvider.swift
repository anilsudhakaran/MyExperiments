//
//  MyActivityItemProvider.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/25/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyActivityItemProvider: UIActivityItemProvider, UIActivityItemSource {
   
    override func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return NSString()
    }
    
    override func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        if (activityType == UIActivityTypeMail) {
            return "Hello Mail App"
        }
        else if (activityType == UIActivityTypeMessage) {
            return "Hello Message App"
        }
        else if (activityType == UIActivityTypePostToTwitter) {
            return "Hello Twitter"
        }
        else if (activityType == UIActivityTypePostToFacebook) {
            return "Hello Facebook"
        }
        else if (activityType == UIActivityTypePostToFlickr) {
            return "Hello Flickr"
        }
        else if (activityType == UIActivityTypeAirDrop) {
            return "Hello Airdrop"
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
        else if (activityType == UIActivityTypePostToTwitter) {
            return "Twitter!!"
        }
        else if (activityType == UIActivityTypePostToFacebook) {
            return "Facebook!!"
        }
        else if (activityType == UIActivityTypePostToFlickr) {
            return "Flickr!!"
        }
        else if (activityType == UIActivityTypeAirDrop) {
            return "Airdrop!!"
        }
        return "No subject"
    }
    
}
