//
//  SBUHeaderView.m
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "SBUHeaderView.h"

NSString * const SBUHeaderViewIdentifier = @"SBUHeaderView";

@implementation SBUHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithReuseIdentifier:reuseIdentifier];
	if (self)
	{
		_title = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, UIScreen.mainScreen.bounds.size.width - 5 * 2, 20)];
		[self addSubview:_title];
		self.backgroundColor = UIColor.grayColor;
	}
	return self;
}

- (void)prepareForReuse
{
	self.title.text = nil;
	[super prepareForReuse];
}

@end
