//
//  YHTDoctorView.h
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHTDoctorView : UIView
/**头像*/
@property (nonatomic,strong)UIImageView *iconView;
/**名字*/
@property (nonatomic,strong)UILabel *name;
/**职位*/
@property (nonatomic,strong)UILabel *job;
/**医院*/
@property (nonatomic,strong)UILabel *hospital;
/**分割线*/
@property (nonatomic,strong)UIImageView *line;
/**科室*/
@property (nonatomic,strong)UILabel *keshi;
/**挂号费*/
@property (nonatomic,strong)UILabel *money;

@end
