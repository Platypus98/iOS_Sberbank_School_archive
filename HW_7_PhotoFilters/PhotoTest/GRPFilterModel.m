//
//  GRPFilterModel.m
//  PhotoTest
//
//  Created by Ilya on 08/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "GRPFilterModel.h"

@interface GRPFilterModel ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDictionary<NSString *, id> *parameters;

@end

@implementation GRPFilterModel

- (instancetype)initWithName:(NSString *)name parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self)
    {
        _name = [name copy];
        _parameters = [parameters copy];
    }
    return self;
}

@end
