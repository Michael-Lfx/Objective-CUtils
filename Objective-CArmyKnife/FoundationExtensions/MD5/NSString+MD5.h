//
//  NSString+MD5.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 - (NSString *)MD5Hash
 Generates an MD5 cryptographic hash of this NSString's contents
 
 Example:
 NSString *hash = [@"The quick brown fox jumped over the lazy dog" MD5Hash];
 
 Returns an NSString containing the hexidecimal representation of the MD5 hash.
 */
- (NSString *)MD5Hash;

@end
