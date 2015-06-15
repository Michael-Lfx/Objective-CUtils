//
//  NSDate+Week.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSLog(@"从周日开始算，今天是本周的第 %zi 天", [NSDate date].dayOfWeek)
 *  NSLog(@"从周一开始算，今天是本周的第 %zi 天", [NSDate date].dayOfWeekStartWithMonday)
 */
@interface NSDate (Week)

/**
 *  日期所属的星期数，周日为1，周六为7。如 2015年1月1日为5，即周4
 *
 *  @return 日期所属的星期数
 */
- (NSUInteger)dayOfWeek;

/**
 *  日期所属的星期数，周日为1，周六为7。如 2015年1月1日为4，即周4
 *
 *  @return 日期所属的星期数
 */
- (NSUInteger)dayOfWeekStartWithMonday;

@end
