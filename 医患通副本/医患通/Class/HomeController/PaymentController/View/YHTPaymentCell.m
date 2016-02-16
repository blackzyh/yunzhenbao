//
//  YHTPaymentCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTPaymentCell.h"

@interface YHTPaymentCell()
{
    UIImageView *_logoView;
    UILabel     *_hospitalLabel;
    UILabel     *_payStateLabel;
    UILabel     *_regMoneyLabel;
    UILabel     *_timeLabel;
    UIButton    *_goPayBtn;
    UIImageView *_cutLine;
}
@end
@implementation YHTPaymentCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"doctorID";
    YHTPaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTPaymentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建订单界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    //医院logo
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
    _logoView.image = YHTImage(@"hospital.jpg");
    [self.contentView addSubview:_logoView];
    
    //医院名字
    _hospitalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, 15, 200, 20)];
    _hospitalLabel.textColor = [UIColor blackColor];
    _hospitalLabel.text = @"上海中山医院";
    [self.contentView addSubview:_hospitalLabel];
    
    //支付状态
    _payStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-10-60, 15, 60, 30)];
    _payStateLabel.font = YHTFont(14);
    _payStateLabel.textColor = RGBACOLOR(0, 195, 219, 1);
    _payStateLabel.textAlignment = NSTextAlignmentCenter;
    _payStateLabel.text = @"未支付";
    [self.contentView addSubview:_payStateLabel];
    
    //挂号费用
    _regMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, _hospitalLabel.maxY+5, 200, 20)];
    _regMoneyLabel.textColor = [UIColor blackColor];
    _regMoneyLabel.font = [UIFont boldSystemFontOfSize:15];
    _regMoneyLabel.text =@"挂号费  ¥20.00";
    [self.contentView addSubview:_regMoneyLabel];
    
    //时间
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, _regMoneyLabel.maxY+5, 200, 20)];
    _timeLabel.font = YHTFont(14);
    _timeLabel.textColor = RGBACOLOR(172, 172, 172, 1);
    _timeLabel.text = @"2015-12-11 10:00";
    [self.contentView addSubview:_timeLabel];
    
    //支付
    _goPayBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-10-60, _timeLabel.y-15, 60, 30)];
    _goPayBtn.titleLabel.font = YHTFont(14);
    [_goPayBtn setTitle:@"去支付" forState:UIControlStateNormal];
    _goPayBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [self.contentView addSubview:_goPayBtn];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,_logoView.maxY+30,YHTScreenW,15)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];

    
}
@end
