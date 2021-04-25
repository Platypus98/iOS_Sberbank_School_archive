//
//  ViewController.m
//  GRPProgressView
//
//  Created by Alexey Levanov on 25/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "ViewController.h"
#import "GRPProgressView.h"


@interface ViewController ()

@property (nonatomic, strong) GRPProgressView *progressView;
@property (nonatomic, strong) GRPProgressView *verticalProgressView;

@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	CGFloat offset = 30;
    
	self.progressView = [[GRPProgressView alloc] initWithFrame:CGRectMake(offset, 200, CGRectGetWidth(self.view.frame) - 2*offset, 50) isVertical:NO];
    
    self.verticalProgressView = [[GRPProgressView alloc] initWithFrame:CGRectMake(offset, 300, 50, CGRectGetWidth(self.view.frame) - 2*offset) isVertical:YES];
    
	[self.view addSubview:self.progressView];
    [self.view addSubview:self.verticalProgressView];
	
	self.progressView.baseColor = [UIColor redColor];
	self.progressView.progressColor = [UIColor yellowColor];
    
    self.verticalProgressView.baseColor = [UIColor grayColor];
    self.verticalProgressView.progressColor = [UIColor greenColor];
	
	[self.progressView setProgress:0.7 withAnimation:NO];
    [self.verticalProgressView setProgress:0.7 withAnimation:NO];
	
    
	UIButton *updateProgressButton = [UIButton buttonWithType:UIButtonTypeSystem];
	updateProgressButton.frame = CGRectMake(50, 50, 200, 30);
	updateProgressButton.center = self.view.center;
	[updateProgressButton setTitle:@"Обновить прогресс" forState:UIControlStateNormal];
	[updateProgressButton addTarget:self action:@selector(updateProgress) forControlEvents:UIControlEventTouchUpInside];
	[updateProgressButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	
	[self.view addSubview:updateProgressButton];
}

- (void)updateProgress
{
	CGFloat randomValue = arc4random()%100 + 1;
	randomValue = randomValue / 100.f;
	
	[self.progressView setProgress:randomValue withAnimation:YES];
    [self.verticalProgressView setProgress:randomValue withAnimation:YES];
}

@end
