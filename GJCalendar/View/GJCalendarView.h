//
//  GJCalendarView.h
//  GJCalendar
//
//  Created by 吕宝刚 on 16/5/6.
//  Copyright © 2016年 吕宝刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GJCalendarViewDelegate <NSObject>

- (void)nextMonthDateOfDate:(NSDate *)date;
- (void)preMonthDateOfDate:(NSDate *)date;

@end

@interface GJCalendarView : UIView

@property(strong, nonatomic)id<GJCalendarViewDelegate> delegate;

@property(strong, nonatomic)NSArray  *dataArr;
@property(strong, nonatomic)NSDate *displayDate;

@end
