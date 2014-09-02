//
//  MyImageCell.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/31/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyImageCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
}
