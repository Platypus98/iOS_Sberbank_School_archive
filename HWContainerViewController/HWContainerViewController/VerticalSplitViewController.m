//
//  VerticalSplitViewController.m
//  HWContainerViewController
//
//  Created by Ilya on 10/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "VerticalSplitViewController.h"

@interface VerticalSplitViewController ()

@property (nonatomic, strong) ViewController *leftViewController;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) ViewController *rightViewController;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation VerticalSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftViewController];
    [self setupRightViewController];
}

- (void)setupLeftViewController
{
    self.leftViewController  = [ViewController new];
    [self addChildViewController:self.leftViewController];
    [self.view addSubview:self.leftViewController.view];
    [self.leftViewController didMoveToParentViewController:self];
    self.leftViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    self.leftViewController.view.backgroundColor = [UIColor redColor];
    
    self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 26)];
    self.leftLabel.center = self.leftViewController.view.center;
    self.leftLabel.text = @"1";
    self.leftLabel.font = [UIFont systemFontOfSize:30.0];
    self.leftLabel.textAlignment = NSTextAlignmentCenter;
    [self.leftViewController.view addSubview:self.leftLabel];
}

- (void)setupRightViewController
{
    self.rightViewController = [ViewController new];
    [self addChildViewController:self.rightViewController];
    [self.view addSubview:self.rightViewController.view];
    [self.rightViewController didMoveToParentViewController:self];
    self.rightViewController.view.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    self.rightViewController.view.backgroundColor = [UIColor blueColor];
    
    self.rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 26)];
    self.rightLabel.center = CGPointMake(self.rightViewController.view.center.x - self.leftViewController.view.frame.size.width, self.rightViewController.view.center.y);
    self.rightLabel.text = @"2";
    self.rightLabel.font = [UIFont systemFontOfSize:30.0];
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.rightViewController.view addSubview:self.rightLabel];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (size.width >= size.height) {
        // Landscape frames
        self.view.frame = CGRectMake(0, 0, size.width, size.height);
        
        self.leftViewController.view.frame = CGRectMake(0, 0, size.width/2, size.height);
        self.leftLabel.center = self.leftViewController.view.center;

        self.rightViewController.view.frame = CGRectMake(size.width/2, 0, size.width/2, size.height);
        self.rightLabel.center = CGPointMake(self.rightViewController.view.center.x - self.leftViewController.view.frame.size.width, self.rightViewController.view.center.y);

    } else {
        // Portrait frames
        self.view.frame = CGRectMake(0, 0, size.width, size.height);
        
        self.leftViewController.view.frame = CGRectMake(0, 0, size.width/2, size.height);
        self.leftLabel.center = self.leftViewController.view.center;

        self.rightViewController.view.frame = CGRectMake(size.width/2, 0, size.width/2, size.height);
        self.rightLabel.center = CGPointMake(self.rightViewController.view.center.x - self.leftViewController.view.frame.size.width, self.rightViewController.view.center.y);

    }
}


@end
