//
//  MyCustomModalBlurryVC.m
//  MyBlurryView
//
//  Created by Anil Sudhakaran on 6/29/14.
//  Copyright (c) 2014 Anil Sudhakaran. All rights reserved.
//

#import "MyCustomModalBlurryVC.h"

@interface MyCustomModalBlurryVC ()
@property (nonatomic, strong) UIVisualEffectView *backgroundView;
@property (nonatomic, strong) UIVisualEffectView *foregroundView;
@property (nonatomic, strong) UILabel *vibrantLabel;
@end

@implementation MyCustomModalBlurryVC

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
    // Do any additional setup after loading the view.
    //Add Visual Effect Foreground & Background views
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.backgroundView = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    UIVisualEffect *vibr = [UIVibrancyEffect effectForBlurEffect:blur];
    self.foregroundView = [[UIVisualEffectView alloc] initWithEffect:vibr];
    
    self.vibrantLabel = [[UILabel alloc] initWithFrame:self.foregroundView.bounds];
    self.vibrantLabel.text = @"Hello!!\nVibrant\n&\nBlurry";
    self.vibrantLabel.textAlignment = NSTextAlignmentCenter;
    //self.vibrantLabel.textColor = [UIColor clearColor];
    self.vibrantLabel.font = [UIFont fontWithDescriptor:[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline] size:40];
    self.vibrantLabel.numberOfLines = 0;
    
    
    [self.backgroundView.contentView addSubview:self.foregroundView];
    //[toVC.view addSubview:lbl];
    [self.foregroundView.contentView addSubview:self.vibrantLabel];
    [self.view addSubview:self.backgroundView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.backgroundView.frame = self.view.bounds;
    self.foregroundView.frame = self.backgroundView.bounds;
    self.vibrantLabel.frame = self.foregroundView.bounds;
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
