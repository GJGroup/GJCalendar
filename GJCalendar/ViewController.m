//
//  ViewController.m
//  GJCalendar
//
//  Created by 吕宝刚 on 16/5/6.
//  Copyright © 2016年 吕宝刚. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+GJCalendar.h"
#import "NSDate+Utilities.h"

#import "GJCalendarView.h"
#import "UIView+Positioning.h"
#import "GJViewModel.h"

@interface ViewController ()<GJCalendarViewDelegate>

@property(strong, nonatomic)GJCalendarView *calendarView;
@property(strong, nonatomic)GJViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calendarView = [[NSBundle mainBundle]loadNibNamed:@"GJCalendarView" owner:self options:nil][0];
    _calendarView.center = self.view.center;
    [self.view addSubview:_calendarView];
    _calendarView.delegate = self;
    
    
    _viewModel = [[GJViewModel alloc]init];
    NSDate *lDate =[NSDate new];
    _calendarView.displayDate = lDate;
    _calendarView.dataArr = [_viewModel createDateData:lDate];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- GJCalendarViewDelegate <NSObject>

- (void)nextMonthDateOfDate:(NSDate *)date
{
    NSDate *lDate = [date dateByAddingMonths:1];
    
    _calendarView.displayDate = lDate;
    _calendarView.dataArr = [_viewModel createDateData:lDate];
    
}

- (void)preMonthDateOfDate:(NSDate *)date
{
    NSDate *lDate = [date dateByAddingMonths:-1];
    
    _calendarView.displayDate = lDate;
    _calendarView.dataArr = [_viewModel createDateData:lDate];
    
}

@end
