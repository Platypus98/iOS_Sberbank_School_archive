//
//  SBUTableViewCell.h
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * _Nonnull const SBUCellIdentifier;

@interface SBUTableViewCell : UITableViewCell

@property (nonatomic, readonly) UILabel *label;
@property (nonatomic, readonly) UIImageView *iconView;

+ (CGFloat)getCellHeightWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
