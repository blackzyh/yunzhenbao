//
//  YHTSetCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/28.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSetCell.h"
#import "YHTSetModel.h"
@interface YHTSetCell()
{
    UILabel  *_label;
    UIButton *_detailBtn;
}
@end
@implementation YHTSetCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"setCellID";
    YHTSetCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTSetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建设置界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, YHTScreenW, 20)];
    _label.textColor = [UIColor blackColor];
    [self.contentView addSubview:_label];
    
    _detailBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-22,1, 44, 44)];
    [_detailBtn setImage:YHTImage(@"home_more_back_btn") forState:UIControlStateNormal];
    [self.contentView addSubview:_detailBtn];
    
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,50,YHTScreenW,0.5)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 0.2;
    [self.contentView addSubview:cutLine];
    
}
- (void)setModel:(YHTSetModel *)model
{
    _model = model;
    _label.text = model.title;
}
@end
