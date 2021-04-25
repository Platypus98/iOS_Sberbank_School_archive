//
//  MonthModel.h
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBUMonthModel : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *descr;

- (instancetype)initWithName:(NSString *)name descr:(NSString *)decr;

@end

NS_ASSUME_NONNULL_END
