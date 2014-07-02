//
//  MyVC.m
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/7/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import "MyVC.h"
#import "MyCustomTransition.h"
#import "MyPresentationController.h"
#import "MyCustomTransitionDelegate.h"
#import "MyCustomModalBlurryVC.h"

@interface MyVC ()
@property (nonatomic, strong) IBInspectable MyCustomModalBlurryVC *myNewVC;
@property (nonatomic, strong) IBInspectable UILabel *myInspectableLabel;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) MyCustomTransitionDelegate *transitionDelegate;
@end

@implementation MyVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"california poppy"]];
    self.imgView.frame = self.view.bounds;
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.imgView];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewView:)];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat top = self.topLayoutGuide.length;
    self.imgView.frame = CGRectMake(0, top, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewView:(id)sender {
    self.myNewVC = [[MyCustomModalBlurryVC alloc] init];
//    self.myNewVC.view.backgroundColor = [UIColor purpleColor];
//    self.myNewVC.view.alpha = 1.0;
    
    self.transitionDelegate = [[MyCustomTransitionDelegate alloc] init];
    self.myNewVC.transitioningDelegate = self.transitionDelegate;
    self.myNewVC.modalPresentationStyle = UIModalPresentationCustom;

    [self presentViewController:self.myNewVC animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.imgView.image = [UIImage imageNamed:@"skittles"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.imgView.image = [UIImage imageNamed:@"california poppy"];
            });
        });
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
