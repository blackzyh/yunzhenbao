//
//  YHTHospitalImgCell.m
//  医患通
//
//  Created by 张耀华 on 16/1/22.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTHospitalImgCell.h"

@implementation YHTHospitalImgCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString*ID = @"hospitalimglID";
    YHTHospitalImgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHTHospitalImgCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //创建图片界面
        [cell creatUI];
        
    }
    return cell;
}
- (void)creatUI
{
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
    infoLabel.textColor = RGBACOLOR(0, 0, 0, 1);
    infoLabel.font = YHTFont(17);
    infoLabel.text = @"图片展示";
    [self.contentView addSubview:infoLabel];
    for(int i=0;i<2;i++){
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 45+165*i, YHTScreenW-30, 150)];
        imgView.image = YHTImage(@"yiyuan.jpg");
        [self.contentView addSubview:imgView];
    }

}
@end
