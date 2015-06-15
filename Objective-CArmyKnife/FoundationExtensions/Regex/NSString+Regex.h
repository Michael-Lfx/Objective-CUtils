//
//  NSString+Regex.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  整合自 https://github.com/carlbrown/RegexOnNSString
 */
@interface NSString (Regex)

- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement;
- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement caseInsensitive:(BOOL)ignoreCase;
- (NSString *)stringByReplacingRegexPattern:(NSString *)regex withString:(NSString *)replacement caseInsensitive:(BOOL)ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;
- (NSArray *)stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex;
- (NSArray *)stringsByExtractingGroupsUsingRegexPattern:(NSString *)regex caseInsensitive:(BOOL) ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;
- (BOOL)matchesPatternRegexPattern:(NSString *)regex;
- (BOOL)matchesPatternRegexPattern:(NSString *)regex caseInsensitive:(BOOL)ignoreCase treatAsOneLine:(BOOL)assumeMultiLine;

@end
