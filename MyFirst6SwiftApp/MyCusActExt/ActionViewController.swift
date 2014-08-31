//
//  ActionViewController.swift
//  MyCusActExt
//
//  Created by Anil Sudhakaran on 8/30/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Get the item[s] we're handling from the extension context.
        
        // For example, look for an image and place it into an image view.
        // Replace this with something appropriate for the type[s] your extension supports.
        var imageFound = false
        for item: AnyObject in self.extensionContext.inputItems {
            let inputItem = item as NSExtensionItem
            for provider: AnyObject in inputItem.attachments! {
                let itemProvider = provider as NSItemProvider
                if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeImage as NSString) {
                    // This is an image. We'll load it, then place it in our image view.
                    weak var weakImageView = self.imageView
                    itemProvider.loadItemForTypeIdentifier(kUTTypeImage as NSString, options: nil, completionHandler: { (image, error) in
                        if image != nil {
                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                if let imageView = weakImageView {
                                    println("Image: \(image)")

                                    if image is NSData {
                                        println("NSData: \(itemProvider)")
                                        imageView.image = UIImage(data: image as NSData)
                                    }
                                    else if image is UIImage {
                                        println("UIImage: \(itemProvider)")
                                        imageView.image = image as UIImage
                                    }
                                    else if image is NSURL {
                                        imageView.image = UIImage(data: NSData(contentsOfURL: image as NSURL))
                                        println("NSURL: \(itemProvider)")
                                    }
                                    else if image is NSString {
                                        println("NSString: \(itemProvider)")
                                    }
                                    //imageView.image = image as UIImage
                                }
                            }
                        }
                    })
                    
                    imageFound = true
                    break
                }
            }
            
            if (imageFound) {
                // We only handle one image, so stop looking for more.
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext.completeRequestReturningItems(self.extensionContext.inputItems, completionHandler: nil)
    }

}
