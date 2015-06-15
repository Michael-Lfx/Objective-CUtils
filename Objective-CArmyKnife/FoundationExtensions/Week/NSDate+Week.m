//
//  NSDate+Week.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/15/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "NSDate+Week.h"

static inline NSUInteger dayOfWeek(NSDate *date) {
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    components = [calendar components:unitFlags
                             fromDate:date];
    NSUInteger weekday = [components weekday];
    return weekday;
}


@implementation NSDate (Week)

- (NSUInteger)dayOfWeek {
    NSUInteger weekday = dayOfWeek(self);
    return weekday;
}

- (NSUInteger)dayOfWeekStartWithMonday {
    NSUInteger weekday = dayOfWeek(self);
    return weekday - 1;
}

@end
