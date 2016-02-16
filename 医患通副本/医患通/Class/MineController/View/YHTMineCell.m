//
//  YHTMineCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/22.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineCell.h"
#import "YHTMineModel.h"
@interface YHTMineCell ()
{
    UIImageView *_iconView;//头像
    UILabel     *_titleLabel;//标题
    UIImageView *_cutLine;//分割线
    UIImageView *_rightView;
}
@end
@implementation YHTMineCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"MycellID";
    YHTMineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTMineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建我的界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 25, 25)];
    [self.contentView addSubview:_iconView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_iconView.maxX+15, 18, 100, 20)];
    [self.contentView addSubview:_titleLabel];
    
    _rightView = [[UIImageView alloc]initWithFrame:CGRectMake(YHTScreenW-15-8, 33, 8, 14)];
    _rightView.center = CGPointMake(YHTScreenW-15-8, 55/2);
    _rightView.image = YHTImage(@"home_more_back_btn");
    [self.contentView addSubview:_rightView];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_iconView.maxY+15,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
}
- (void)setModel:(YHTMineModel *)model
{
    _model = model;
    _iconView.image = YHTImage(model.icon);
    _titleLabel.text = model.title;
}
@end
