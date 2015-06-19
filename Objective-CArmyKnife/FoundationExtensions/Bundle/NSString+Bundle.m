//
//  NSString+Bundle.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "NSString+Bundle.h"

@implementation NSString (Bundle)

+ (NSString *)stringFromMainBundleWithFilename:(NSString *)filename {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return text;
}

@end
