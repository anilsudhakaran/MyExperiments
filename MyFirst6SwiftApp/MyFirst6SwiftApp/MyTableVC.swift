//
//  MyTableVC.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/15/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit

public class MyTableVC: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var data:NSArray?
    
    override init?(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //Custom Initializiation
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        println("Frame: \(tableView.frame)")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light))
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.registerNib(UINib(nibName: "MyCell", bundle:  NSBundle(identifier: "com.anils.MyCustomFramework"))!, forCellReuseIdentifier: "myCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Content Inset: \(tableView.contentInset.top)")
    }
    // #pragma mark - Table view data source

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return data!.count
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : MyCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as MyCell
        
        if data!.count > indexPath.row {
            var row = indexPath.row
            cell.myTextLabel.text = data![row] as NSString
        }
        
        // Configure the cell...
        return cell
    }
    
    override public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject] {
        var testAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Accept", handler:
            {(testAction, indexPath) -> Void in
                println("Action \(testAction.title) Index Path \(indexPath)")
            }
        )
        testAction.backgroundColor = UIColor.greenColor()
        //testAction.backgroundEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Dark))

        var testAction1 = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Reject", handler:
            {(testAction1, indexPath) -> Void in
                println("Action \(testAction1.title) Index Path \(indexPath)")
            }
        )
        testAction1.backgroundColor = UIColor.redColor()
        //testAction1.backgroundEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))
        
        var testAction2 = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Pass", handler:
            {(testAction2, indexPath) -> Void in
                println("Action \(testAction2.title) Index Path \(indexPath)")
            }
        )
        testAction2.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //testAction2.backgroundEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: UIBlurEffectStyle.Light))

        return [testAction1, testAction, testAction2]
    }
    
    override public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    override public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        println("Editing Style \(editingStyle)")
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
