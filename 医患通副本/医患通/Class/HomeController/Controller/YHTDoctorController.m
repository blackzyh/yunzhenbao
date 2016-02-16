//
//  YHTDoctorController.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDoctorController.h"
#import "YHTDoctorCell.h"
#import "YHTOrderController.h"
#import "YHTKeShiDetailController.h"
#import "YHTDoctorModel.h"
@interface YHTDoctorController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_doctorTable;
    NSMutableArray *_dataArr;
}
@end

@implementation YHTDoctorController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"医生列表";
    
    //医生列表
    [self creatDoctorTable];
    
    //加载数据
    [self loadData];
    
}

#pragma mark -- 加载医生数据
- (void)loadData
{
    NSString *url = [NSString stringWithFormat:@"http://www.hisforce.cn:3001/api/hospitals/%@/departments/%@/doctors",self.hospitalID,self.departmentID];
    [YHTHttpRequestManager getUrl:url parameters:nil success:^(id data) {
        NSDictionary *data1 = YHTJsonParserWithData(data);
        NSLog(@"获取医生数据成功%@",data1[@"data"]);
        for(NSDictionary *dict in data1[@"data"]){
            YHTDoctorModel *model = [[YHTDoctorModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
        }
        [_doctorTable reloadData];
    } fail:^(NSError *error) {
        NSLog(@"获取医生数据失败%@",error);
    }];
}
#pragma mark -- 医生列表
- (void)creatDoctorTable
{
    _doctorTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _doctorTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _doctorTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _doctorTable.delegate = self;
    _doctorTable.dataSource = self;
    [self.view addSubview:_doctorTable];
}

#pragma mark -- 代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTDoctorCell *cell = [YHTDoctorCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _dataArr[indexPath.row];
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTOrderController *orderVC = [[YHTOrderController alloc]init];
    [self.navigationController pushViewController:orderVC animated:YES];
}
#pragma mark -- 头部视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 45)];
    view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    UILabel *keshiDetail = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
    keshiDetail.font = YHTFont(17);
    keshiDetail.text = @"科室详情";
    keshiDetail.textColor = RGBACOLOR(0, 195, 219, 1);
    [view addSubview:keshiDetail];
    UIButton *keshiDetailBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-22,1, 44, 44)];
    [keshiDetailBtn setImage:YHTImage(@"home_more_back_btn") forState:UIControlStateNormal];
    [keshiDetailBtn addTarget:self action:@selector(keshiDetailBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:keshiDetailBtn];
    return view;
    
}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
#pragma mark -- 点击科室详情按钮
- (void)keshiDetailBtnBtnClick
{
    YHTKeShiDetailController *keShiDetailVC = [[YHTKeShiDetailController alloc]init];
    [self.navigationController pushViewController:keShiDetailVC animated:YES];
}
@end
