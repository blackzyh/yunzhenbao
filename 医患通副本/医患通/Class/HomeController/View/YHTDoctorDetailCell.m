//
//  YHTDoctorDetailCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/26.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDoctorDetailCell.h"
#import "YHTDoctorDetailModel.h"

@interface YHTDoctorDetailCell()
{
    UILabel  *_titleLabel;//标题
    UILabel  *_infoLabel;//简介
    UIImageView *_doctorPic;//证书
    UIImageView *_cutLine;//分割线
    UIImageView *_icon;//头像
    UILabel     *_patient;//患者
    UILabel     *_evaluate;//评价
    UILabel     *_time;//时间
}
@end
@implementation YHTDoctorDetailCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath{
    static NSString*ID = @"doctorDetailID";
    YHTDoctorDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTDoctorDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if(indexPath.row<2){
        //创建医生详情界面
            [cell creatUIWithindex1:(NSIndexPath*)indexPath];
        }
        if(indexPath.row == 2){
            [cell creatUIWithindex2:(NSIndexPath*)indexPath];
        }
    }
    return cell;

}
- (void)creatUIWithindex1:(NSIndexPath*)indexPath
{

    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
    _titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
    
    _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 35, YHTScreenW-30, 60)];
    _infoLabel.numberOfLines = 2;
    _infoLabel.textColor = RGBACOLOR(172, 172, 172, 1);
    [self.contentView addSubview:_infoLabel];
        
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 125, YHTScreenW, 15)];
    _cutLine.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    [self.contentView addSubview:_cutLine];
}
- (void)creatUIWithindex2:(NSIndexPath*)indexPath{
       _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        for(int i=0;i<3;i++){
            _doctorPic = [[UIImageView alloc]initWithFrame:CGRectMake(15+(100+20)*i, 50, 100, 100)];
            _doctorPic.image = YHTImage(@"zhengshu.jpg");
            [self.contentView addSubview:_doctorPic];
        }
        _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 165, YHTScreenW, 15)];
        _cutLine.backgroundColor = RGBACOLOR(248, 248, 248, 1);
        [self.contentView addSubview:_cutLine];
}
//- (void)creatUIWithindex3:(NSIndexPath*)indexPath{
//   
//        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
//        _titleLabel.textColor = [UIColor blackColor];
//        [self.contentView addSubview:_titleLabel];
//        
//        for(int i=0;i<4;i++){
//        //头像
//        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 50+103*i, 50, 50)];
//        _icon.image = YHTImage(@"huanzhe.jpg");
//        _icon.layer.cornerRadius = 25;
//        [self.contentView addSubview:_icon];
//        //患者
//        _patient = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+15,55+103*i, 50, 20)];
//        _patient.textColor = [UIColor blackColor];
//        _patient.text = @"患者1:";
//        [self.contentView addSubview:_patient];
//        
//        //评价
//        _evaluate = [[UILabel alloc]initWithFrame:CGRectMake(_icon.maxX+15,55+40+103*i, YHTScreenW-(_icon.maxX+15), 20)];
//        _evaluate.textColor = RGBACOLOR(173, 173, 173, 173);
//        _evaluate.font = YHTFont(12);
//        _evaluate.numberOfLines = 0;
//        _evaluate.text = @"医生态度非常好，医院环境很棒!";
//        _evaluate.height = [_evaluate.text boundingRectWithSize:CGSizeMake(_evaluate.width, MAXFLOAT) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSAttachmentAttributeName:_evaluate.font} context:nil].size.height;
//        [self.contentView addSubview:_evaluate];
//        
//        //时间
//        _time = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-15-80, 105+103*i, 80, 20)];
//        _time.textColor = RGBACOLOR(173, 173, 173, 1);
//        _time.font = YHTFont(12);
//        _time.text = @"2016/01/26";
//        [self.contentView addSubview:_time];
//        //分割线
//        _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15, 140+103*i, YHTScreenW, 0.5)];
//        _cutLine.backgroundColor = RGBACOLOR(173, 173, 173, 1);
//        [self.contentView addSubview:_cutLine];
//        }
//}

- (void)setModel:(YHTDoctorDetailModel *)model
{
    _model = model;
    _titleLabel.text = model.doctorTitle;
    _infoLabel.text = model.doctorInfo;
}
@end
