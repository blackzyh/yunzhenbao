//
//  YHTTRegisterdCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTTRegisterdCell.h"
#import "YHTHospitalModel.h"
//上左边距
#define MARGINLU 15
//logo尺寸
#define MLOGOWH  50
//医院名字宽度
#define MHNAMEW 200
//医院名字高度
#define MHNAMEH 20

@interface YHTTRegisterdCell()
{
    //医院logo
    UIImageView *_hospitalLogo;
    //医院名字
    UILabel     *_hospitalName;
    //地理图标
    UIImageView *_locationView;
    //医院地址
    UILabel     *_hospitalLocation;
    //分割线
    UIImageView *_cutLine;

}
@end
@implementation YHTTRegisterdCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"registerdID";
    YHTTRegisterdCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTTRegisterdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建医院界面
        [cell creatUI];
    }
    return cell;
}

- (void)creatUI
{
    _hospitalLogo = [[UIImageView alloc]initWithFrame:CGRectMake(MARGINLU, MARGINLU, MLOGOWH, MLOGOWH)];
    _hospitalLogo.image = YHTImage(@"hos_logo");
    [self.contentView addSubview:_hospitalLogo];
    
    _hospitalName = [[UILabel alloc]initWithFrame:CGRectMake(_hospitalLogo.maxX+MARGINLU, 20, MHNAMEW, MHNAMEH)];
    //_hospitalName.text = @"昆山同济口腔医院";
    _hospitalName.textColor = RGBACOLOR(0, 0, 0, 1);
    _hospitalName.font = YHTFont(17);
    [self.contentView addSubview:_hospitalName];
    
    _locationView = [[UIImageView alloc]initWithFrame:CGRectMake(_hospitalLogo.maxX+15, _hospitalName.maxY+10, 16, 16)];
    _locationView.image = YHTImage(@"location");
    [self.contentView addSubview:_locationView];
    
    _hospitalLocation = [[UILabel alloc]initWithFrame:CGRectMake(_locationView.maxX+10,_locationView.y, MHNAMEW, MHNAMEH)];
    _hospitalLocation.font = YHTFont(14);
    _hospitalLocation.textColor = RGBACOLOR(173, 173, 173, 1);
   // _hospitalLocation.text = @"上海徐汇";
    [self.contentView addSubview:_hospitalLocation];
  
    _cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_hospitalLogo.maxY+15,YHTScreenW-15,0.5)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self.contentView addSubview:_cutLine];
   
}
- (void)setModel:(YHTHospitalModel *)model
{
    _model = model;
    _hospitalName.text = model.name;
    _hospitalLocation.text = model.city;
}
@end
