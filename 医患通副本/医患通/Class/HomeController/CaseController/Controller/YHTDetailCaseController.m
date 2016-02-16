//
//  YHTDetailCaseController.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDetailCaseController.h"
#import "YHTDetailCaseView.h"
@interface YHTDetailCaseController ()

@end

@implementation YHTDetailCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"病例详情";
    
    YHTDetailCaseView *detailCaseView = [[YHTDetailCaseView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH-50-64)];
    detailCaseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:detailCaseView];
    
    //仅供参考
    UILabel *reference = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-65, detailCaseView.maxY, 50, 20)];
    reference.text = @"注:仅供参考";
    reference.textColor = RGBACOLOR(0, 195, 219, 1);
    reference.font = YHTFont(9);
    [self.view addSubview:reference];
}

@end
