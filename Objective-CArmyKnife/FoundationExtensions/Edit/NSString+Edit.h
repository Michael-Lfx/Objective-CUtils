//
//  NSString+Edit.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

@import UIKit;

@interface NSString (Edit)

/**
 -(NSString*)reverse
 Reverses the contents of this NSString.
 
 Example:
 NSString *testString = @"stressed";
 NSString *testReversed = [testString reverse]; // @"desserts"
 
 Returns an NSString with the original NSString's contents reversed
 */
- (NSString *)reverse;

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
+ (NSString *)stringTruncatedToWidth:(CGFloat)width
                         withString:(NSString *)string
                            andFont:(UIFont *)font;

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
- (NSString *)truncateToWidth:(CGFloat)width withFont:(UIFont *)font;

@end
