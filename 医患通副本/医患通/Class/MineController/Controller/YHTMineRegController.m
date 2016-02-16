//
//  YHTMineRegController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineRegController.h"
#import "YHTMineRegCell.h"
@interface YHTMineRegController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mineRegView;
}
@end

@implementation YHTMineRegController
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
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的挂号";
    //我的挂号界面
    [self creatMineRegView];
}
#pragma mark -- 创建我的挂号界面
- (void)creatMineRegView
{
    _mineRegView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, YHTScreenH-64) style:UITableViewStylePlain];
    _mineRegView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _mineRegView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mineRegView.delegate = self;
    _mineRegView.dataSource = self;
    [self.view addSubview:_mineRegView];
}
#pragma mark -- 代理和数据
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMineRegCell *cell = [YHTMineRegCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

@end
