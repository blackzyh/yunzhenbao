//
//  YHTSetController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSetController.h"
#import "YHTAboutUsController.h"
#import "YHTSetCell.h"
#import "YHTSetModel.h"
#import "YHTLoginAgainController.h"
@interface YHTSetController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_setTableView;
    
    UIButton    *_footBtn;
    
    NSMutableArray *_dataArr;
}
@end

@implementation YHTSetController

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
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"设置";
    
    //退出登录
    [self creatFootView];
    
    //数据源
    [self creatData];
    //设置界面
    [self creatSetTableView];
    
}
#pragma mark -- 数据源
- (void)creatData
{
    NSArray *dataArr = @[@{@"title":@"修改密码"},@{@"title":@"关于我们"},@{@"title":@"去打分"}];
    for(NSDictionary *dict in dataArr){
        YHTSetModel *model = [[YHTSetModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [_dataArr addObject:model];
    }
}
#pragma mark -- 设置界面
- (void)creatSetTableView
{
    _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, YHTScreenW, 180) style:UITableViewStylePlain];
    _setTableView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _setTableView.delegate = self;
    _setTableView.dataSource = self;
    _setTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_setTableView];
}

#pragma mark -- 底部退出登录按钮
- (void)creatFootView
{
    _footBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 220, YHTScreenW-30, 60)];
    _footBtn.backgroundColor = [UIColor redColor];
    _footBtn.layer.cornerRadius = 10;
    [_footBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_footBtn addTarget:self action:@selector(LogOutBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_footBtn];
    
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTSetCell *cell = [YHTSetCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 1){
        YHTAboutUsController *aboutVC = [[YHTAboutUsController alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
    if(indexPath.row == 2){
        NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com"];
        [[UIApplication sharedApplication]openURL:url];
        
    }
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
#pragma mark -- 退出登录
- (void)LogOutBtn
{
    NSString *token = [YHTUserDefault valueForkey:@"token"];
    NSDictionary *dict = @{@"token":token};
    [YHTHttpRequestManager postUrl:@"http://www.hisforce.cn:3001/api/logout" parameters:dict success:^(id data) {
        NSLog(@"登出成功%@",data);
        
    } fail:^(NSError *error) {
        NSLog(@"登出失败%@",error);
    }];

    YHTLoginAgainController *loginAgain = [[YHTLoginAgainController alloc]init];
    [self.navigationController pushViewController:loginAgain animated:YES];
}

@end
