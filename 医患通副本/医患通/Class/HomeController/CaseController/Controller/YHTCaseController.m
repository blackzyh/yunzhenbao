//
//  YHTCaseController.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTCaseController.h"
#import "YHTCaseCell.h"
#import "YHTDetailCaseController.h"
@interface YHTCaseController ()<UITableViewDataSource,UITableViewDelegate>
{
    //病历视图
    UITableView  *_caseTableView;
}
@end

@implementation YHTCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"病历";
    
    //病历视图
    [self creatCaseView];
}
#pragma mark -- 病历视图
- (void)creatCaseView
{
    _caseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH) style:UITableViewStylePlain];
    _caseTableView.backgroundColor = RGBACOLOR(248, 284, 248, 1);
    _caseTableView.separatorColor = UITableViewCellSeparatorStyleNone;
    _caseTableView.delegate = self;
    _caseTableView.dataSource = self;
    [self.view addSubview:_caseTableView];
}
#pragma mark --  cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTCaseCell *cell = [YHTCaseCell cellWithTableView:tableView];
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTDetailCaseController *detailCaseVC = [[YHTDetailCaseController alloc]init];
    [self.navigationController pushViewController:detailCaseVC animated:YES];
}

@end
