//
//  YHTSystemController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSystemController.h"
#import "YHTSystemNotiCell.h"
@interface YHTSystemController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_systemTableView;
}
@end

@implementation YHTSystemController
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
    self.title = @"系统消息";
    //系统消息界面
    [self creatSystemTableView];
}
#pragma mark -- 系统消息界面
- (void)creatSystemTableView
{
    _systemTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH) style:UITableViewStylePlain];
    _systemTableView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _systemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _systemTableView.delegate = self;
    _systemTableView.dataSource = self;
    [self.view addSubview:_systemTableView];
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTSystemNotiCell *cell = [YHTSystemNotiCell cellWithTableView:tableView];
    return cell;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
