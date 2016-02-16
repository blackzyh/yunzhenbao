//
//  YHTDoctorView.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDoctorView.h"

@implementation YHTDoctorView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI
{
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
    _iconView.backgroundColor = [UIColor redColor];
    [self addSubview:_iconView];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(_iconView.maxX+20, 20, 50, 20)];
    _name.text = @"汤明";
    _name.textColor = [UIColor blackColor];
    [self addSubview:_name];
    
    self.job = [[UILabel alloc]initWithFrame:CGRectMake(_name.maxX+10, 20, 100, 20)];
    _job.text = @"主任医师";
    _job.textColor = [UIColor blackColor];
    [self addSubview:_job];
    
    self.hospital = [[UILabel alloc]initWithFrame:CGRectMake(_iconView.maxX+20, _name.maxY+10, 100, 20)];
    _hospital.text = @"中山医院";
    _hospital.textColor = [UIColor blackColor];
    [self addSubview:_hospital];
    
    self.line = [[UIImageView alloc]initWithFrame:CGRectMake(_hospital.maxX, _name.maxY+10, 3, 20)];
    _line.backgroundColor = [UIColor yellowColor];
    [self addSubview:_line];
    
    self.keshi = [[UILabel alloc]initWithFrame:CGRectMake(_line.maxX+10, _name.maxY+10, 100, 20)];
    _keshi.text = @"呼吸科";
    _keshi.textColor = [UIColor blackColor];
    [self addSubview:_keshi];
    
    self.money = [[UILabel alloc]initWithFrame:CGRectMake(_iconView.maxX+20, _hospital.maxY+10, 200, 20)];
    _money.text = @"挂号费: ¥20.00";
    _money.textColor = [UIColor blackColor];
    [self addSubview:_money];
}
@end
