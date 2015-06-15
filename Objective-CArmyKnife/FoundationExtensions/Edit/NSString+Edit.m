//
//  NSString+Edit.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "NSString+Edit.h"

#pragma mark - Edit

// 整合自：https://gist.github.com/dsibilly/1038500

#ifndef ELLIPSIS
#define ELLIPSIS @"..."
#endif

@implementation NSString (Edit)

- (NSString *)reverse {
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[self length]];
    
    for (NSUInteger i = ([self length] - 1); i > 0; i -= 1) {
        [reversedString appendString:[NSString stringWithFormat:@"%C", [self characterAtIndex:i]]];
    }
    
    return reversedString;
}

+ (NSString *)stringTruncatedToWidth:(CGFloat)width withString:(NSString *)string andFont:(UIFont *)font {
    return [string truncateToWidth:width withFont:font];
}

- (NSString *)truncateToWidth:(CGFloat)width withFont:(UIFont *)font {
    // Obtain a mutable copy of this NSString.
    NSMutableString *truncatedString = [self mutableCopy];
    
    // If this NSString is longer than the desired width, truncate.
    if ([self sizeWithAttributes:@{NSFontAttributeName: font}].width > width) {
        // Subtract an ellipsis' worth of width from the desired width to obtain the
        // truncation width.
        width -= [ELLIPSIS sizeWithAttributes:@{NSFontAttributeName: font}].width;
        
        // While the string is longer than the truncation width, remove characters
        // from the end of the string.
        NSRange range = {truncatedString.length - 1, 1};
        while ([truncatedString sizeWithAttributes:@{NSFontAttributeName: font}].width > width) {
            [truncatedString deleteCharactersInRange:range];
            range.location -= 1;
        }
        
        // Once truncation is complete, append an ellipsis to the end of the string.
        [truncatedString replaceCharactersInRange:range withString:ELLIPSIS];
    }
    
    return [truncatedString copy];
}

@end