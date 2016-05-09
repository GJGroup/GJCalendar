//
//  NSDate+GJCalendar.m
//  GoldenCreditease
//
//  Created by 吕宝刚 on 16/5/5.
//  Copyright © 2016年 二亮子. All rights reserved.
//

#import "NSDate+GJCalendar.h"

@implementation NSDate(GJCalendar)

/**
 当前月含有多少天
 */
- (NSUInteger)numberOfDaysInCurrentMonth
{
    //
//    NSUInteger n=[[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
//    NSLog(@"%ld",n);
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}
/**
 获取当月的第一天的日期
 */
- (NSDate *)firstDayOfCurrentMonth
{
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:self];
    
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}

/**
 获取日期是星期几
 星期日到星期六依次返回 1-－－7
 */
- (NSUInteger)weeklyOrdinality
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}

/**
 返回当前月含有几周
 */
- (NSUInteger)numberOfWeeksInCurrentMonth
{
    NSUInteger weekday = [[self firstDayOfCurrentMonth] weeklyOrdinality];
    
    NSUInteger days = [self numberOfDaysInCurrentMonth];
    NSUInteger weeks = 0;
    
    if (weekday > 1) {
        weeks += 1, days -= (7 - weekday + 1);
    }
    
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    
    return weeks;
}

@end
