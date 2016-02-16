//
//  YHTHospitalDetailCell.h
//  医患通
//
//  Created by 张耀华 on 16/1/22.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTHospitalDetailModel;
@interface YHTHospitalDetailCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong)YHTHospitalDetailModel *model;

@end
