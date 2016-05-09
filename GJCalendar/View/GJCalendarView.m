//
//  GJCalendarView.m
//  GJCalendar
//
//  Created by 吕宝刚 on 16/5/6.
//  Copyright © 2016年 吕宝刚. All rights reserved.
//

#import "GJCalendarView.h"
#import "NSDate+GJCalendar.h"
#import "NSDate+Utilities.h"
#import "UIView+Positioning.h"

#import "GJCalendarCollectionViewCell.h"

@interface GJCalendarView()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    CGFloat cellWidth;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation GJCalendarView

- (void)awakeFromNib
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"GJCalendarCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GJCalendarCollectionViewCell"];
    
    cellWidth = (self.collectionView.width-20)/7;
    
    
//    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
//    CGFloat screenH=[UIScreen mainScreen].bounds.size.height;
//    self.x = (screenW-self.width)/2;
//    self.y = (screenH-self.height)/2;
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
}

- (void)setDisplayDate:(NSDate *)date
{
    _displayDate = date;
    NSInteger monthOfToday = date.month;
    NSInteger yearOfToday = date.year;
    
    self.dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",yearOfToday,monthOfToday];
}

- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    [self.collectionView reloadData];

}

- (IBAction)nextBtnPress:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(nextMonthDateOfDate:)]) {
        [self.delegate nextMonthDateOfDate:_displayDate];
    }
}


-(IBAction)preBtnPress:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(preMonthDateOfDate:)]) {
        [self.delegate preMonthDateOfDate:_displayDate];
    }
}

#pragma mark- UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *lArr = self.dataArr[section];
    if (lArr) {
        return [lArr count];
    }
    return 0;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataArr count];
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%@",indexPath);
    static NSString * CellIdentifier = @"GJCalendarCollectionViewCell";
    GJCalendarCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.height = cellWidth;
    cell.width = cellWidth;
    
    NSArray *lArr = self.dataArr[indexPath.section];
    cell.dateLabel.text = lArr[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.dateLabel.textColor = indexPath.section?[UIColor blackColor]:[UIColor redColor];
//    if(indexPath.section==1 && [cell.dateLabel.text intValue]== dayOfToday){
//        cell.dateLabel.textColor = [UIColor redColor];
//    }
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(cellWidth,cellWidth);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
