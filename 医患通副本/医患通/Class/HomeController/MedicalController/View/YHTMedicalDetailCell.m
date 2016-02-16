//
//  YHTMedicalDetailCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/21.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMedicalDetailCell.h"
#import "YHTMedicalDetailModel.h"
@interface YHTMedicalDetailCell()
{
    UIImageView *_icon;
    UILabel   *_medicalLabel;//药品
    UILabel   *_number;//用量
    UILabel   *_method;//用法
    UILabel   *_dosage;//用量
    UIImageView *_cutLine;
}
@end
@implementation YHTMedicalDetailCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"caseDetailID";
    YHTMedicalDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTMedicalDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建药箱详情界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 50, 50)];
    _icon.image = YHTImage(@"drug");
    [self.contentView addSubview:_icon];
    
    _medicalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+4, 20, 100, 20)];
    _medicalLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_medicalLabel];
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-50-15, 20, 50, 20)];
    _number.font = YHTFont(14);
    _number.textColor = [UIColor blackColor];
    [self.contentView addSubview:_number];
    
    
    
    _method = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+4, _medicalLabel.maxY+10, 100, 20)];
    _method.textColor = [UIColor blackColor];
    _method.font = YHTFont(14);
    [self.contentView addSubview:_method];
    
    _dosage = [[UILabel alloc]initWithFrame:CGRectMake(_method.maxX, _medicalLabel.maxY+10, YHTScreenW-_method.maxY, 20)];
    _dosage.textColor = [UIColor blackColor];
    _dosage.font = YHTFont(14);
    [self.contentView addSubview:_dosage];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_icon.maxY+20,YHTScreenW-15,0.5)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 1;
    [self.contentView addSubview:_cutLine];
    
}
- (void)setModel:(YHTMedicalDetailModel *)model
{
    _model = model;
    _medicalLabel.text = model.name;
    _number.text = model.number;
    _method.text = model.method;
    _dosage.text = model.dosage;
}
@end
