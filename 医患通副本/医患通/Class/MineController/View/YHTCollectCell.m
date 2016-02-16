//
//  YHTCollectCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTCollectCell.h"
#define ICONWH 60
#define MARGIN 20
@interface YHTCollectCell()
{
    //头像
    UIImageView *_doctorIcon;
    //名字
    UILabel     *_nameLabel;
    //职位
    UILabel     *_jobLabel;
    //预约
    UIButton    *_orderBtn;
    //医院
    UILabel     *_hospitalLabel;
    //分割线
    UIImageView *_cutLine;
    //科室
    UILabel     *_keShiLabel;
    //专场
    UILabel     *_specialityLabel;
}
@end
@implementation YHTCollectCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"collectID";
    YHTCollectCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTCollectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建收藏界面
        [cell creatUI];
    }
    return cell;
}

- (void)creatUI
{
    _doctorIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, MARGIN, ICONWH, ICONWH)];
    _doctorIcon.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_doctorIcon];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+5+5, MARGIN, 60, 20)];
    _nameLabel.text = @"李刚";
    _nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_nameLabel];
    
    _jobLabel = [[UILabel alloc]initWithFrame:CGRectMake(_nameLabel.maxX, MARGIN, 100, 20)];
    _jobLabel.text = @"主任医师";
    _jobLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_jobLabel];
    
    _hospitalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+5, _nameLabel.maxY+10, 120, 20)];
    _hospitalLabel.textColor = [UIColor blackColor];
    _hospitalLabel.text = @"上海中山医院";
    [self.contentView addSubview:_hospitalLabel];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(_hospitalLabel.maxX+10, _nameLabel.maxY+10, 3, 20)];
    _cutLine.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_cutLine];
    
    _keShiLabel = [[UILabel alloc]initWithFrame:CGRectMake(_cutLine.maxX+10, _nameLabel.maxY+10, 100, 20)];
    _keShiLabel.textColor = [UIColor blackColor];
    _keShiLabel.text = @"呼吸科";
    [self.contentView addSubview:_keShiLabel];
    
    _specialityLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+5, _hospitalLabel.maxY+5, 200, 20)];
    _specialityLabel.text = @"专长: 上呼吸道感染、肺炎、睡眠呼吸障碍、支气管哮喘...";
    _specialityLabel.numberOfLines = 2;
    _specialityLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_specialityLabel];
    
}
@end