@import Foundation;


extern void deleteLastTwoCharacters(NSMutableString *string);

/**
 *  输出可便于阅读的内容，用于Debug
 */
@interface NSObject (PrintModelProperty)

/**
 *  输出对象及其继承的属性值，只支持自定义模型类
 *  不支持UIKit中定义的类及其派生类
 */
- (NSString *)autoDescription;

/**
 *  输出可便于阅读的内容
 */
- (NSString *)readableDescription;

@end
