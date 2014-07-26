//
//  MyCell.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/16/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

public class MyCell: UITableViewCell {

    @IBOutlet var myTextLabel : UILabel!
    @IBOutlet var myView: MyView!
    @IBOutlet var myInitials: UILabel!
    
    var vibrantView: UIVisualEffectView?
    var visualEffectView: UIVisualEffectView?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        myTextLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        myTextLabel.numberOfLines = 0;
        
        myInitials.text = "AA"
        
        myView.backgroundColor = UIColor.clearColor()
        
        //myView.setNeedsLayout()
        
        //var blur = UIBlurEffect(style: .Light)
        //vibrantView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blur))
        //visualEffectView = UIVisualEffectView(effect: blur)
        
        //visualEffectView!.frame = self.bounds
        //vibrantView!.frame = self.bounds
        
        //vibrantView!.contentView.addSubview(myTextLabel)
        //visualEffectView!.contentView.addSubview(myTextLabel)
        //self.contentView.addSubview(visualEffectView)
        
        
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
