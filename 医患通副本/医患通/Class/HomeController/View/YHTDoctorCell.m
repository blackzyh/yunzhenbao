//
//  YHTDoctorCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDoctorCell.h"
#import "YHTDoctorModel.h"
#define ICONWH 50
#define MARGIN 15
@interface YHTDoctorCell()
{
    //头像
    UIImageView *_doctorIcon;
    //名字
    UILabel     *_nameLabel;
    //预约
    UIButton     *_orderBtn;
    //医院
    UILabel     *_hospitalLabel;
    //科室
    UILabel     *_keShiLabel;
    //专长
    UILabel     *_specialityLabel;
    //分割线
    UIImageView *_cutLine;
    
    UIImageView *_line;
    
}
@end
@implementation YHTDoctorCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"doctorID";
    YHTDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTDoctorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建医院界面
        [cell creatUI];
    }
    return cell;
}

- (void)creatUI
{
    _doctorIcon = [[UIImageView alloc]initWithFrame:CGRectMake(MARGIN, MARGIN, ICONWH, ICONWH)];
    _doctorIcon.backgroundColor = [UIColor redColor];
    _doctorIcon.layer.cornerRadius = ICONWH/2;
    _doctorIcon.image = YHTImage(@"doctor.jpg");
    [self.contentView addSubview:_doctorIcon];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+MARGIN, MARGIN, 60, 20)];
    _nameLabel.font = YHTFont(17);
    //_nameLabel.text = @"李刚";
    _nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_nameLabel];
    
    _orderBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-50-MARGIN, MARGIN, 50, 24)];
    [_orderBtn setBackgroundImage:YHTImage(@"yuyue(1)") forState:UIControlStateNormal];
    [_orderBtn setTitle:@"预约" forState:UIControlStateNormal];
    [_orderBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _orderBtn.titleLabel.font = YHTFont(14);
    [self.contentView addSubview:_orderBtn];
    
    _hospitalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+MARGIN, _nameLabel.maxY+5, YHTScreenW, 20)];
    _hospitalLabel.font = YHTFont(14);
    _hospitalLabel.textColor = RGBACOLOR(84, 84, 84, 1);
    //_hospitalLabel.text = @"上海中山医院";
    
    [self.contentView addSubview:_hospitalLabel];

     //竖线
    _line = [[UIImageView alloc]init];
    _line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_line];
    
    //科室
    _keShiLabel = [[UILabel alloc]init];
    _keShiLabel.textColor = RGBACOLOR(173, 173, 173, 1);
    _keShiLabel.font = YHTFont(14);
    //_keShiLabel.text = @"呼吸科";
    [self.contentView addSubview:_keShiLabel];
    
    _specialityLabel = [[UILabel alloc]initWithFrame:CGRectMake(_doctorIcon.maxX+15, _hospitalLabel.maxY+5, 200, 20)];
   // _specialityLabel.text = @"上呼吸道感染、肺炎、睡眠呼吸障碍、支气管哮喘...";
    _specialityLabel.numberOfLines = 2;
    _specialityLabel.font = YHTFont(12);
    _specialityLabel.textColor = RGBACOLOR(173, 173, 173, 1);
    [self.contentView addSubview:_specialityLabel];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_doctorIcon.maxY+25,YHTScreenW-15,0.5)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
    
}
- (void)layoutSubviews
{
    CGFloat width = [_hospitalLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:_hospitalLabel.font}context:nil].size.width;
    _hospitalLabel.width = width;
    
    _line.frame = CGRectMake(_hospitalLabel.maxX+5, _hospitalLabel.y+5, 1, 15);
    
    _keShiLabel.frame = CGRectMake(_line.maxX+5, _hospitalLabel.y+6, 100, 10);
}
- (void)setModel:(YHTDoctorModel *)model
{
    _model = model;
    _nameLabel.text = model.name;
    _hospitalLabel.text = model.hospitalName;
    _keShiLabel.text = model.departmentName;
    _specialityLabel.text = model.speciality;
    
    
}
@end
