//
//  ComputeredWallView.m
//  PingPong
//
//  Created by Ilya on 06/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "ComputeredWallView.h"

@implementation ComputeredWallView

- (instancetype)initWithFrame:(CGRect)frame andWallSpeed:(CGFloat)wallSpeed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _wallSpeed = wallSpeed;
    }
    return self;
}

@end
