#import "UITableView+Separator.h"

@implementation UITableView (Separator)

- (void)clearExtraSeparator {
    UIView *maskView = [[UIView alloc] init];
    maskView.backgroundColor = self.backgroundColor;
    self.tableFooterView = maskView;
}

@end
