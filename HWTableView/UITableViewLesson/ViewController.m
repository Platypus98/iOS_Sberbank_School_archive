//
//  ViewController.m
//  UITableViewLesson
//
//  Created by Константин Богданов on 28/05/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "ViewController.h"
#import "SBUTableViewCell.h"
#import "SBUMonthModel.h"
#import "SBUHeaderView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<SBUMonthModel *> *models;

@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	SBUMonthModel *january = [[SBUMonthModel alloc] initWithName:@"Lorem ipsum dolor sit amet, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate, consectetur adipiscing elit, qui dolorem ipsum, quia dolor sit, amet," descr:@"Это месяц январь"];
	SBUMonthModel *february = [[SBUMonthModel alloc] initWithName:@"Lorem ipsum dolor sit amet, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quis nostrud exercitation ullamco laboris nisi ut aliquip ex" descr:@"Это месяц февраль"];
	SBUMonthModel *march = [[SBUMonthModel alloc] initWithName:@"Март" descr:@"Это месяц март"];
	SBUMonthModel *april = [[SBUMonthModel alloc] initWithName:@"Апрель" descr:@"Это месяц апрель"];
	SBUMonthModel *may = [[SBUMonthModel alloc] initWithName:@"Май" descr:@"Это месяц май"];

	self.models = @[january, february, march, april, may];

	self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	[self.tableView registerClass:[SBUTableViewCell class] forCellReuseIdentifier:SBUCellIdentifier];
	[self.tableView registerClass:[SBUHeaderView class] forHeaderFooterViewReuseIdentifier:SBUHeaderViewIdentifier];
	[self.view addSubview:self.tableView];
	[self.tableView reloadData];
}


#pragma mark - UITableViewDelegate


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	SBUHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SBUHeaderViewIdentifier];
	header.title.text = @"Месяца";

	return header;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
	SBUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SBUCellIdentifier forIndexPath:indexPath];
	SBUMonthModel *model = self.models[indexPath.row];
    cell.label.text = model.name;

    CGFloat labelHeight = [SBUTableViewCell getCellHeightWithText:model.name];
    
    cell.label.frame = CGRectMake(40, 15, UIScreen.mainScreen.bounds.size.width - 5 - 40, labelHeight - 30);
    
	cell.iconView.image = [UIImage imageNamed:@"logo"];
    
	return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBUMonthModel *model = self.models[indexPath.row];
    
    CGFloat cellHeight = [SBUTableViewCell getCellHeightWithText:model.name];
    
	return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 25;
}

#pragma mark - editing

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//	if (editingStyle == UITableViewCellEditingStyleDelete)
//	{
//		NSMutableArray *array = [NSMutableArray arrayWithArray:self.models];
//		[tableView beginUpdates];
//		[array removeObjectAtIndex:indexPath.row];
//		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
//		self.models = [array copy];
//		[tableView endUpdates];
//	}
}

@end
