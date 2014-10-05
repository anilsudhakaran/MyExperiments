//
//  MyVC.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 7/3/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

public class MyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public var data:NSArray?

    @IBOutlet public var tableView: UITableView!
        
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var headerLabel: UILabel!
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //Custom Initializiation
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.registerNib(UINib(nibName: "MyCell", bundle: NSBundle(identifier: "com.anils.MyCustomFramework"))!, forCellReuseIdentifier: "myCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        
        var vibrEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light)))
        vibrEffectView.frame = headerView.bounds
        headerView.addSubview(vibrEffectView);
        vibrEffectView.contentView.addSubview(headerLabel)
        
        headerLabel.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline), size: 40.0)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        //tableView.frame = view.bounds
//        //tableView.contentInset = UIEdgeInsetsZero
//        //tableView.scrollIndicatorInsets = UIEdgeInsetsZero
//
//    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (navigationController != nil) {
            navigationController?.setToolbarHidden(true, animated: true)
            navigationController?.hidesBarsOnTap = true
        }
    }
    
    //#pragma mark - Table view data source
    
    public func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return data!.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : MyCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as MyCell
        
        if data!.count > indexPath.row {
            var row = indexPath.row
            cell.myTextLabel.text = data![row] as NSString
        }
        
        // Configure the cell...
        return cell
    }
    
    public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject] {
        var testAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Accept", handler:
            {(testAction, indexPath) -> Void in
                println("Action \(testAction.title) Index Path \(indexPath)")
                tableView.setEditing(false, animated: true);
            }
        )
        testAction.backgroundColor = UIColor(red: 131.0/255.0, green: 147.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        //testAction.backgroundEffect = UIBlurEffect(style: .ExtraLight) //UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        
        var testAction1 = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Reject", handler:
            {(testAction1, indexPath) -> Void in
                println("Action \(testAction1.title) Index Path \(indexPath)")
                tableView.setEditing(false, animated: true);
            }
        )
        testAction1.backgroundColor = UIColor(red: 246.0/255.0, green: 150.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        //testAction1.backgroundEffect = UIBlurEffect(style: .Dark) //UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))
        
        var testAction2 = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Pass", handler:
            {(testAction2, indexPath) -> Void in
                println("Action \(testAction2.title) Index Path \(indexPath)")
                tableView.setEditing(false, animated: true);
            }
        )
        testAction2.backgroundColor = UIColor(red: 244.0/255.0, green: 154.0/255.0, blue: 193.0/255.0, alpha: 1.0)
        //testAction2.backgroundEffect = UIBlurEffect(style: .Light) //UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        
        return [testAction1, testAction, testAction2]
    }
    
    public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        println("Editing Style \(editingStyle)")
    }

    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView! {
        var sectionHeaderView:UIView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(view.bounds), 25))
        sectionHeaderView.backgroundColor = UIColor.brownColor()
        
        let sectionLabel:UILabel = UILabel(frame: sectionHeaderView.bounds)
        sectionLabel.text = "Section Header Label"
        sectionLabel.shadowOffset = CGSizeZero
        sectionLabel.textAlignment = NSTextAlignment.Center
        
        var vibrEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light)))
        vibrEffectView.frame = sectionHeaderView.bounds
        sectionHeaderView.addSubview(vibrEffectView);
        vibrEffectView.contentView.addSubview(sectionLabel)

        sectionLabel.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleSubheadline), size: 20.0)

        return sectionHeaderView
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView {
        var sectionFooterView:UIView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(view.bounds), 25))
        sectionFooterView.backgroundColor = UIColor.orangeColor()
        
        let sectionLabel:UILabel = UILabel(frame: sectionFooterView.bounds)
        sectionLabel.text = "Section Footer Label"
        sectionLabel.shadowOffset = CGSizeZero
        sectionLabel.textAlignment = NSTextAlignment.Center
        
        var vibrEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light)))
        vibrEffectView.frame = sectionFooterView.bounds
        sectionFooterView.addSubview(vibrEffectView);
        vibrEffectView.contentView.addSubview(sectionLabel)
        
        sectionLabel.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleSubheadline), size: 20.0)
        
        return sectionFooterView
    }
    
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }

}
