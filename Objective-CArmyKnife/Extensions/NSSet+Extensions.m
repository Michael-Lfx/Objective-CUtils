#import "NSObject+Extensions.h"
#import "NSSet+Extensions.h"

#pragma mark - 输出可便于阅读的内容

@implementation NSSet (Description)

- (NSString *)readableDescription {
    return [NSString stringWithFormat:@"{%@}", [[self allObjects] readableDescription]];
}

@end

