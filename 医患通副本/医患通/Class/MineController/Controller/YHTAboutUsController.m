//
//  YHTAboutUsController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTAboutUsController.h"

@interface YHTAboutUsController ()
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel     *versionLabel;
@property (nonatomic,strong)UILabel     *aboutLabel;
@end

@implementation YHTAboutUsController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"关于";
    //图标
    self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _icon.center = CGPointMake(YHTScreenW/2, 100);
    _icon.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_icon];
    
    //版本
    self.versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 20)];
    _versionLabel.center = CGPointMake(YHTScreenW/2, _icon.maxY+20);
    _versionLabel.textAlignment = NSTextAlignmentCenter;
    _versionLabel.textColor = [UIColor blackColor];
    _versionLabel.text = @"就诊宝 V2.0";
    [self.view addSubview:_versionLabel];
    
    //简介
    self.aboutLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _versionLabel.maxY+20, YHTScreenW, 100)];
    _aboutLabel.backgroundColor = [UIColor whiteColor];
    _aboutLabel.textColor = RGBACOLOR(172, 172, 172, 1);
    _aboutLabel.numberOfLines = 0;
    _aboutLabel.font = YHTFont(15);
    _aboutLabel.text = @"       云大夫网络科技(苏州)有限公司是一家充满活力的初创公司，由具有资深医疗行业背景、投资移民背景和著名外企信息企业背景的高管组建，业务重心定位在属于互联网蓝海领域的移动互联网医疗垂直行业模式健康、盈利模式清晰，期待你的加盟。";
    [self.view addSubview:_aboutLabel];
    
    //版权
    UILabel *banquan = [[UILabel alloc]initWithFrame:CGRectMake(50, YHTScreenH-64-50, YHTScreenW-100, 20)];
    banquan.center = CGPointMake(YHTScreenW/2, YHTScreenH-64-50);
    banquan.textColor = [UIColor lightGrayColor];
    banquan.font = YHTFont(14);
    banquan.textAlignment = NSTextAlignmentCenter;
    banquan.text = @"云大夫网络科技苏州有限公司版权所有";
    [self.view addSubview:banquan];
    
    UILabel *copyright = [[UILabel alloc]initWithFrame:CGRectMake(30, YHTScreenH-64-20, YHTScreenW-60, 20)];
    copyright.center = CGPointMake(YHTScreenW/2, YHTScreenH-64-20);
    copyright.textColor = [UIColor lightGrayColor];
    copyright.font = YHTFont(14);
    copyright.textAlignment = NSTextAlignmentCenter;
    copyright.text = @"Copyright@2016 hisforce.cn All rights reserved";
    [self.view addSubview:copyright];
}

@end
