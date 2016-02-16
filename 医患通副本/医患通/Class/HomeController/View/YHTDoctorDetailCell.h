//
//  YHTDoctorDetailCell.h
//  医患通
//
//  Created by 张耀华 on 16/1/26.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTDoctorDetailModel;
@interface YHTDoctorDetailCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath;
@property (nonatomic,strong)YHTDoctorDetailModel *model;
@end
