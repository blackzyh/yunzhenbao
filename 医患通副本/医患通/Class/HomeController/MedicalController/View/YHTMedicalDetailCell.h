//
//  YHTMedicalDetailCell.h
//  医患通
//
//  Created by 张耀华 on 16/1/21.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTMedicalDetailModel;
@interface YHTMedicalDetailCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic ,strong)YHTMedicalDetailModel *model;
@end
