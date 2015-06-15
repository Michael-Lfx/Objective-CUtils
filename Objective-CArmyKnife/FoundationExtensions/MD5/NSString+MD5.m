//
//  NSString+MD5.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "NSString+MD5.h"

// 整合自：https://gist.github.com/dsibilly/1038500

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

- (NSString*)MD5Hash {
    // Create a C-style pointer to the UT8-encoded contents of the NSString
    const char *pointer = [self UTF8String];
    
    // Create a buffer array big enough to hold the digest
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16-byte MD5 hash value, store in buffer
    // See: CC_MD5(3cc) manpage on OS X & iOS.
    CC_MD5(pointer, (CC_LONG)strlen(pointer), buffer);
    
    // Convert MD5 digest in buffer to an autoreleased NSString of hexidecimal
    // values.
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i += 1) {
        [result appendFormat:@"%02x", buffer[i]];
    }
    
    return [result copy];
}

@end
