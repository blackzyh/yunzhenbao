//
//  YHTMineInfoCell.m
//  医患通
//
//  Created by 张耀华 on 16/2/3.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineInfoCell.h"
#import "YHTMineInfoModel.h"
@interface YHTMineInfoCell ()
{
    UILabel  *_titleName;
    UILabel  *_content;
    UIImageView *_iconView;
    UIImageView *_rightView;
    UIImageView *_cutLine;
}
@end
@implementation YHTMineInfoCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"mineInfoCellID";
    YHTMineInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTMineInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建个人信息界面
        [cell creatUI];
    }
    return cell;

}
- (void)creatUI
{
    _titleName = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 80, 20)];
    [self.contentView addSubview:_titleName];
    
    
    _rightView = [[UIImageView alloc]initWithFrame:CGRectMake(YHTScreenW-8-15, 10, 8, 14)];
    _rightView.center = CGPointMake(YHTScreenW-8-15, 60/2);
    _rightView.image = YHTImage(@"home_more_back_btn");
    [self.contentView addSubview:_rightView];
    
    
    _content = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-150-40, 20, 150, 20)];
    _content.textColor = RGBACOLOR(172, 172, 172, 1);
    _content.font = YHTFont(15);
    [self.contentView addSubview:_content];

    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,60,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];

}
- (void)layoutSubviews
{
    CGFloat width = [_content.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:_content.font}context:nil].size.width;
    _content.width = width;
    _content.frame = CGRectMake(YHTScreenW-width-35, 20, width, 20);

}
- (void)setModel:(YHTMineInfoModel *)model
{
    _model = model;
    _titleName.text = model.title;
    _content.text = model.content;
   
}
@end
