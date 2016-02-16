//
//  YHTDoctorCell.h
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTDoctorModel;
@interface YHTDoctorCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong)YHTDoctorModel *model;
@end
