//
//  MyContentTextCell.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 8/31/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

class MyContentTextCell: UITableViewCell {

    @IBOutlet weak var myContentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myContentTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        myContentTextView.textContainer
        myContentTextView.textContainerInset = UIEdgeInsetsMake(1, 1, 1, 5)
        myContentTextView.becomeFirstResponder()
        myContentTextView.textContainer.maximumNumberOfLines = 3;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
