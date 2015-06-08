#import "NSObject+PrintModelProperty.h"
#import "NSSet+PrintModelProperty.h"


@implementation NSSet (PrintModelProperty)

- (NSString *)readableDescription {
    return [NSString stringWithFormat:@"{%@}", [[self allObjects] readableDescription]];
}

@end

