//
//  SBUHeaderView.h
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * _Nonnull const SBUHeaderViewIdentifier;

NS_ASSUME_NONNULL_BEGIN

@interface SBUHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) UILabel *title;

@end

NS_ASSUME_NONNULL_END
