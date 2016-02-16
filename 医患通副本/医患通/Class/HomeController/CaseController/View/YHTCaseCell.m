//
//  YHTCaseCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTCaseCell.h"
#define ICONWH 50
#define MARGIN 15
@interface YHTCaseCell()
{
    UIImageView *_logoView;
    UILabel   *_hospital;
    UILabel   *_keshi;
    UIButton   *_chuzhen;
    UILabel   *_caseTimeLabel;//时间
    UILabel   *_caseNameLabel;//主治医师
    UILabel   *_mainTalk;//主诉
    UIImageView *_cutLine;
    
}
@end
@implementation YHTCaseCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"caseID";
    YHTCaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTCaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建病历界面
        [cell creatUI];
    }
    return cell;
}
- (void)creatUI
{
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(MARGIN, MARGIN, ICONWH, ICONWH)];
    _logoView.image = YHTImage(@"hospital.jpg");
    [self.contentView addSubview:_logoView];
    
    _hospital = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, 15, 200, 20)];
    _hospital.text = @"昆山同济口腔医院";
    _hospital.textColor = RGBACOLOR(0, 0, 0, 1);
    _hospital.font = YHTFont(17);
    [self.contentView addSubview:_hospital];
    
 
    _keshi = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, _hospital.maxY+5, 100, 20)];
    _keshi.text = @"科室: 呼吸科";
    _keshi.textColor = RGBACOLOR(0, 0, 0, 1);
    _keshi.font = YHTFont(15);
    [self.contentView addSubview:_keshi];
    
    _caseNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_keshi.maxX+20, _hospital.maxY+5, 100, 20)];
    _caseNameLabel.font = YHTFont(15);
    _caseNameLabel.text = @"主诊医师:张三";
    _caseNameLabel.textColor = RGBACOLOR(0, 0, 0, 1);
    [self.contentView addSubview:_caseNameLabel];
//    
//    _rightView = [[UIImageView alloc]initWithFrame:CGRectMake(YHTScreenW-15-8, 33, 8, 14)];
//    _rightView.image = YHTImage(@"home_more_back_btn");
//    [self.contentView addSubview:_rightView];
    _chuzhen = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-32-15, 0, 32, 38)];
    [_chuzhen setBackgroundImage:YHTImage(@"chuzhen-5") forState:UIControlStateNormal];
    [_chuzhen setTitle:@"初诊" forState:UIControlStateNormal];
    _chuzhen.titleLabel.font = YHTFont(12);
    [self.contentView addSubview:_chuzhen];
    
    
    _mainTalk = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.maxX+15, _keshi.maxY+5, 200, 20)];
    _mainTalk.font = YHTFont(15);
    _mainTalk.text = @"主诉:咽喉痛、发烧、头疼症状2天...";
    _mainTalk.textColor = RGBACOLOR(139, 139, 139, 1);
    [self.contentView addSubview:_mainTalk];
    
    _caseTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-80-15, _mainTalk.y, 80, 20)];
    _caseTimeLabel.textColor = RGBACOLOR(139, 139, 139, 1);
    _caseTimeLabel.font = YHTFont(15);
    _caseTimeLabel.text = @"16/01/23";
    [self.contentView addSubview:_caseTimeLabel];
    
    
    
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,99,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
}
@end
