//
//  NSData+Calendar.h
//  WMObjCsWorld
//
//  Created by maginawin on 15/6/15.
//  Copyright (c) 2015年 wendong wang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  由514763292提供
 */
@interface NSDate (Calendar)

/**
 * @return 当前日期的年
 */
- (NSInteger)year;

/**
 * @return 当前日期的月
 */
- (NSInteger)month;

/**
 * @return 当前日期的日
 */
- (NSInteger)day;

/**
 * @return 当前月有多少天
 */
- (NSUInteger)numberOfDaysInCurrentMonth;

/**
 * @return 当前月的第一个星期有几天
 */
- (NSInteger)firstWeekDayInMonth;

/**
 * @return 一个月有几周
 */
- (NSUInteger)numberOfWeeksInCurrentMonth;

/**
 * @param date : 对比日期
 * @return 对比日期的上一个月的日期
 */
- (NSDate *)lastMonthDate:(NSDate *)date;

/** 
 * @param date : 对比日期
 * @return 对比日期的下一个月的日期
 */
- (NSDate *)nextMonthDate:(NSDate *)date;

@end
