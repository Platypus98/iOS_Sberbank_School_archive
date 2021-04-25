//
//  GRPProgressView.m
//  GRPProgressView
//
//  Created by Alexey Levanov on 25/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "GRPProgressView.h"


const CGFloat GRPTotalAnimationTime = 3.0;

@interface GRPProgressView ()

@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, assign) BOOL isVertical;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation GRPProgressView

- (instancetype)initWithFrame:(CGRect)frame isVertical:(BOOL)isVertical
{
	self = [super initWithFrame:frame];
	if (self)
	{
		_progress = 0;
		_baseColor = [UIColor grayColor];
		_progressColor = [UIColor greenColor];
		_isVertical = isVertical;
		_progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _progress * CGRectGetWidth(frame), CGRectGetHeight(frame))];
	}
	
	return self;
}

- (void)didMoveToSuperview
{
	[self addSubview:self.progressView];
	[self recolorProgressView];
}

- (void)setProgress:(CGFloat)progress withAnimation:(BOOL)withAnimation
{
	CGFloat deltaProgress = fabs(self.progress - progress);
	CGFloat newAnimationTime = deltaProgress * GRPTotalAnimationTime;
	
    if (self.isVertical)
    {
        CGFloat newHeight = CGRectGetHeight(self.frame) * progress;
        
        if (withAnimation)
        {
            [UIView animateWithDuration:newAnimationTime animations:^{
                self.progressView.frame = CGRectMake(0, self.frame.size.height, CGRectGetWidth(self.frame), -newHeight);
            }];
        }
        else
        {
            self.progressView.frame = CGRectMake(0, self.frame.size.height, CGRectGetWidth(self.frame), -newHeight);
        }

    } else
    {
        CGFloat newWidth = CGRectGetWidth(self.frame) * progress;
        if (withAnimation)
        {
            [UIView animateWithDuration:newAnimationTime animations:^{
                self.progressView.frame = CGRectMake(0, 0, newWidth, CGRectGetHeight(self.frame));
            }];
        }
        else
        {
            self.progressView.frame = CGRectMake(0, 0, newWidth, CGRectGetHeight(self.frame));
        }
    }
    
	self.progress = progress;
}


#pragma mark - Setters

- (void)setBaseColor:(UIColor *)baseColor
{
	_baseColor = baseColor;
	[self recolorProgressView];
}

- (void)setProgressColor:(UIColor *)progressColor
{
	_progressColor = progressColor;
	[self recolorProgressView];
}

- (void)recolorProgressView
{
	self.backgroundColor = self.baseColor;
	self.progressView.backgroundColor = self.progressColor;
}

@end
