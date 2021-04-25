//
//  BallView.h
//  PingPong
//
//  Created by Ilya on 05/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BallView : UIView

@property (nonatomic, readonly) CGFloat radius;
@property (nonatomic, readonly) UIColor *color;
@property (nonatomic, assign) CGFloat speedX;
@property (nonatomic, assign) CGFloat speedY;

- (instancetype)initWithRadius:(CGFloat)radius Color:(UIColor *)color SpeedX:(CGFloat)speedX SpeedY:(CGFloat)speedY;

@end

NS_ASSUME_NONNULL_END
