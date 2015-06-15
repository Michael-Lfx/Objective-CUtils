//
//  NSString+Base64.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;

@end
