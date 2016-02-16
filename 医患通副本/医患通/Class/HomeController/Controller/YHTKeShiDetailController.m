//
//  YHTKeShiDetailController.m
//  医患通
//
//  Created by 张耀华 on 16/1/21.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTKeShiDetailController.h"

@implementation YHTKeShiDetailController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"科室详情";
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);

    //背景视图
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, 250)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *keshiDetail = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, 200, 15)];
    keshiDetail.text = @"科室详情:";
    keshiDetail.textColor = RGBACOLOR(0, 0, 0, 1);
    keshiDetail.font = YHTFont(17);
    [self.view addSubview:keshiDetail];
    
    //科室详情
    UILabel *keshiInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 60, 0, 0)];
    keshiInfoLabel.textColor = RGBACOLOR(173, 173, 173, 1);
    keshiInfoLabel.font = YHTFont(14);
    keshiInfoLabel.text = @"儿科自建立至今已有20余年的历史，1989年从饶平路搬迁至医院一期大楼，从仅有一个病区、10几张病床，发展至二期两个病区、68张病床，到2010年10月搬迁至一期新址，有普儿病区、新生儿病区、儿科门诊、儿科急诊四个部分，共计134张病床，集医疗、教学和科研为一体，正在快速发展中。是广东省儿科专科医师培训基地、医学院儿科硕士点、博士点，儿科学2008年被评为医学院院级精品课程、2009年被评为省级精品课程。儿科年门急诊量共20000人次，住院病人3000例。";
    keshiInfoLabel.numberOfLines = 0;
    
    CGFloat height = [keshiInfoLabel.text boundingRectWithSize:CGSizeMake(YHTScreenW-30, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:keshiInfoLabel.font}context:nil].size.height;
    
    keshiInfoLabel.frame = CGRectMake(15, 60, YHTScreenW-30, height);
    [self.view addSubview:keshiInfoLabel];
    
    

}
@end
