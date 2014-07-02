//
//  MyPresentationController.m
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/28/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import "MyPresentationController.h"
#import "MyCustomTransitionDelegate.h"

@interface MyPresentationController ()
@property (nonatomic, strong) UIView *dimmingView;
@end

@implementation MyPresentationController

-(instancetype)initWithPresentingViewController:(UIViewController *)presentingViewController presentedViewController:(UIViewController *)presentedViewController {
    self = [super initWithPresentingViewController:presentingViewController presentedViewController:presentedViewController];
    if (self) {
        [self prepareDimmingView];
    }
    return self;
}

-(void)presentationTransitionWillBegin {
    UIView* containerView = [self containerView];
    UIViewController* presentedViewController = [self presentedViewController];
    [self.dimmingView setFrame:[containerView bounds]];
    [self.dimmingView setAlpha:0.0];
    
    [containerView insertSubview:self.dimmingView atIndex:0];
    
    if([presentedViewController transitionCoordinator])
    {
        [[presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            [self.dimmingView setAlpha:1.0];
        } completion:nil];
    }
    else
    {
        [self.dimmingView setAlpha:1.0];
    }
}

-(void)dismissalTransitionWillBegin {
    if([[self presentedViewController] transitionCoordinator])
    {
        [[[self presentedViewController] transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            [self.dimmingView setAlpha:0.0];
        } completion:nil];
    }
    else
    {
        [self.dimmingView setAlpha:0.0];
    }
}

-(CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return parentSize;
}

- (BOOL)shouldPresentInFullscreen {
    return NO;
}

-(void)containerViewWillLayoutSubviews {
    self.dimmingView.frame = self.containerView.bounds;
    [[self presentedView] setFrame:[self frameOfPresentedViewInContainerView]];
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect presentedViewFrame = CGRectZero;
    CGRect containerBounds = [[self containerView] bounds];
    
    presentedViewFrame = CGRectIntegral(CGRectInset(containerBounds, CGRectGetWidth(containerBounds)/7.0, CGRectGetHeight(containerBounds)/7.0));
    return presentedViewFrame;
}

-(id<UIAdaptivePresentationControllerDelegate>)delegate {
    return [[MyCustomTransitionDelegate alloc] init];
}

-(void)prepareDimmingView {
    self.dimmingView = [[UIView alloc] init];
    [self.dimmingView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.25]];
    self.dimmingView.alpha = 0.0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)];
    [self.dimmingView addGestureRecognizer:tap];

}

- (void)dimmingViewTapped:(UIGestureRecognizer *)gesture
{
    if([gesture state] == UIGestureRecognizerStateRecognized)
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
            if ([self.presentingViewController isKindOfClass:[UINavigationController class]]) {
                ((UINavigationController *)self.presentingViewController).navigationBar.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
            }
        }];
    }
}

@end
