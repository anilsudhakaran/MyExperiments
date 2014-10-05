//
//  ShareViewController.swift
//  MyShareExtension
//
//  Created by Anil Sudhakaran on 8/28/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

var maxAllowedCharacters:Int = 100

class ShareViewController: SLComposeServiceViewController {
    
    var imageCount:Int = 0
    var imageDataList = [NSData]();
    var imageURLList = [NSURL]();
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        var currentCharCount = countElements(contentText) as Int
        charactersRemaining = maxAllowedCharacters-currentCharCount
        return (charactersRemaining.intValue >= 0 && imageDataList.count >= 0 && imageDataList.count <= 5)
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext?.completeRequestReturningItems(extensionContext?.inputItems, completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return NSArray()
    }
    
    override func presentationAnimationDidFinish() {
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        textView.textColor = UIColor.darkGrayColor()
        placeholder = "Enter Text here"
        charactersRemaining = maxAllowedCharacters
        var extensionItem:NSExtensionItem = extensionContext?.inputItems.first as NSExtensionItem
        
        for itemProvider in extensionItem.attachments! {
            if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeURL as NSString) {
                imageCount++
                itemProvider.loadItemForTypeIdentifier(kUTTypeImage as NSString, options: nil, completionHandler: { (imageURL, error) -> Void in
                    println("\(imageURL)")
                    if imageURL != nil {
                        var imageData = NSData(contentsOfURL: imageURL as NSURL)
                        if imageData != nil {
                            self.imageDataList.append(imageData!)
                        }
                    }
                })
            }
        }
        
        self.validateContent()
    }
}
