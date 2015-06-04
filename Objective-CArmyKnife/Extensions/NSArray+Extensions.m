#import "NSObject+Extensions.h"
#import "NSArray+Extensions.h"

#pragma mark - 输出可便于阅读的内容

@implementation NSArray (Description)

- (NSString *)readableDescription {
    NSMutableString *result = [NSMutableString string];
    
    for (id value in self) {
        [result appendFormat:@"%@, ", [value readableDescription]];
    }
    deleteLastTwoCharacters(result);
    
    return [NSString stringWithFormat:@"(%@)", result];
}

@end

