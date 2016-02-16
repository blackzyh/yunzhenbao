//
//  YHTMedicalCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMedicalCell.h"
#define ICONWH 50
#define MARGIN 15
@interface YHTMedicalCell()
{
    UIImageView *_logoView;//logo
    UILabel   *_medicalLabel;//药品
    UILabel   *_medicalTime;//时间
    UILabel   *_locationLabel;//哪个医院哪个科
    UILabel   *_reasonLabel;
    UIImageView *_cutLine;
}
@end
@implementation YHTMedicalCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"caseID";
    YHTMedicalCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTMedicalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建药箱界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(MARGIN, MARGIN, ICONWH, ICONWH)];
    _logoView.backgroundColor = [UIColor redColor];
    _logoView.layer.cornerRadius = ICONWH/2;
    _logoView.image = YHTImage(@"doctor.jpg");
    [self.contentView addSubview:_logoView];
    
    _locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+MARGIN, MARGIN, 200, 20)];
    _locationLabel.text = @"上海中山医院-呼吸科";
    _locationLabel.textColor = RGBACOLOR(0, 0, 0, 1);
    _locationLabel.font = YHTFont(17);
    [self.contentView addSubview:_locationLabel];
    
    _reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+MARGIN, _locationLabel.maxY, 200, 20)];
    _reasonLabel.text = @"上呼吸道感染";
    _reasonLabel.textColor = RGBACOLOR(139, 139, 139, 1);
    _reasonLabel.font = YHTFont(12);
    [self.contentView addSubview:_reasonLabel];
    
    _medicalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+MARGIN, _reasonLabel.maxY, 200, 20)];
    _medicalLabel.textColor = RGBACOLOR(173, 173, 173, 1);
    _medicalLabel.text = @"阿司匹林：1盒、感冒灵胶囊：1盒、维生素...";
    _medicalLabel.font = YHTFont(12);
    [self.contentView addSubview:_medicalLabel];
    
    _medicalTime = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-60-15, _reasonLabel.maxY, 60, 20)];
    _medicalTime.textAlignment = NSTextAlignmentCenter;
    _medicalTime.textColor = RGBACOLOR(173, 173, 173, 1);
    _medicalTime.text = @"16/01/01";
    _medicalTime.font = YHTFont(12);
    [self.contentView addSubview:_medicalTime];
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_logoView.maxY+15,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];

   
}
@end
