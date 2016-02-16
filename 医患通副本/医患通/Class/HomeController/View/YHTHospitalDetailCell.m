//
//  YHTHospitalDetailCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/22.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTHospitalDetailCell.h"
#import "YHTHospitalDetailModel.h"

@interface YHTHospitalDetailCell()
{
   UILabel   *_infoLabel;//标题
   UILabel   *_abstractLabel;//简介
   CGFloat _height;
}
@end

@implementation YHTHospitalDetailCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"hospitalDetailID";
    YHTHospitalDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTHospitalDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建医院详情界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
    _infoLabel.textColor = RGBACOLOR(0, 0, 0, 1);
    _infoLabel.font = YHTFont(17);
    [self.contentView addSubview:_infoLabel];
    
    _abstractLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, _infoLabel.maxY+15, YHTScreenW-30, 100)];
    _abstractLabel.textColor = RGBACOLOR(0, 0, 0, 1);
    _abstractLabel.font = YHTFont(12);
    _abstractLabel.numberOfLines = 0;
    [self.contentView addSubview:_abstractLabel];
    
   
}
- (void)layoutSubviews
{
}
- (void)setModel:(YHTHospitalDetailModel *)model
{
    _model = model;
    _infoLabel.text = model.info;
    _abstractLabel.text = model.abstract;
    _height = [_abstractLabel.text boundingRectWithSize:CGSizeMake(YHTScreenW-30, MAXFLOAT) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSAttachmentAttributeName:_abstractLabel.font} context:nil].size.height;
    _abstractLabel.height = _height;
    model.cellHeight = _height+50;
}
@end
