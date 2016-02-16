//
//  YHTRegistController.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTRegistController.h"
#import "YHTTRegisterdCell.h"
#import "YHTDepartmentController.h"
#import "YHTHospitalModel.h"
#import "YHTHospitalInfoController.h"
@interface YHTRegistController ()<UITableViewDataSource,UITableViewDelegate>
{
    //医院列表
    UITableView *_registTable;
    //数据源
    NSMutableArray *_dataArr;
}
@end

@implementation YHTRegistController
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"医院列表";
    
    //创建医院列表
    [self creatRegistTable];
    
    //加载医院列表数据
    [self loadData];
    
}
#pragma mark -- 加载医院列表数据
- (void)loadData
{
    [YHTHttpRequestManager getUrl:@"http://www.hisforce.cn:3001/api/hospitals?from=0&size=10" parameters:nil success:^(id data) {
        NSDictionary *data1 = YHTJsonParserWithData(data);
        NSArray *backData = data1[@"data"];
        NSLog(@"%@",backData);
        for(NSDictionary *dict in backData){
            YHTHospitalModel *model = [[YHTHospitalModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
        }
        [_registTable reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark -- 创建医院列表
- (void)creatRegistTable
{
    _registTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH) style:UITableViewStylePlain];
    _registTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);    _registTable.delegate = self;
    _registTable.dataSource = self;
    _registTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_registTable];
}
#pragma mark -- 代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTTRegisterdCell *cell = [YHTTRegisterdCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _dataArr[indexPath.row];
    return cell;
}
#pragma mark --选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //科室列表
    YHTDepartmentController *DepartmentVC = [[YHTDepartmentController alloc]init];
    DepartmentVC.hospitalID = [_dataArr[indexPath.row] id];
    [self.navigationController pushViewController:DepartmentVC animated:YES];
}
@end
