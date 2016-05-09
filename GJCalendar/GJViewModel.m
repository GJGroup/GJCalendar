//
//  GJViewModel.m
//  GJCalendar
//
//  Created by 吕宝刚 on 16/5/8.
//  Copyright © 2016年 吕宝刚. All rights reserved.
//

#import "GJViewModel.h"
#import "NSDate+Utilities.h"
#import "NSDate+GJCalendar.h"

@implementation GJViewModel


- (NSArray *)createDateData:(NSDate *)date
{
    NSArray *lSubArr1=@[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    
    NSMutableArray *lSubArr2=[NSMutableArray arrayWithCapacity:1];
    
    NSUInteger firstDayWeekly = [[date firstDayOfCurrentMonth] weeklyOrdinality];
    NSInteger daysInMonth = [date numberOfDaysInCurrentMonth];
    
    for (int i=0; i<firstDayWeekly-1; i++) {
        [lSubArr2 addObject:@""];
    }
    
    for (int i=0; i<daysInMonth; i++) {
        
        if (i+1<10) {
            [lSubArr2 addObject:[NSString stringWithFormat:@"0%d",i+1]];
        }else{
            [lSubArr2 addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
    }
    
    return @[lSubArr1,lSubArr2];
}

@end
