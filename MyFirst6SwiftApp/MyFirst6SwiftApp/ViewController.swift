//
//  ViewController.swift
//  MyFirst6SwiftApp
//
//  Created by Anil Sudhakaran on 6/11/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

import UIKit
import MyCustomFramework

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate {
                            
    @IBOutlet var myCustomView : MyCustomView
    
    @IBOutlet var popoverButton : UIBarButtonItem
    
    var topLayoutGuideLength:CGFloat = 0.0
    
    var popoverView:MyVC?
    
    var actionSheet:UIBarButtonItem!
    var alertView:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        popoverButton.tintColor = UIColor.yellowColor()
        
        actionSheet = UIBarButtonItem(title: "Action Sheet", style: .Bordered, target: self, action:"loadActionSheet:")
        alertView = UIBarButtonItem(title: "Alert View", style: .Bordered, target: self, action:"loadAlertView:")

        actionSheet.tintColor = UIColor.magentaColor()
        
        navigationItem.rightBarButtonItems = [popoverButton, actionSheet, alertView]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLayoutGuideLength = topLayoutGuide.length
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
        super.traitCollectionDidChange(previousTraitCollection)
        myCustomView.setNeedsDisplay()
    }
    
    //Bar Button Items actions
    @IBAction func showPopover(sender : AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        popoverView = storyboard.instantiateViewControllerWithIdentifier("myVC") as? MyVC
        popoverView!.data = ["1 This will test tableviewcell autoresize. This will test tableviewcell autoresize.",
            "2 This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize.",
            "3 This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize.",
            "4 This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize.",
            "5 This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize.",
            "6 This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize. This will test tableviewcell autoresize."
        ]
        
        //popoverView!.tableView.reloadData()
        
        popoverView!.title = "Popover"
        
        popoverView!.setEditing(Bool.false, animated: Bool.true)
        
        popoverView!.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popover:UIPopoverPresentationController = popoverView!.popoverPresentationController
        popover.delegate = self
        popover.permittedArrowDirections = .Any
        popover.barButtonItem = popoverButton
        popoverView!.preferredContentSize = CGSizeMake(200, 300)
        self.navigationController.presentViewController(popoverView, animated: Bool.true, completion:{})
    }
    
    func loadActionSheet(sender: AnyObject!) {
        println("Action Sheet source button is \(sender)")
        var actionSheet = UIAlertController(title: "Action Sheet", message: "You can now disable actions in action sheet", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var defaultAction = UIAlertAction(title: "Disabled Action", style: UIAlertActionStyle.Default, handler: {
            (alertAction: UIAlertAction!) -> Void in
            println("Alert Action is \(alertAction.title)")
            })
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alertAction: UIAlertAction!) -> Void in
            println("Alert Action is \(alertAction.title)")
            })
        var destructiveAction = UIAlertAction(title: "Enabled Action", style: UIAlertActionStyle.Default, handler: {
            (alertAction: UIAlertAction!) -> Void in
            println("Alert Action is \(alertAction.title)")
            })

        //defaultAction.enabled = Bool.false
        
        actionSheet.addAction(defaultAction)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(destructiveAction)

        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular) {
            actionSheet.modalPresentationStyle = .Popover
            let popover:UIPopoverPresentationController = actionSheet.popoverPresentationController
            popover.delegate = self
            popover.permittedArrowDirections = .Any
            popover.barButtonItem = self.actionSheet
        }

        var actions:NSArray = actionSheet.actions
        
        for action : AnyObject in actions {
            if let act = action as? UIAlertAction {
                if act.title == "Disabled Action" {
                    act.enabled = Bool.false
                }
            }
        }
        self.navigationController.presentViewController(actionSheet, animated: Bool.true, completion: {})
    }
    
    func loadAlertView(sender: AnyObject!) {
        println("Alert View source button is \(sender)")
        var alert = UIAlertController(title: "Alert!!", message: "Alert Message", preferredStyle: UIAlertControllerStyle.Alert)
        
        var alertAction = UIAlertAction(title: "Default", style: UIAlertActionStyle.Default, handler: {
            (alertAction: UIAlertAction!) -> Void in
                println("Alert Action is \(alertAction.title)")
            })
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alertAction: UIAlertAction!) -> Void in
            println("Alert Action is \(alertAction.title)")
            })
        var destructiveAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: {
            (alertAction: UIAlertAction!) -> Void in
            println("Alert Action is \(alertAction.title)")
            })

        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        
        self.navigationController.presentViewController(alert, animated: Bool.true, completion: {})
    }
    
    //UIAdaptivePresentationControllerDelegate
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!) -> UIModalPresentationStyle {
        //controller.presentedViewController.view.frame = CGRectMake(CGRectGetMinX(view.bounds), topLayoutGuideLength, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))
        
        //println("Presented View \(controller.presentedViewController.view)")

        return UIModalPresentationStyle.OverFullScreen
    }
    
    func presentationController(controller: UIPresentationController!, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController! {
        
        println("Presented Controller: \(controller.presentedViewController)")
        
        var navController = UINavigationController(rootViewController: controller.presentedViewController)
        //navController.setToolbarHidden(Bool.false, animated: Bool.true)
        navController.navigationBar.translucent = Bool.true
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        visualEffectView.frame = controller.presentedViewController.view.frame;

        controller.presentedViewController.view.addSubview(visualEffectView)
        if controller.presentedViewController is MyVC {
            visualEffectView.contentView.addSubview((controller.presentedViewController as MyVC).tableView)
        }
        
        popoverView!.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "dismissPopover:");
        popoverView!.navigationItem.rightBarButtonItem.tintColor = UIColor(red: 242.0/255.0, green: 108.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        //navController.hidesBarsOnTap = Bool.true
        //navController.condensesBarsOnSwipe = Bool.true
        return navController
    }
    
    func dismissPopover(sender: AnyObject!) {
        self.navigationController.dismissViewControllerAnimated(Bool.true, completion: nil)
    }
}
