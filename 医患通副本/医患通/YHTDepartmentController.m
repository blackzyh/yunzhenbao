//
//  YHTDepartmentController.m
//  医患通
//
//  Created by 张耀华 on 16/1/15.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDepartmentController.h"
#import "YHTDoctorController.h"
#import "YHTHospitalInfoController.h"

@interface YHTDepartmentController ()
{
    
    NSMutableArray   *_departmentArr;//数据源
}
@end

@implementation YHTDepartmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    _departmentArr = [NSMutableArray arrayWithCapacity:0];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"科室列表";
    //数据
  // _departmentArr = @[@"内科",@"外科",@"儿科",@"呼吸科",@"口腔科",@"骨科",@"眼科"];
    //加载数据
    [self loadData];
}
#pragma mark -- 加载科室列表
- (void)loadData
{
    NSString *url = [NSString stringWithFormat:@"http://www.hisforce.cn:3001/api/hospitals/%@/departments",self.hospitalID];
    [YHTHttpRequestManager getUrl:url parameters:nil success:^(id data) {
        NSDictionary *data1 = YHTJsonParserWithData(data);
        NSLog(@"%@",data1[@"data"]);
        _departmentArr = data1[@"data"];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"科室列表获取错误%@",error);
    }];
}


#pragma mark -- 代理和数据
#pragma mark -- 返回cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _departmentArr.count ;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = _departmentArr[indexPath.row][@"name"];
    cell.textLabel.font = YHTFont(15);
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,44,YHTScreenW-15,1)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 0.2;
    [cell addSubview:cutLine];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
#pragma mark -- 头部视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 45)];
    view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    UILabel *doctorDetail = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
    doctorDetail.font = YHTFont(17);
    doctorDetail.text = @"医院详情";
    doctorDetail.textColor = RGBACOLOR(0, 195, 219, 1);
    [view addSubview:doctorDetail];
    UIButton *detailBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-22,1, 44, 44)];
    [detailBtn setImage:YHTImage(@"home_more_back_btn") forState:UIControlStateNormal];
    [detailBtn addTarget:self action:@selector(hospitalDetailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:detailBtn];
    return view;

}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTDoctorController *doctorVC = [[YHTDoctorController alloc]init];
    doctorVC.departmentID = _departmentArr[indexPath.row][@"id"];
    doctorVC.hospitalID = self.hospitalID;
    [self.navigationController pushViewController:doctorVC animated:YES];
}
#pragma mark -- 点击医院详情
- (void)hospitalDetailBtnClick
{
    YHTHospitalInfoController *hospitalInfoVC = [[YHTHospitalInfoController alloc]init];
    hospitalInfoVC.hospitalID = self.hospitalID;
    [self.navigationController pushViewController:hospitalInfoVC animated:YES];
}

@end
