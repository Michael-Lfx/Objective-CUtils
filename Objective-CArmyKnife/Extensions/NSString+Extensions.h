@import UIKit;

@interface NSString (Base64)

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;

@end

@interface NSString (Color)

- (UIColor *)color;

@end

@interface NSString (Regex)

- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement;
- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement caseInsensitive:(BOOL)ignoreCase;
- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement caseInsensitive:(BOOL)ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;
- (NSArray *)stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex;
- (NSArray *)stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex caseInsensitive:(BOOL) ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;
- (BOOL)matchesPatternRegexPattern:(NSString *)regex;
- (BOOL)matchesPatternRegexPattern:(NSString *)regex caseInsensitive:(BOOL)ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;

@end

@interface NSString (AES)

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;
+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

@end

@interface NSString (Bundle)

+ (NSString *)stringFromMainBundleWithFilename:(NSString *)filename;

@end


