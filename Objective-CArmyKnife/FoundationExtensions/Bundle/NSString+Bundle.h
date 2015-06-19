//
//  NSString+Bundle.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Bundle)

/**
 *  读取Main Bundle中的文本文件内容
 
 使用示例：
 
 NSString *contentOfSomeText = [NSString stringFromMainBundleWithFilename:@"readme.txt"];
 
 *
 *  @param filename 文件名
 *
 *  @return 文件内容
 */
+ (NSString *)stringFromMainBundleWithFilename:(NSString *)filename;

@end
