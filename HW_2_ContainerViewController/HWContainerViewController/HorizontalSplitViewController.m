//
//  HorizontalSplitViewController.m
//  HWContainerViewController
//
//  Created by Ilya on 10/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "HorizontalSplitViewController.h"

@interface HorizontalSplitViewController ()

@property (nonatomic, strong) ViewController *topViewController;
@property (nonatomic, strong) UILabel *labelTop;
@property (nonatomic, strong) ViewController *bottomViewController;
@property (nonatomic, strong) UILabel *labelBottom;

@end

@implementation HorizontalSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTopViewController];
    [self setupBottomViewController];
}

- (void)setupTopViewController
{
    self.topViewController = [ViewController new];
    [self addChildViewController:self.topViewController];
    [self.view addSubview:self.topViewController.view];
    [self.topViewController didMoveToParentViewController:self];
    
    self.topViewController.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height/2);
    self.topViewController.view.backgroundColor = [UIColor redColor];
    
    self.labelTop = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 26)];
    self.labelTop.center = self.topViewController.view.center;
    self.labelTop.text = @"1";
    self.labelTop.font = [UIFont systemFontOfSize:30.0];
    self.labelTop.textAlignment = NSTextAlignmentCenter;
    [self.topViewController.view addSubview:self.labelTop];
}

- (void)setupBottomViewController
{
    self.bottomViewController = [ViewController new];
    [self addChildViewController:self.bottomViewController];
    [self.view addSubview:self.bottomViewController.view];
    [self.bottomViewController didMoveToParentViewController:self];
    
    self.bottomViewController.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2);
    self.bottomViewController.view.backgroundColor = [UIColor blueColor];
    
    self.labelBottom = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 26)];
    self.labelBottom.center = CGPointMake(self.bottomViewController.view.center.x, self.bottomViewController.view.frame.size.height - self.topViewController.view.center.y);
    self.labelBottom.text = @"2";
    self.labelBottom.font = [UIFont systemFontOfSize:30.0];
    self.labelBottom.textAlignment = NSTextAlignmentCenter;
    [self.bottomViewController.view addSubview:self.labelBottom];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (size.width >= size.height) {
        // Landscape frames
        self.view.frame = CGRectMake(0, 0, size.width, size.height);
        self.topViewController.view.frame = CGRectMake(0, 0, size.width, size.height/2);
        self.labelTop.center = self.topViewController.view.center;
        
        self.bottomViewController.view.frame = CGRectMake(0, size.height/2, size.width, size.height/2);
        self.labelBottom.center = CGPointMake(self.bottomViewController.view.center.x, self.bottomViewController.view.frame.size.height - self.topViewController.view.center.y);
    } else {
        // Portrait frames
        self.view.frame = CGRectMake(0, 0, size.width, size.height);
        self.topViewController.view.frame = CGRectMake(0, 0, size.width, size.height/2);
        self.labelTop.center = self.topViewController.view.center;
        
        self.bottomViewController.view.frame = CGRectMake(0, size.height/2, size.width, size.height/2);
        self.labelBottom.center = CGPointMake(self.bottomViewController.view.center.x, self.bottomViewController.view.frame.size.height - self.topViewController.view.center.y);
    }
}

@end
