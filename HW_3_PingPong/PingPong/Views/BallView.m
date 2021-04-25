//
//  BallView.m
//  PingPong
//
//  Created by Ilya on 05/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "BallView.h"

@interface BallView()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) UIColor *color;

@end


@implementation BallView

- (instancetype)initWithRadius:(CGFloat)radius Color:(UIColor *)color SpeedX:(CGFloat)speedX SpeedY:(CGFloat)speedY
{
    self = [super initWithFrame:CGRectMake(0, 0, radius*2, radius*2)];
    if (self)
    {
        _radius = radius;
        _color = color;
        _speedX = speedX;
        _speedY = speedY;
    }
    return self;
}

- (void)didMoveToSuperview
{
    self.backgroundColor = self.color;
    self.layer.cornerRadius = self.radius;
    self.layer.masksToBounds = YES;
}

@end
