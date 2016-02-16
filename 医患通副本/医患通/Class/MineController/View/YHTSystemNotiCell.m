//
//  YHTSystemNotiCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSystemNotiCell.h"

@interface YHTSystemNotiCell()
{
    UIImageView  *_iconView;
    UILabel      *_notiLabel;
    UILabel      *_detailNoti;
    UILabel      *_timeLabel;
    UIImageView  *_cutLine;
}
@end
@implementation YHTSystemNotiCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"orderID";
    YHTSystemNotiCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTSystemNotiCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _iconView = [[UIImageView  alloc]initWithFrame:CGRectMake(15, 15, 30, 30)];
    _iconView.image = YHTImage(@"home_system_message");
    [self.contentView addSubview:_iconView];
    
    _notiLabel = [[UILabel alloc]initWithFrame:CGRectMake(_iconView.maxX+15, 15, 80, 20)];
    _notiLabel.textColor = [UIColor blackColor];
    _notiLabel.text = @"[支付提醒]";
    [self.contentView addSubview:_notiLabel];
    
    _detailNoti = [[UILabel alloc]initWithFrame:CGRectMake(_notiLabel.maxX, 15, YHTScreenW-_notiLabel.maxX, 20)];
    _detailNoti.textColor = RGBACOLOR(173, 173, 173, 1);
    _detailNoti.text = @"您有一笔订单待支付";
    [self.contentView addSubview:_detailNoti];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-150-15, 40, 150, 20)];
    _timeLabel.font = YHTFont(14);
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.textColor = RGBACOLOR(173, 173, 173, 1);
    _timeLabel.text = @"2015-12-13 10:00";
    [self.contentView addSubview:_timeLabel];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,69,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
    
}


@end
