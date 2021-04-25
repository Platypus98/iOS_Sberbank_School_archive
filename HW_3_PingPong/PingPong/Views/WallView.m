//
//  WallView.m
//  PingPong
//
//  Created by Ilya on 05/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "WallView.h"

@interface WallView()

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@end

@implementation WallView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.x = [self getTouchCoordinates:touches].x;
    self.y = [self getTouchCoordinates:touches].y;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchCoordinates = [self getTouchCoordinates:touches];
    self.frame = CGRectMake(self.frame.origin.x + touchCoordinates.x - self.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    if (self.frame.origin.x < 0)
    {
        self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
    
    if (self.frame.origin.x + self.frame.size.width > self.superview.frame.size.width)
    {
        self.frame = CGRectMake(self.superview.frame.size.width - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
}

- (CGPoint)getTouchCoordinates:(NSSet<UITouch *> *)touches
{
    UITouch *currentTouch = touches.anyObject;
    return [currentTouch locationInView:self];
}

@end
