#import "NSObject+PrintModelProperty.h"
#import <objc/runtime.h>


/**
 *  当拓展实现协议时会输出hash、superclass、description、debugDescription等属性
 *  干扰阅读，本函数是删除这些额外的信息
 */
static inline BOOL isAvoidProperty(id obj, NSString *propertyName) {
    NSArray *avoidSelectorNames = @[@"hash", @"superclass", @"description", @"debugDescription"];
    return [avoidSelectorNames containsObject:propertyName];
}

static NSString* makePropertiesAndValuesString(Class cls, id obj) {
    NSMutableString *result = [NSMutableString string];
    
    uint property_count;
    objc_property_t *property_list = class_copyPropertyList(cls, &property_count); // 可获取到拓展实现了协议中的属性
    
    for (int i = 0; i < property_count; i++) {
        objc_property_t property = property_list[i];
        const char *property_name = property_getName(property); // 这里假设不会返回空字符串
        NSString *propertyName = [NSString stringWithCString:property_name encoding:NSASCIIStringEncoding];
        if (isAvoidProperty(obj, propertyName)) {
            continue;
        }
        id value = [obj valueForKey:propertyName];
        [result appendFormat:@"%@ = %@; ", propertyName, [value readableDescription]];
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

@implementation NSObject (PrintModelProperty)

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
