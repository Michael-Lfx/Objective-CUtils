//
//  NSString+Palindrome.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Palindrome)

/**
 - (BOOL)isPalindrome
 判断字符串是否为回文串。
 
 Example:
 [@"HANNAH" isPalindrome]; // returns YES
 [@"CLAUDE" isPalindrome]; // returns NO
 
 Returns a BOOL corresponding to this NSString's palindrome status.
 */
- (BOOL)isPalindrome;

/**
 + (BOOL)stringIsPalindrome:
 判断字符串是否为回文串。
 
 aString - The NSString to be tested.
 
 Example:
 [NSString stringIsPalindrome:@"RADAR"]; // return YES
 
 Returns a BOOL cooresponding to the NSString palindrome status.
 */
+ (BOOL)stringIsPalindrome:(NSString*)aString;

@end
