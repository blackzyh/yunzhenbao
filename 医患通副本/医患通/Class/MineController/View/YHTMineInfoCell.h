//
//  YHTMineInfoCell.h
//  医患通
//
//  Created by 张耀华 on 16/2/3.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHTMineInfoModel;
@interface YHTMineInfoCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic ,strong)YHTMineInfoModel *model;
@end
