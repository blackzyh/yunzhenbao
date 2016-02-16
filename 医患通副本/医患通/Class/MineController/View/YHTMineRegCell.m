//
//  YHTMineRegCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/23.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineRegCell.h"

#define BTNW 80
#define BTNH 30
@interface YHTMineRegCell ()
{
    UILabel     *_hospitalName;//医院名称
    UIImageView *_cutLine;
    UIImageView *_icon;//头像
    UILabel     *_doctor;
    UILabel     *_keshi;
    UILabel     *_time;
    UILabel     *_orderNumeber;
    UILabel     *_money;
    UIImageView *_cutLine1;
    UIButton    *_change;
    UIButton    *_cancel;
}
@end
@implementation YHTMineRegCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"MineRegcellID";
    YHTMineRegCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTMineRegCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建我的挂号界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _hospitalName = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 200, 20)];
    _hospitalName.textColor = [UIColor blackColor];
    _hospitalName.font = [UIFont boldSystemFontOfSize:17];
    _hospitalName.text = @"昆山同济口腔医院";
    [self.contentView addSubview:_hospitalName];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,_hospitalName.maxY+15,YHTScreenW,0.5)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
    
    _icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, _cutLine.maxY+15, 50, 50)];
    _icon.image = YHTImage(@"doctor.jpg");
    [self.contentView addSubview:_icon];
    
    _doctor = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+15, _icon.y+10, 100, 20)];
    _doctor.text = @"医生: 汤明";
    [self.contentView addSubview:_doctor];
    
    _keshi = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+15, _doctor.maxY+7, 100, 20)];
    _keshi.text = @"科室: 呼吸科";
    [self.contentView addSubview:_keshi];
    
    _time = [[UILabel alloc]initWithFrame:CGRectMake(15, _icon.maxY+15, 300, 20)];
    _time.text = @"门诊时间:   2015/01/01 10:00-10:30";
    [self.contentView addSubview:_time];
    
    _orderNumeber = [[UILabel alloc]initWithFrame:CGRectMake(15, _time.maxY+15, 200, 20)];
    _orderNumeber.text = @"预 约 号:     06号";
    [self.contentView addSubview:_orderNumeber];
    
    _money = [[UILabel alloc]initWithFrame:CGRectMake(15, _orderNumeber.maxY+15, 200, 20)];
    _money.text = @"挂 号 费:     ¥20.00";
    [self.contentView addSubview:_money];
    
    _cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,_money.maxY+15,YHTScreenW,1)];
    _cutLine1.backgroundColor = [UIColor lightGrayColor];
    _cutLine1.alpha = 0.2;
    [self.contentView addSubview:_cutLine1];
    
    _change = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-30-2*BTNW, _cutLine1.maxY+15, BTNW, BTNH)];
    _change.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [_change setTitle:@"变更" forState:UIControlStateNormal];
    [self.contentView addSubview:_change];
    
    _cancel = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-BTNW, _cutLine1.maxY+15, BTNW, BTNH)];
    _cancel.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [_cancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.contentView addSubview:_cancel];
}
@end
