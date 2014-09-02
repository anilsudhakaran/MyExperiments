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

    //MARK:Collection View Delegate/DataSource methods

    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return data.count;
    }

    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cell:MyImageCell = collectionView.dequeueReusableCellWithReuseIdentifier("myImageCell", forIndexPath: indexPath) as MyImageCell
        
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
        var selectedIndexPaths = collectionView.indexPathsForSelectedItems()
        for selectedIndexPath in selectedIndexPaths {
            if (selectedIndexPath.section == indexPath.section && selectedIndexPath.row == indexPath.row) {
                cell.selected = true
            }
            else {
                cell.selected = false
            }
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        
    }
    
    //MARK: Show Activities
    @IBAction func showAvailableActivities(sender: UIBarButtonItem) {
        
        var imageURLArray = [NSURL]()
        
        //var cell:MyImageCell?
        for indexPath in myCollectionView.indexPathsForSelectedItems() {
            if indexPath is NSIndexPath {
                var fileName = data[indexPath.row]["name"]
                
                var imagePath = NSBundle.mainBundle().pathForResource(fileName?.stringByDeletingPathExtension, ofType: fileName?.pathExtension)
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

