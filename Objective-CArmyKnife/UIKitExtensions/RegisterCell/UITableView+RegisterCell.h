@import UIKit;


@interface UITableView (RegisterCell)

- (instancetype)registerNibWithName:(NSString *)name forCellReuseIdentifier:(NSString *)identifier;

- (instancetype)registerNibWithName:(NSString *)name bundle:(NSBundle *)bundleOrNil forCellReuseIdentifier:(NSString *)identifier;

@end
