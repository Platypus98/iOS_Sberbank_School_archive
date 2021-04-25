//
//  ComputeredWallView.h
//  PingPong
//
//  Created by Ilya on 06/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComputeredWallView : UIView

@property (nonatomic, assign) CGFloat wallSpeed;

- (instancetype)initWithFrame:(CGRect)frame andWallSpeed:(CGFloat)wallSpeed;

@end

NS_ASSUME_NONNULL_END
