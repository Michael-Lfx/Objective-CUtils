//
//  UIView+Transform3DAnimation.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Transform3DAnimation)

/**
 *  旋转动画效果
 
 使用示例（每个单元格出现时旋转）：
 
 - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [cell transform3DAnimation];
 
 }
 *
 *  @return 当前视图
 */
- (instancetype)transform3DAnimation;

@end
