//
//  YHTOrderCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTOrderCell.h"
#define KLEFT 30
#define KTOP 10
#define KCANYETW 50
@interface YHTOrderCell()
{
    /** 日期*/
    UILabel   *_dateLabel;
    /** 星期*/
    UILabel   *_weekLabel;
    /** 可约*/
    UILabel   *_canLabel;
    /** 已约*/
    UILabel   *_yetLabel;
}
@end
@implementation YHTOrderCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"orderID";
    YHTOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(KLEFT, KTOP, 100, 20)];
    _dateLabel.textColor = [UIColor blackColor];
    _dateLabel.font = YHTFont(13);
    _dateLabel.text = @"2016-01-01";
    [self.contentView addSubview:_dateLabel];
    
    _weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(_dateLabel.maxX+10, KTOP, 60, 20)];
    _weekLabel.textColor = [UIColor blackColor];
    _weekLabel.font = YHTFont(13);
    _weekLabel.text = @"星期一";
    [self.contentView addSubview:_weekLabel];
    
    _canLabel = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-2*KCANYETW-KTOP-KLEFT, KTOP, KCANYETW, 20)];
    _canLabel.textColor = [UIColor blackColor];
    _canLabel.font = YHTFont(13);
    _canLabel.text = @"可约:6";
    [self.contentView addSubview:_canLabel];
    
    _yetLabel = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-KLEFT-KCANYETW, KTOP, KCANYETW, 20)];
    _yetLabel.textColor = [UIColor blackColor];
    _yetLabel.font = YHTFont(13);
    _yetLabel.text = @"已约:12";
    [self.contentView addSubview:_yetLabel];
    
}
@end
