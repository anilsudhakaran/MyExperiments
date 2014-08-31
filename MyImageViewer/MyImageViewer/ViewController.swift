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
        data = [["name":"DSC_0121.png"],["name":"DSC_0260.png"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:Collection View Delegate/DataSource methods

    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return data.count;
    }

    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cellId = indexPath.row == 0 ? "myImageCell1" : "myImageCell2"
        var cell:MyImageCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as MyImageCell
        
        if data.count > indexPath.row {
            
            var fileName = data[indexPath.row]["name"]
            
            cell.imageNameLabel.text = fileName?.lastPathComponent.stringByDeletingPathExtension
            
            cell.imagePath = NSBundle.mainBundle().pathForResource(cell.imageNameLabel.text, ofType: fileName?.pathExtension)
            
            if cell.imagePath != nil {
                cell.imagePathURL = NSURL(fileURLWithPath: cell.imagePath!)
            }
            
            cell.myImageView.image = UIImage(named: cell.imageNameLabel.text)
        }
        
        //Selected Background view
        cell.selectedBackgroundView = UIView(frame: cell.bounds)
        cell.selectedBackgroundView.backgroundColor = UIColor.clearColor()
        cell.selectedBackgroundView.layer.borderColor = UIColor.orangeColor().CGColor

        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        var cell:MyImageCell = collectionView.cellForItemAtIndexPath(indexPath) as MyImageCell
        cell.selectedBackgroundView.layer.borderWidth = 2.0;
    }
    
    func collectionView(collectionView: UICollectionView!, didDeselectItemAtIndexPath indexPath: NSIndexPath!) {
        var cell:MyImageCell = collectionView.cellForItemAtIndexPath(indexPath) as MyImageCell
        cell.selectedBackgroundView.layer.borderWidth = 0.0;
    }
    
    //MARK: Show Activities
    @IBAction func showAvailableActivities(sender: UIBarButtonItem) {
        
        var imageDataArray = [NSURL]()
        
        for indexPath in myCollectionView.indexPathsForSelectedItems() {
            if indexPath is NSIndexPath {
                var cell = myCollectionView.cellForItemAtIndexPath(indexPath as NSIndexPath) as MyImageCell
                var imageURL = cell.imagePathURL //UIImagePNGRepresentation(cell.myImageView.image)
                if  (imageURL != nil) {
                    imageDataArray.append(imageURL!)
                }
            }
        }
        
        var activity:UIActivityViewController = UIActivityViewController(activityItems: imageDataArray, applicationActivities: nil);
        self.presentViewController(activity, animated: true, completion: nil)
    }

}

