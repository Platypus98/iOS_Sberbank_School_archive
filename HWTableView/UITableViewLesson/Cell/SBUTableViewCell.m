//
//  SBUTableViewCell.m
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "SBUTableViewCell.h"

NSString * const SBUCellIdentifier = @"TableViewCell";


@interface SBUTableViewCell()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *iconView;

@end


@implementation SBUTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		_iconView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 30, 30)];
		CGRect frame = CGRectMake(40, 15, UIScreen.mainScreen.bounds.size.width - 5 - 40, 20);
		_label = [[UILabel alloc] initWithFrame:frame];
        _label.font = [UIFont fontWithName:@"Helvetica" size:17.0];
        _label.adjustsFontSizeToFitWidth = NO;
        _label.numberOfLines = 0;
		[self.contentView addSubview:_label];
		[self.contentView addSubview:_iconView];
	}
	return self;
}

- (void)prepareForReuse
{
	self.iconView.image = nil;
	self.label.text = nil;
	[super prepareForReuse];
}

+ (CGFloat)getCellHeightWithText:(NSString *)text
{
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 5 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:17.0]} context:nil];
    CGFloat finalHeight = textRect.size.height + 30;
    
    return finalHeight;
}

@end
