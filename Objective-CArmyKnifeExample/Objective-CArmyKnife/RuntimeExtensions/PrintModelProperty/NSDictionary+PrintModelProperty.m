#import "NSObject+PrintModelProperty.h"
#import "NSDictionary+PrintModelProperty.h"


@implementation NSDictionary (PrintModelProperty)

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

