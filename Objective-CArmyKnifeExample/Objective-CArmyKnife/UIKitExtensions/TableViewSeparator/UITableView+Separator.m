#import "UITableView+Separator.h"
#import "MethodSwizzConvenienceInterface.h"
#import <objc/runtime.h>

@implementation UITableView (Separator)

- (instancetype)clearExtraSeparator {
    UIView *maskView = [[UIView alloc] init];
    maskView.backgroundColor = self.backgroundColor;
    self.tableFooterView = maskView;
    return self;
}

/**
 *  参考 http://stackoverflow.com/questions/25770119/ios-8-uitableview-separator-inset-0-not-working/25772101#25772101
 */
- (instancetype)makeSeparatorEqualToScreenWidthWithCellIdentifiers:(NSArray *)identifiers {
    methodSwizz(self.class, @selector(dequeueReusableCellWithIdentifier:), @selector(spt_dequeueReusableCellWithIdentifier:));
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    return self;
}

- (id)spt_dequeueReusableCellWithIdentifier:(NSString *)identifier {
    UITableViewCell *cell = [self spt_dequeueReusableCellWithIdentifier:identifier];
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    return cell;
}

@end
