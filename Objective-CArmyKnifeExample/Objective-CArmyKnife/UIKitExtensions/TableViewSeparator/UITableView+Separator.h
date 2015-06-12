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
 
 https://github.com/zhigang1992/ZGParallelView/issues/8
 
 >Overriding -dealloc in a category is fatal; it replaces the existing implementation, ensuring that every UITableView deallocation will, at best, leak and, at worst, crash or yield undefined behavior.

 >As well, you shouldn't be overriding the KVO methods, either (or any other method of the original class) in a category.
 
 ```
 + (void)load
 {
 Method origMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
 Method newMethod = class_getInstanceMethod([self class], @selector(my_dealloc));
 method_exchangeImplementations(origMethod, newMethod);
 }
 
 - (void)my_dealloc
 {
 // do your logic here
 
 
 //this calls original dealloc method
 [self my_dealloc];
 }
 ```
 *
 *  @return 当前UITableViewCell
 */
- (UITableViewCell *)makeSeparatorEqualToScreenWidthWithCell:(UITableViewCell *)cell;

@end
