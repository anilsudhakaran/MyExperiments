//
//  MyShareVC.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/31/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class MyShareVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    private var imageList = [UIImage]()
    
    var refreshCell: ((imageList:[UIImage]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancel:")
        cancelButton.tintColor = UIColor.orangeColor()
        self.navigationItem.leftBarButtonItem = cancelButton
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = UITableViewAutomaticDimension

        myTableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        myTableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag
        
        let myQueue = dispatch_queue_create("My Queue", nil)
        
        dispatch_async(myQueue, { () -> Void in

            for item: AnyObject in self.extensionContext!.inputItems {
                let inputItem = item as NSExtensionItem
                for provider: AnyObject in inputItem.attachments! {
                    let itemProvider = provider as NSItemProvider
                    if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeImage as NSString) {
                        // This is an image. We'll load it, then place it in our image view.
                        //weak var weakImageView = self.imageView
                        itemProvider.loadItemForTypeIdentifier(kUTTypeImage as NSString, options: nil, completionHandler: { (imageInfo, error) in
                            if imageInfo != nil {
                                //NSOperationQueue.mainQueue().addOperationWithBlock {
                                    //if let imageView = weakImageView {
                                if imageInfo is NSData {
                                    println("NSData: \(imageInfo)")
                                    self.imageList.append(UIImage(data: imageInfo as NSData)!)
                                }
                                else if imageInfo is UIImage {
                                    println("UIImage: \(imageInfo)")
                                    self.imageList.append(imageInfo as UIImage)
                                }
                                else if imageInfo is NSURL {
                                    println("NSURL: \(imageInfo)")
                                    self.imageList.append(UIImage(data: NSData(contentsOfURL: imageInfo as NSURL!)!)!)
                                    println("\(self.imageList)")
                                }
                                else if imageInfo is NSString {
                                    println("NSString: \(itemProvider)")
                                }
                                
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    self.refreshCell!(imageList: self.imageList)
                                })

                                    //}
                                //}
                            }
                        })
                    }
                }
            }
        })
            //if (imageFound) {
                // We only handle one image, so stop looking for more.
                //break
            //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        //if coordinator {
            coordinator.animateAlongsideTransition({ (context) -> Void in
                var viewFrame = self.view.frame
                viewFrame = CGRectInset(viewFrame, 30, 30)
                self.view.frame = viewFrame
            }, completion: { (context) -> Void in
                
            })
        //}
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myTableView.separatorInset = UIEdgeInsetsZero
        myTableView.layoutMargins = UIEdgeInsetsZero
    }
    
    //MARK: - Bar Button Action Methods
    func cancel(sender:UIBarButtonItem) -> Void {
        var cancelError: NSError = NSError()
        extensionContext!.cancelRequestWithError(cancelError)
    }

    @IBAction func save(sender: UIBarButtonItem) {
        extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }
    
    //MARK: - TableView Delegate & Resource Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        switch (indexPath.row) {
        case 0:
            var myCell = tableView.dequeueReusableCellWithIdentifier("imageCollectionCell") as MyImageCollectionCell
            refreshCell = myCell.refreshCell
            if imageList.count == 0 {
                myCell.noImageAvailable.hidden = false
            }
            myCell.imageList = imageList
            cell = myCell
        case 1:
            var myCell = tableView.dequeueReusableCellWithIdentifier("contentTextCell") as MyContentTextCell
            cell = myCell
        case 2:
            var myCell = tableView.dequeueReusableCellWithIdentifier("recipientListCell") as MyRecipientListCell
            cell = myCell
        default:
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "myCell")
        }
        
        cell?.layoutMargins = UIEdgeInsetsZero
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.row) {
        case 0:
            return 99
        case 1:
            return 64
        case 2:
            return UITableViewAutomaticDimension
        default:
            return UITableViewAutomaticDimension
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
