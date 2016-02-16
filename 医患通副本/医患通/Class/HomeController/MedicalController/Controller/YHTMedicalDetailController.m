//
//  YHTMedicalDetailController.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMedicalDetailController.h"
#import "YHTMedicalDetailCell.h"
#import "YHTMedicalDetailModel.h"
#import "YHTNotiController.h"
@interface YHTMedicalDetailController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_medicalDetailTabView;
    NSMutableArray *_dataArr;
}
@end

@implementation YHTMedicalDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    self.view.backgroundColor = RGBACOLOR(248, 248,248, 1);
    self.title = @"药箱";
    //提醒按钮
    UIButton *rightNavBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightNavBtn setBackgroundImage:YHTImage(@"nav_setting_btn") forState:UIControlStateNormal];
   [rightNavBtn addTarget:self action:@selector(notiClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightNavBtn];
    
    //数据源
    [self creatData];
    
    //药箱详情界面
    [self creatMedicalDetaliView];
}
#pragma mark -- 数据源
- (void)creatData
{
    NSArray *dataArr = @[@{@"name":@"阿司匹林",@"number":@"x2盒",@"method":@"用法: 口服",@"dosage":@"用量:一日3次,一次3片"},@{@"name":@"布洛芬",@"number":@"x3盒",@"method":@"用法: 口服",@"dosage":@"用量:一日3次,一次3片"},@{@"name":@"复合维生素C",@"number":@"x2盒",@"method":@"用法: 口服",@"dosage":@"用量:一日3次,一次3片"}];
    
    for(NSDictionary *dict in dataArr){
        YHTMedicalDetailModel *model = [[YHTMedicalDetailModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [_dataArr addObject:model];
    }
}
#pragma mark -- 药箱详情界面
- (void)creatMedicalDetaliView
{
    _medicalDetailTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH-64-15) style:UITableViewStylePlain];
    _medicalDetailTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _medicalDetailTabView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _medicalDetailTabView.delegate = self;
    _medicalDetailTabView.dataSource = self;
    [self.view addSubview:_medicalDetailTabView];
}
#pragma mark --代理和数据源
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMedicalDetailCell *cell = [YHTMedicalDetailCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    return cell;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
#pragma mark -- 头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 80)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, YHTScreenW, 20)];
    titleLabel.text = @"上呼吸道感染用药";
    titleLabel.textColor = [UIColor blackColor];
    [headView addSubview:titleLabel];
    
    UILabel *keshi = [[UILabel alloc]initWithFrame:CGRectMake(15, titleLabel.maxY+5, 200, 20)];
    keshi.font = YHTFont(14);
    keshi.text = @"上海市中山医院呼吸科";
    keshi.textColor = RGBACOLOR(172, 172, 172, 1);
    [headView addSubview:keshi];
    
    UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-80-15, keshi.y, 80, 20)];
    time.text = @"2016/01/01";
    time.textColor = RGBACOLOR(172, 172, 172, 1);
    time.font = YHTFont(14);
    [headView addSubview:time];
    
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,80,YHTScreenW,0.5)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 1;
    [headView addSubview:cutLine];
    return headView;
}
#pragma mark -- 尾部视图
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 60)];
    footView.backgroundColor = [UIColor whiteColor];
    
    UILabel *alert = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, YHTScreenW, 20)];
    alert.textColor = RGBACOLOR(172, 172, 172, 1);
    alert.font = YHTFont(14);
    alert.text = @"注意: 用药请遵循医嘱,如有不适,立即停用!";
    [footView addSubview:alert];
    
    return footView;
}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}
#pragma mark -- 尾部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}
#pragma mark -- 点击提醒按钮
- (void)notiClick
{
    YHTNotiController *notiVC = [[YHTNotiController alloc]init];
    [self.navigationController pushViewController:notiVC animated:YES];
}

@end
