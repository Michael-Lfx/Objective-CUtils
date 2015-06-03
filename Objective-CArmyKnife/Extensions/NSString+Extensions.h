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


@interface NSString (MD5)

/**
 - (NSString*)MD5Hash
 Generates an MD5 cryptographic hash of this NSString's contents
 
 Example:
 NSString *hash = [@"The quick brown fox jumped over the lazy dog" MD5Hash];
 
 Returns an NSString containing the hexidecimal representation of the MD5 hash.
 */
- (NSString*)MD5Hash;

@end


@interface NSString (Edit)

/**
 -(NSString*)reverse
 Reverses the contents of this NSString.
 
 Example:
 NSString *testString = @"stressed";
 NSString *testReversed = [testString reverse]; // @"desserts"
 
 Returns an NSString with the original NSString's contents reversed
 */
- (NSString*)reverse;

@end
