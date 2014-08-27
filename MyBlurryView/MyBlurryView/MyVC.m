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
@synthesize top = _top;

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
    
    self.navigationItem.title = @"Tap outside modal to dismiss";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithDescriptor:[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline] size:15],
                                                                    NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
    
    self.transitionDelegate = [[MyCustomTransitionDelegate alloc] init];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.top = self.topLayoutGuide.length;
    self.imgView.frame = CGRectMake(0, self.top, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    self.transitionDelegate.top = self.top;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)addNewView:(id)sender {
    self.myNewVC = [[MyCustomModalBlurryVC alloc] init];
//    self.myNewVC.view.backgroundColor = [UIColor purpleColor];
//    self.myNewVC.view.alpha = 1.0;
    
    self.myNewVC.transitioningDelegate = self.transitionDelegate;
    self.myNewVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:self.myNewVC animated:YES completion:^{
        self.navigationController.navigationBar.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
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
