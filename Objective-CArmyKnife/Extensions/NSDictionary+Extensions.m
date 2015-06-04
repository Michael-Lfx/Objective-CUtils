#import "NSObject+Extensions.h"
#import "NSDictionary+Extensions.h"

#pragma mark - 输出可便于阅读的内容

@implementation NSDictionary (Description)

- (NSString *)readableDescription {
    NSMutableString *result = [NSMutableString string];
    
    for (id key in self) {
        id value = [self objectForKey:key];
        [result appendFormat:@"%@ = %@; ", [key readableDescription], [value readableDescription]];
    }
    deleteLastTwoCharacters(result);
    
    return [NSString stringWithFormat:@"{%@}", result];
}

@end

