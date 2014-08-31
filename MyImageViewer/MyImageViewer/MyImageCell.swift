//
//  MyImageCell.swift
//  MyImageViewer
//
//  Created by Anil Sudhakaran on 8/29/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyImageCell: UICollectionViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    var imagePath:NSString?
    var imagePathURL:NSURL?
}
