//
//  YHTMedicalController.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMedicalController.h"
#import "YHTMedicalCell.h"
#import "YHTMedicalDetailController.h"
@interface YHTMedicalController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_medicalTable;
}
@end

@implementation YHTMedicalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"药箱";
    //创建药箱视图
    [self creatMedicalTable];
}
#pragma mark -- 创建药箱视图
- (void)creatMedicalTable
{
    _medicalTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH) style:UITableViewStylePlain];
    _medicalTable.delegate = self;
    _medicalTable.dataSource = self;
    _medicalTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _medicalTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_medicalTable];
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMedicalCell *cell = [YHTMedicalCell cellWithTableView:tableView];
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMedicalDetailController *medicalDetailVC = [[YHTMedicalDetailController alloc]init];
    [self.navigationController pushViewController:medicalDetailVC animated:YES];
}
@end
