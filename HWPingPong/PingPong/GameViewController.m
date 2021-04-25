//
//  GameViewController.m
//  PingPong
//
//  Created by Ilya on 11/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "GameViewController.h"
#import "Views/BallView.h"
#import "Views/WallView.h"
#import "Views/ComputeredWallView.h"

@interface GameViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) BallView *ball;
@property (nonatomic, strong) WallView *userWall;
@property (nonatomic, strong) ComputeredWallView *computeredWall;
@property (nonatomic, strong) UILabel *userScoreLabel;
@property (nonatomic, strong) UILabel *computerScoreLabel;
@property (nonatomic, assign) NSInteger userScore;
@property (nonatomic, assign) NSInteger computerScore;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.userScore = 0;
    self.computerScore = 0;
    
    [self setupBall];
    [self setupTimer];
    [self setupUserWall];
    [self setupCumputeredWall];
    [self setupScoresLabel];
}

- (void)setupBall
{
    self.ball = [[BallView alloc]initWithRadius:30 Color:UIColor.redColor SpeedX:1 SpeedY:0.7];
    self.ball.center = self.view.center;
    [self.view addSubview:self.ball];
}

- (void)setupTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
}

- (void)setupUserWall
{
    self.userWall = [[WallView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, self.view.frame.size.height - 60, 80, 20)];
    self.userWall.backgroundColor = UIColor.grayColor;
    [self.view addSubview:self.userWall];
}

- (void)setupCumputeredWall
{
    self.computeredWall = [[ComputeredWallView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 60, 80, 20)];
    self.computeredWall.backgroundColor = UIColor.blackColor;
    [self.view addSubview:self.computeredWall];
}

- (void)setupScoresLabel
{
    self.userScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.center.y, 15, 25)];
    [self.view addSubview:self.userScoreLabel];
    
    self.computerScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 30, self.view.center.y, 15, 25)];
    self.computerScoreLabel.transform = CGAffineTransformMakeRotation(-M_PI);
    [self.view addSubview:self.computerScoreLabel];
    
    [self updateScore];
}

- (void)updateScore
{
    [self.userScoreLabel setText:[NSString stringWithFormat:@"%0ld", self.userScore]];
    [self.computerScoreLabel setText:[NSString stringWithFormat:@"%0ld", self.computerScore]];
}

- (void)timerTick
{
    [self checkwWorldState];
    
    //CGFloat rndMove = arc4random_uniform(self.ball.radius);
    
    self.computeredWall.center = CGPointMake(self.ball.center.x, self.computeredWall.center.y);
    
    //CGPointMake(self.ball.center.x + rndMove, self.computeredWall.center.y);
    
    self.ball.center = CGPointMake(self.ball.center.x + self.ball.speedX, self.ball.center.y + self.ball.speedY);
}

- (void)checkwWorldState
{
    CGFloat rightCoordX = self.ball.center.x + self.ball.radius;
    CGFloat leftCoordX = self.ball.center.x - self.ball.radius;
    CGFloat topCoordY = self.ball.center.y - self.ball.radius;
    CGFloat bottomCoordY = self.ball.center.y + self.ball.radius;
    
    if ((bottomCoordY + self.ball.speedY >= self.userWall.frame.origin.y) && ((self.ball.frame.origin.x >= self.userWall.frame.origin.x && self.ball.frame.origin.x <= self.userWall.frame.origin.x + self.userWall.frame.size.width) || (self.ball.frame.origin.x + self.ball.frame.size.width >= self.userWall.frame.origin.x && self.ball.frame.origin.x + self.ball.frame.size.width <= self.userWall.frame.origin.x + self.userWall.frame.size.width)))
    {
        self.ball.speedY = -self.ball.speedY;
    }
    
    if ((topCoordY + self.ball.speedY < self.computeredWall.frame.origin.y + self.computeredWall.frame.size.height) && (self.ball.center.x >= self.computeredWall.frame.origin.x && self.ball.center.x <= self.computeredWall.frame.origin.x + self.computeredWall.frame.size.width))
    {
        self.ball.speedY = -self.ball.speedY;
    }
    
    
    if (rightCoordX + self.ball.speedX >= CGRectGetWidth(self.view.frame))
    {
        self.ball.speedX = -self.ball.speedX;
    }
    
    if (bottomCoordY + self.ball.speedY >= CGRectGetHeight(self.view.frame))
    {
        //self.ball.speedY = -self.ball.speedY;
        self.ball.center = self.view.center;
        self.computerScore ++;
        [self updateScore];
        sleep(1);
    }
    
    if (leftCoordX < 0)
    {
        self.ball.speedX = -self.ball.speedX;
    }
    
    if (topCoordY < 0)
    {
        //self.ball.speedY = -self.ball.speedY;
        self.ball.center = self.view.center;
        self.computerScore ++;
        [self updateScore];
        sleep(1);
    }
    
}

@end
