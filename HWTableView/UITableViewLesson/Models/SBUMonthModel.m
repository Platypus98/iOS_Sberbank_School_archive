//
//  MonthModel.m
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "SBUMonthModel.h"


@interface SBUMonthModel()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *descr;

@end


@implementation SBUMonthModel

- (instancetype)initWithName:(NSString *)name descr:(NSString *)decr
{
	self = [super init];
	if (self)
	{
		_name = [name copy];
		_descr = [_descr copy];
	}
	return self;
}

@end
