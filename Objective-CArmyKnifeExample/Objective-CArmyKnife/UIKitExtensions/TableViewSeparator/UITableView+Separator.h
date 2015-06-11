@import UIKit;

@interface UITableView (Separator)

/**
 消除Plain样式下的多余分割线
 
 Plain样式，行数不够填满整个屏幕时，无数据的Cell也会有分割线，此函数就是处理它们的
 
 *  @return 当前表视图
 */
- (instancetype)clearExtraSeparator;

/**
 *  让Cell分割线等于屏幕宽度
 
 建议用法：
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];
 
    [tableView makeSeparatorEqualToScreenWidthWithCell:cell]
 
        // Configure the cell...
 
        .textLabel
 
        .text = self.dataForTableView[indexPath.row];
 
    return cell;
 
 }
 
 做这个功能时，我走了些弯路。想过混写dealloc，但是ARC下混写dealloc，听说有较大副作用。
 *
 *  @return 当前UITableViewCell
 */
- (UITableViewCell *)makeSeparatorEqualToScreenWidthWithCell:(UITableViewCell *)cell;

@end
