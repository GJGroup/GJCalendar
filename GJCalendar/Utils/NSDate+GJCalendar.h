//
//  NSDate+GJCalendar.h
//  GoldenCreditease
//
//  Created by 吕宝刚 on 16/5/5.
//  Copyright © 2016年 二亮子. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface NSDate_GJCalendar : NSDate
@interface NSDate (GJCalendar)

/**
 当前月含有多少天
 */
- (NSUInteger)numberOfDaysInCurrentMonth;

/**
 返回当前月含有几周
 */
- (NSUInteger)numberOfWeeksInCurrentMonth;

/**
 获取当月的第一天的日期
 */
- (NSDate *)firstDayOfCurrentMonth;

/**
 获取日期是星期几
 */
- (NSUInteger)weeklyOrdinality;

@end
