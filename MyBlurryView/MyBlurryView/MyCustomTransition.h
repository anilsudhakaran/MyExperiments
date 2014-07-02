//
//  MyCustomTransition.h
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/7/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface MyCustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) BOOL presenting;
@end
