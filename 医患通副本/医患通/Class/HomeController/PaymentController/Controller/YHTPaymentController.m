//
//  YHTPaymentController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTPaymentController.h"
#import "YHTPayInfoController.h"
#import "YHTPaymentCell.h"
@interface YHTPaymentController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  *_paymentTableView;
}
@end

@implementation YHTPaymentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"我的订单";
    //创建订单视图
    [self creatPaymentTable];
}
#pragma mark -- 创建订单视图
- (void)creatPaymentTable
{
    _paymentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH-64-15) style:UITableViewStylePlain];
    _paymentTableView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _paymentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _paymentTableView.delegate = self;
    _paymentTableView.dataSource = self;
    [self.view addSubview:_paymentTableView];
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTPaymentCell *cell = [YHTPaymentCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTPayInfoController *payInfoVC = [[YHTPayInfoController alloc]init];
    [self.navigationController pushViewController:payInfoVC animated:YES];
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

@end
