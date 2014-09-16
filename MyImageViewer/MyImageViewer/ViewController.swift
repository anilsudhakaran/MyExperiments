//
//  ViewController.swift
//  MyImageViewer
//
//  Created by Anil Sudhakaran on 8/29/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
                            
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var data = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.allowsMultipleSelection = true
        data = [["name":"DSC_0121.png"],["name":"DSC_0260.png"],["name":"skittles.png"],["name":"santa barbara mission.png"],["name":"solvang windmill.png"],["name":"california poppy.png"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //MARK:Collection View Delegate/DataSource methods

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count;
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:MyImageCell = collectionView.dequeueReusableCellWithReuseIdentifier("myImageCell", forIndexPath: indexPath) as MyImageCell
        
        if (!(collectionView.dragging && collectionView.decelerating)) {
            showImages(forIndexPath: indexPath, forCell: cell)
        }
        
        //Selected Background view
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        draggingDecelerationEnded()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        draggingDecelerationEnded()
    }
    
    //MARK: - Utilities
    func getBundlePath(usingFileDict fileDict:Dictionary<String,String>) -> String? {
        var fileName = fileDict["name"]
        return NSBundle.mainBundle().pathForResource(fileName?.lastPathComponent.stringByDeletingPathExtension, ofType: fileName?.pathExtension)!
    }
    
    func draggingDecelerationEnded() -> Void {
        var indexPaths = myCollectionView.indexPathsForVisibleItems()
        for indexPath in indexPaths {
            var cell = myCollectionView.cellForItemAtIndexPath(indexPath as NSIndexPath) as MyImageCell
            showImages(forIndexPath: indexPath as NSIndexPath, forCell: cell)
        }
    }
    
    func showImages(forIndexPath indexPath:NSIndexPath, forCell cell:MyImageCell) -> Void {
        
        var selectedIndexPaths = self.myCollectionView.indexPathsForSelectedItems()

        cell.selected = false

        if data.count > indexPath.row {
            

            cell.myImageView.backgroundColor = UIColor.groupTableViewBackgroundColor()

            var myQueue = dispatch_queue_create("My Queue", nil)
            
            dispatch_async(myQueue, { () -> Void in
                
                cell.imagePath = self.getBundlePath(usingFileDict: self.data[indexPath.row])
                
                if (cell.imagePath != nil) {
                    cell.imagePathURL = NSURL(fileURLWithPath: cell.imagePath!)
                    var imgName = cell.imagePath?.lastPathComponent.stringByDeletingPathExtension
                    if (imgName != nil) {
                        var img = UIImage(named: imgName!)
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            cell.imageNameLabel.text = imgName
                            cell.myImageView.image = img
                            cell.myImageView.backgroundColor = UIColor.clearColor()
                            
                            for selectedIndexPath in selectedIndexPaths {
                                if (selectedIndexPath.section == indexPath.section && selectedIndexPath.row == indexPath.row) {
                                    cell.selected = true
                                }
                            }

                        })
                    }
                }
                
            })
        }
    }
    
    //MARK: - Show Activities
    @IBAction func showAvailableActivities(sender: UIBarButtonItem) {
        
        var imageURLArray = [NSURL]()
        
        //var cell:MyImageCell?
        for indexPath in myCollectionView.indexPathsForSelectedItems() {
            if indexPath is NSIndexPath {
                var imagePath = getBundlePath(usingFileDict: data[indexPath.row])
                if (imagePath != nil) {
                    imageURLArray.append(NSURL(fileURLWithPath: imagePath!))
                }
            }
        }
        
//        var img = cell?.myImageView.image
//        
//        var myActivityItems = [MyActivityItem]()
//
//        var item = MyActivityItem()
//        item.myItem = img
//        myActivityItems.append(item)
        
        var activity:UIActivityViewController = UIActivityViewController(activityItems: imageURLArray, applicationActivities: nil);
        self.presentViewController(activity, animated: true, completion: nil)
        
    }

}

