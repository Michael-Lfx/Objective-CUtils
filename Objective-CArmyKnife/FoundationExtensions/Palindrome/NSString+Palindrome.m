//
//  NSString+Palindrome.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "NSString+Palindrome.h"

// 整合自：https://gist.github.com/dsibilly/1038500

@implementation NSString (Palindrome)

- (BOOL)isPalindrome {
    return [NSString stringIsPalindrome:self];
}

+ (BOOL)stringIsPalindrome:(NSString *)aString position:(NSInteger)position {
    NSString *_string = [NSString stringWithString:aString];
    NSInteger _position = position;
    
    if (!_string) {
        return NO;
    }
    
    NSInteger stringLength = [_string length];
    NSString *firstChar = [[_string substringToIndex:_position] substringToIndex:1];
    NSString *lastChar = [[_string substringToIndex:(stringLength - 1 - _position)] substringToIndex:1];
    
    if (_position > (stringLength / 2)) {
        return YES;
    }
    
    if (! [firstChar isEqualToString:lastChar]) {
        return NO;
    }
    
    return [NSString stringIsPalindrome:_string position:(_position + 1)];
}

+ (BOOL)stringIsPalindrome:(NSString *)aString {
    return [NSString stringIsPalindrome:aString position:0];
}

@end
