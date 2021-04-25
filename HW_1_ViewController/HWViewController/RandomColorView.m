//
//  GrayView.m
//  IntroduceViewController
//
//  Created by Ilya on 18/05/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "RandomColorView.h"
#import "ViewController.h"

@interface RandomColorView ()

@property (nonatomic, assign) double x;

@property (nonatomic, assign) double y;

@end

@implementation RandomColorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        //Get random color
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        self.backgroundColor = color;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinates = [self getTouchCoordinates:touches];
    self.x = coordinates.x;
    self.y = coordinates.y;
    NSLog(@"GrayView touches began: %f, %f", coordinates.x, coordinates.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinates = [self getTouchCoordinates:touches];
    self.frame = CGRectMake(self.frame.origin.x + coordinates.x - self.x, self.frame.origin.y + coordinates.y - self.y, 100, 100);
    NSLog(@"GrayView touches mooved: %f, %f", coordinates.x, coordinates.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinates = [self getTouchCoordinates:touches];
    NSLog(@"GrayView touches ended: %f, %f", coordinates.x, coordinates.y);
}

- (CGPoint)getTouchCoordinates:(NSSet<UITouch *> *)touches
{
    UITouch *currentTouch = touches.anyObject;
    return [currentTouch locationInView:self];
}

@end
