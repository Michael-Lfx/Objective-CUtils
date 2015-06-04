@import Foundation;

extern void deleteLastTwoCharacters(NSMutableString *string);

@interface NSObject (Description)

/**
*  输出对象及其继承的属性值，只支持自定义模型类
*/
- (NSString *)autoDescription;

/**
 *  输出可便于阅读的内容
 */
- (NSString *)readableDescription;

@end
