//
//  MyCustomTransitionDelegate.h
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/28/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

@import UIKit;

@interface MyCustomTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate>
@property (nonatomic, assign) CGFloat top;

@end
