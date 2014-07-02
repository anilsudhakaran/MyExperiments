//
//  MyCustomTransition.m
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/7/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import "MyCustomTransition.h"

@implementation MyCustomTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .25;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIViewController *presentedVC = self.presenting ? toVC : fromVC;

    CGRect finalFrame = [transitionContext finalFrameForViewController:presentedVC];
    CGRect initialFrame = CGRectMake(finalFrame.origin.x, CGRectGetHeight(containerView.bounds), finalFrame.size.width, finalFrame.size.height);
    
    
    CGRect beginFrame = self.presenting ? initialFrame : finalFrame;
    CGRect endFrame = self.presenting ? finalFrame : initialFrame;
    
    
    presentedVC.view.frame = beginFrame;
    if (self.presenting) {
        [containerView addSubview:presentedVC.view];
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        presentedVC.view.frame = endFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
