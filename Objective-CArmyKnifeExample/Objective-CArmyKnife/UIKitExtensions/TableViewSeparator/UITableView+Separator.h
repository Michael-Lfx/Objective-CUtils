@import UIKit;

@interface UITableView (Separator)

/**
 消除Plain样式下的多余分割线
 
 Plain样式，行数不够填满整个屏幕时，无数据的Cell也会有分割线，此函数就是处理它们的
 
 *  @return 当前表视图
 */
- (instancetype)clearExtraSeparator;

/**
 *  让分割线等于屏幕宽度
 *
 *  @return 当前表视图
 */
- (instancetype)makeSeparatorEqualToScreenWidthWithCellIdentifiers:(NSArray *)identifiers;

@end
