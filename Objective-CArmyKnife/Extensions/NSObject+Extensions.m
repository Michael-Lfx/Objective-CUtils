#import "NSObject+Extensions.h"


#pragma mark - 运行时实现打印属性及其值

#import <objc/runtime.h>

static NSString* makePropertiesAndValuesString(Class cls, id obj) {
    NSMutableString *result = [NSMutableString string];
    
    uint property_count;
    objc_property_t *property_list = class_copyPropertyList(cls, &property_count);
    for (int i = 0; i < property_count; i++) {
        objc_property_t property = property_list[i];
        const char *property_name = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:property_name encoding:NSASCIIStringEncoding];
        if (propertyName) {
            id value = [obj valueForKey:propertyName];
            [result appendFormat:@"%@ = %@; ", propertyName, [value readableDescription]];
        }
    }
    
    if (property_list)  free(property_list);
    
    return result;
}

inline void deleteLastTwoCharacters(NSMutableString *string) {
    NSUInteger length = [string length];
    if (length > 2) {
        [string deleteCharactersInRange:NSMakeRange(length - 2, 2)];
    }
}

@implementation NSObject (Description)

/**
 *  采用非递归实现。尝试了支持所有类，在处理UIKit时遇到取出的属性要么不存在，要么不支持KVC，故放弃。
 *
 *  @return 对象本身定义的属性及其继承的属性与值组成的字符串，如：p1 = v1; p2 = v2
 */
- (NSString *)enumeratePropertiesAndValues {
    @autoreleasepool {
        NSMutableString *result = [NSMutableString string];
        
        Class cls = self.class;
        while (cls != nil && ![cls isEqual:NSObject.class]) {
            [result appendString:makePropertiesAndValuesString(cls, self)];
            cls = class_getSuperclass(cls);
        }
        deleteLastTwoCharacters(result);
        return [result copy];
    }
}

- (NSString *)autoDescription {
    return [NSString stringWithFormat:@"<%@: %p; %@>", NSStringFromClass(self.class), self, [self enumeratePropertiesAndValues]];
}

- (NSString *)readableDescription {
    return [self description];
}

@end
