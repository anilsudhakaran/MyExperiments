//
//  MyCustomTransitionDelegate.m
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/28/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import "MyCustomTransitionDelegate.h"
#import "MyPresentationController.h"
#import "MyCustomTransition.h"

@implementation MyCustomTransitionDelegate
@synthesize top = _top;

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    MyCustomTransition *customTransition = [[MyCustomTransition alloc] init];
    customTransition.presenting = YES;
    return customTransition;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MyCustomTransition *customTransition = [[MyCustomTransition alloc] init];
    customTransition.presenting = NO;
    return customTransition;
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    MyPresentationController *myPresentationController = [[MyPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    myPresentationController.delegate = self;
    return myPresentationController;
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationCustom;
}

-(CGFloat)top {
    return _top;
}

-(void)setTop:(CGFloat)top {
    _top = top;
}

@end
