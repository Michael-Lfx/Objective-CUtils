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
 
 开始用二维指针传递数据源的方式实现，想把整个流程做得更自动化。发现要照顾的细节较多，故改成block由调用方决定数据源的同步操作。
 
 参考自：http://www.raywenderlich.com/63089/cookbook-moving-table-view-cells-with-a-long-press-gesture
 
 TODO:UICollectionView实现类似功能
 
 *  @param block 更新数据源
 *
 *  @return 表视图
 */
- (instancetype)enableDragCellWithDataSourceUpdateBlock:(__autoreleasing MoveCellDataSourceUpdateBlock)block;

@end
