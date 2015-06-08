#import "NSObject+PrintModelProperty.h"
#import "NSArray+PrintModelProperty.h"


@implementation NSArray (PrintModelProperty)

- (NSString *)readableDescription {
    NSMutableString *result = [NSMutableString string];
    
    for (id value in self) {
        [result appendFormat:@"%@, ", [value readableDescription]];
    }
    deleteLastTwoCharacters(result);
    
    return [NSString stringWithFormat:@"(%@)", result];
}

@end

