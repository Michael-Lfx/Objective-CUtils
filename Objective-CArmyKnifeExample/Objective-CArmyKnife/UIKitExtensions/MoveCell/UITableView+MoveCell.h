#import <UIKit/UIKit.h>

typedef void(^MoveCellDataSourceUpdateBlock)(NSIndexPath *dstIndexPath, NSIndexPath *srcIndexPath);

@interface UITableView (MoveCell)

/**
 *  长按拖拽TableViewCells，数据源需要在block中更新
 *
 
 示例用法：
 
 @property (strong, nonatomic) NSMutableArray *dataForTableView;
 
 __weak typeof(self) weakSelf = self;
 
 [self.tableView enableDragCellWithDataSourceUpdateBlock:
 
    ^(NSIndexPath *dstIndexPath, NSIndexPath *srcIndexPath) {
 
    [weakSelf.dataForTableView exchangeObjectAtIndex:dstIndexPath.row withObjectAtIndex:srcIndexPath.row];
 
 }];
 
 *  @param block 更新数据源
 *
 *  @return 表视图
 */
- (instancetype)enableDragCellWithDataSourceUpdateBlock:(__autoreleasing MoveCellDataSourceUpdateBlock)block;

@end
