@import UIKit;

@interface UITableView (Separator)

/**
 消除Plain样式下的多余分割线
 
 Plain样式，行数不够填满整个屏幕时，无数据的Cell也会有分割线，此函数就是处理它们的
 */
- (void)clearExtraSeparator;

@end
