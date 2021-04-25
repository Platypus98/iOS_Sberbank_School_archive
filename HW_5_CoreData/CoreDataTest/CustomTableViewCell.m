//
//  CustomTableViewCell.m
//  CoreDataTest
//
//  Created by Ilya on 02/07/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 5 - 40, 20)];
        [self.contentView addSubview:_label];
    }
    return self;
}

@end
