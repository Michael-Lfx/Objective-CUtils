#import "NSObject+Extensions.h"


#pragma mark - 运行时实现打印属性及其值

#import <objc/runtime.h>

@implementation NSObject (Description)

- (NSString *)enumeratePropertiesAndValues:(Class)cls {
    NSMutableString * result = [NSMutableString string];
    
    Class superClass  = class_getSuperclass(cls);
    if (superClass != nil && ![superClass isEqual:[NSObject class]]) {
        [result appendString:[self enumeratePropertiesAndValues:superClass]];
    }
    
    uint property_count;
    objc_property_t * property_list = class_copyPropertyList(cls, &property_count);
    
    for (int i = property_count - 1; i >= 0; --i) { // Reverse order, to get Properties in order they were defined
        objc_property_t property = property_list[i];
        
        const char * property_name = property_getName(property);
        NSString * propertyName = [NSString stringWithCString:property_name encoding:NSASCIIStringEncoding];
        if (propertyName) {
            id value = [self valueForKey:propertyName];
            [result appendFormat:@"%@ = %@; ", propertyName, value];
        }
    }
    free(property_list);
    
    if (result.length > 0) {
        [result deleteCharactersInRange:NSMakeRange(result.length - 2, 2)];
    }
    
    return result;
}

- (NSString *)autoDescription {
    Class currentClass = [self class];
    return [NSString stringWithFormat:@"<%@: %p> { %@ }", NSStringFromClass(currentClass), self, [self enumeratePropertiesAndValues:currentClass]];
}

@end
