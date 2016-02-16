//
//  YHTCollectController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTCollectController.h"
#import "YHTCollectCell.h"
#import "YHTTRegisterdCell.h"
#import "YHTDoctorCell.h"
@interface YHTCollectController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_collectView;
    UITableView *_collectView1;
    UIButton    *_hospital;
    UIButton    *_doctor;

}
@end

@implementation YHTCollectController
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
    self.title = @"我的收藏";
     
    //医院按钮
    [self creatHospitalBtn];
    
    //医生按钮
    [self creatDoctorBtn];
    
    //收藏界面
    [self creatCollectView];
}
#pragma mark -- 医院按钮
- (void)creatHospitalBtn
{
    _hospital = [[UIButton alloc]initWithFrame:CGRectMake((YHTScreenW-150)/2, 15, 75, 30)];
    [_hospital setBackgroundImage:YHTImage(@"btn_hospital_selected") forState:UIControlStateNormal];
    [_hospital addTarget:self action:@selector(hospital) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_hospital];
}
#pragma mark -- 医生按钮
- (void)creatDoctorBtn
{
    _doctor = [[UIButton alloc]initWithFrame:CGRectMake((YHTScreenW-150)/2+75, 15, 75, 30)];
    [_doctor setBackgroundImage:YHTImage(@"btn_doctor_normal") forState:UIControlStateNormal];
    [_doctor addTarget:self action:@selector(doctor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_doctor];
}
#pragma mark -- 收藏界面
- (void)creatCollectView
{
    _collectView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, YHTScreenW, YHTScreenH-60-64) style:UITableViewStylePlain];
    _collectView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _collectView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [self.view addSubview:_collectView];
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _collectView){
        return 6;
    }else{
        return 3;
    }
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _collectView){
    YHTTRegisterdCell *cell = [YHTTRegisterdCell cellWithTableView:tableView];
        return cell;
    }else{
        YHTDoctorCell *cell = [YHTDoctorCell cellWithTableView:tableView];
        return cell;
    }
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _collectView1){
        return 90;
    }else{
        return 80;
    }
}
#pragma mark -- 点击医生按钮
- (void)doctor
{
   [_hospital setBackgroundImage:YHTImage(@"btn_hospital_normal") forState:UIControlStateNormal];
    [_doctor setBackgroundImage:YHTImage(@"btn_doctor_selected") forState:UIControlStateNormal];
     [_collectView removeFromSuperview];
    _collectView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, YHTScreenW, YHTScreenH-60-64) style:UITableViewStylePlain];
    _collectView1.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _collectView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    _collectView1.delegate = self;
    _collectView1.dataSource = self;
    [self.view addSubview:_collectView1];
   
}
#pragma mark -- 点击医院按钮
- (void)hospital
{
    [_doctor setBackgroundImage:YHTImage(@"btn_doctor_normal") forState:UIControlStateNormal];
    [_hospital setBackgroundImage:YHTImage(@"btn_hospital_selected") forState:UIControlStateNormal];
    [_collectView1 removeFromSuperview];
    [self.view addSubview:_collectView];
}
@end
