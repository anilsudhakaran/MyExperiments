//
//  MyImageCollectionCell.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/31/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyImageCollectionCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var noImageAvailable:    UILabel!
    
    var imageList:[UIImage]?
    
    var refreshCell:((imageList:[UIImage]?) -> Void)? {
        get {
            return {(imageList:[UIImage]?) -> Void in
                self.imageList = imageList
                self.imageCollectionView.reloadData()
                if self.imageList?.count > 0 {
                    self.noImageAvailable.hidden = true
                }
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //refreshCell = {()->Void in self.imageCollectionView.reloadData()}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        imageCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.0*Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.imageCollectionView.reloadData()
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Collection View Methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return imageList!.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as MyImageCell
        if imageList?.count > indexPath.row {
            cell.myImageView.image = imageList![indexPath.row] as UIImage
        }
        return cell
    }
}
