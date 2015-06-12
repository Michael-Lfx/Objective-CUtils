//
//  SecondViewController.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/11/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+Frame.h"
#import "UIView+Transform3DAnimation.h"

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *array;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl setAttributedTitle:[[NSAttributedString alloc] initWithString:@"松手更新数据"]];
    [self.tableView addSubview:self.refreshControl];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableHeaderView = [UIView new];
    
        self.array = @[@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foregroundTapped:)];
    tap.delegate = self;

    UIScrollView *view = self.tableView;
    [view addGestureRecognizer:tap];
}

- (void)foregroundTapped:(UIGestureRecognizer *)reg {
    NSLog(@"%@", reg);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}


- (void)refreshView:(UIRefreshControl *)refresh {
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"更新数据中..."];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"上次更新日期 %@",
                             [formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];

    [self.tableView reloadData];
    [refresh endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TestCell"];
    }
    

    // Configure the cell...
    cell.textLabel
    .text = self.array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell transform3DAnimation];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
