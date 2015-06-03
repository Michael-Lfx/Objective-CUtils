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

//+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;
//+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

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

/**
 + (NSString*)stringTruncatedToWidth:withString:andFont:
 Generates a truncated copy of the given NSString, truncated to the desired
 width for the given typeface and size.
 
 width  - A CGFloat representing the desired width of the truncated NSString.
 string - An NSString object with the content to be truncated.
 font   - A UIFont object representing the desired typeface and font size.
 
 Example:
 NSString *message   = @"Can you hear this long-winded message?";
 UIFont *messageFont = [UIFont fontWithName:@"Marker Felt" size:32];
 NSString *output = [NSString stringTruncatedToWidth:48.0f
 withString:message
 andFont:messageFont];
 
 Returns an NSString containing the truncated string, followed by an ellipsis.
 */
+ (NSString*)stringTruncatedToWidth:(CGFloat)width
                         withString:(NSString*)string
                            andFont:(UIFont*)font;

/**
 - (NSString*)truncateToWidth:withFont:
 返回适应给定字体及其大小的删减后的字符串。Generates an NSString truncated to the indicated width
 for a given a typeface and size.
 
 width - A CGFloat representing the desired width of the truncated NSString.
 font  - A UIFont object representing the desired typeface and font size.
 
 Example:
 NSString *testString = @"This string is too damn long!"
 [testString truncateToWidth:64.0f
 withFont:[UIFont fontWithName:@"Helvetica"
 size:28]];
 
 Returns an NSString containing the truncated string, followed by an ellipsis.
 */
- (NSString*)truncateToWidth:(CGFloat)width withFont:(UIFont*)font;

@end


@interface NSString (Palindrome)

/**
 - (BOOL)isPalindrome
 判断字符串是否为回文串。Determines whether this string is a palindrome.
 
 Example:
 [@"HANNAH" isPalindrome]; // returns YES
 [@"CLAUDE" isPalindrome]; // returns NO
 
 Returns a BOOL corresponding to this NSString's palindrome status.
 */
- (BOOL)isPalindrome;

/**
 + (BOOL)stringIsPalindrome:
 判断字符串是否为回文串。Deterines if a provided NSString is a palindrome.
 
 aString - The NSString to be tested.
 
 Example:
 [NSString stringIsPalindrome:@"RADAR"]; // return YES
 
 Returns a BOOL cooresponding to the NSString palindrome status.
 */
+ (BOOL)stringIsPalindrome:(NSString*)aString;

@end
