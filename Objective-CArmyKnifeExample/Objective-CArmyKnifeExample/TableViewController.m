//
//  TableViewController.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/10/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "TableViewController.h"
#import "UITableView+Separator.h"
#import "UITableView+MoveCell.h"

@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *dataForTableView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *array = @[@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language",@"hello", @"world", @"objc", @"programming", @"language"];

    id x = [array mutableCopy];
    NSLog(@"%p", x);
    self.dataForTableView = [array mutableCopy];
    [self.tableView clearExtraSeparator];
    __weak typeof(self) weakSelf = self;
    [self.tableView enableDragCellWithDataSourceUpdateBlock:^(NSIndexPath *dstIndexPath, NSIndexPath *srcIndexPath) {
        [weakSelf.dataForTableView exchangeObjectAtIndex:dstIndexPath.row withObjectAtIndex:srcIndexPath.row];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataForTableView.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];
    
    [tableView makeSeparatorEqualToScreenWidthWithCell:cell]
     // Configure the cell...
        .textLabel
        .text = self.dataForTableView[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
