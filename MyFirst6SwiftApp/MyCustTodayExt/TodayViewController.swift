//
//  TodayViewController.swift
//  MyCustTodayExt
//
//  Created by Anil Sudhakaran on 9/6/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UIContentContainer {
        
    @IBOutlet var currentLabel: UILabel! = UILabel()
    @IBOutlet var vibrancyView: UIVisualEffectView! = UIVisualEffectView(effect: UIVibrancyEffect.notificationCenterVibrancyEffect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        self.preferredContentSize = CGSize(width: CGRectGetWidth(view.bounds), height: 44)
        
        currentLabel.textColor = UIColor.lightTextColor()
        currentLabel.textAlignment = NSTextAlignment.Center
        currentLabel.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline), size: 13)
        currentLabel.text = ""
        
        vibrancyView.contentView.addSubview(currentLabel)
        view.addSubview(vibrancyView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vibrancyView.frame = view.bounds
        currentLabel.frame = vibrancyView.bounds
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a zzz"
        
        currentLabel.text = dateFormatter.stringFromDate(NSDate())

        // If an error is encoutered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    
}
