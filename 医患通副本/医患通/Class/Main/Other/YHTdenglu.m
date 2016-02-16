//
//  YHTdenglu.m
//  医患通
//
//  Created by 张耀华 on 16/2/15.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTdenglu.h"
#import "YHTHttpRequestManager.h"
#import "YHTTabBarController.h"
#import "YHTUserInfoModel.h"
@implementation YHTdenglu
- (void)viewDidLoad
{
    
    //登录按钮
    [self creatdenglu];
    
    //登出
    [self creatTuichu];
    
    //个人信息
    [self creatUserInfo];
    
    //修改个人信息
    [self creatxiugai];
}
//个人信息
- (void)creatUserInfo
{
    UIButton *UserInfo = [[UIButton alloc]initWithFrame:CGRectMake(20, 170, YHTScreenW-40, 50)];
    UserInfo.layer.cornerRadius = 5;
    UserInfo.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [UserInfo setTitle:@"获取个人信息" forState:UIControlStateNormal];
    UserInfo.titleLabel.textAlignment = NSTextAlignmentCenter;
    [UserInfo addTarget:self action:@selector(userInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:UserInfo];
}
//获取个人信息
- (void)userInfoBtn
{
    NSString *token = [YHTUserDefault valueForkey:@"token"];
    NSDictionary *dict = @{@"token":token};
    
    [YHTHttpRequestManager getUrl:@"http://www.hisforce.cn:3001/api/me" parameters:dict success:^(id data) {
        NSString *userInfoData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"个人信息%@",userInfoData);
    } fail:^(NSError *error) {
        NSLog(@"获取个人信息失败%@",error);
    }];
    
}
- (void)creatxiugai
{
    UIButton *xiugai = [[UIButton alloc]initWithFrame:CGRectMake(20, 70, YHTScreenW-40, 50)];
    xiugai.layer.cornerRadius = 5;
    xiugai.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [xiugai setTitle:@"修改个人信息" forState:UIControlStateNormal];
    xiugai.titleLabel.textAlignment = NSTextAlignmentCenter;
    [xiugai addTarget:self action:@selector(xiugaiBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xiugai];
}
//修改个人信息
- (void)xiugaiBtn
{
    NSString *token = [YHTUserDefault valueForkey:@"token"];
    NSDictionary *dict = @{@"token":token};
    NSLog(@"token----%@",dict);
    
    [YHTHttpRequestManager putUrl:@"http://www.hisforce.cn:3001/api/me" paramenters:dict success:^(id data) {
        NSLog(@"修改成功%@",data);
        
    } fail:^(NSError *error) {
        NSLog(@"修改失败%@",error);
    }];
}
//登录按钮
- (void)creatdenglu
{
    UIButton *denglu = [[UIButton alloc]initWithFrame:CGRectMake(20, 270, YHTScreenW-40, 50)];
    denglu.layer.cornerRadius = 5;
    denglu.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [denglu setTitle:@"登录" forState:UIControlStateNormal];
    denglu.titleLabel.textAlignment = NSTextAlignmentCenter;
    [denglu addTarget:self action:@selector(dengluBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:denglu];
}
//登录请求
- (void)dengluBtn
{

    NSString *phone = [YHTUserDefault valueForkey:@"phone"];

    NSString *password = [YHTUserDefault valueForkey:@"pass"];

    
    
    NSDictionary *dict = @{@"username":phone,@"password":password};
    [YHTHttpRequestManager postUrl:@"http://www.hisforce.cn:3001/api/login" parameters:dict success:^(id data) {
        
        NSLog(@"登录成功%@",data);
        [YHTUserDefault setValue:data[@"data"][@"token"] forKey:@"token"];
      
//         [self.navigationController pushViewController:[[YHTTabBarController alloc]init] animated:YES];
//         self.navigationController.navigationBarHidden = YES;
        
    } fail:^(NSError *error) {
        NSLog(@"登录失败%@",error);
    }];
    
}

//登出
- (void)creatTuichu
{
    UIButton *dengchu = [[UIButton alloc]initWithFrame:CGRectMake(20, 470, YHTScreenW-40, 50)];
    dengchu.layer.cornerRadius = 5;
    dengchu.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [dengchu setTitle:@"登出" forState:UIControlStateNormal];
    dengchu.titleLabel.textAlignment = NSTextAlignmentCenter;
    [dengchu addTarget:self action:@selector(dengchuBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dengchu];

    
}
//登出请求
- (void)dengchuBtn
{
    NSString *token = [YHTUserDefault valueForkey:@"token"];
    NSDictionary *dict = @{@"token":token};
    [YHTHttpRequestManager postUrl:@"http://www.hisforce.cn:3001/api/logout" parameters:dict success:^(id data) {
        NSLog(@"登出成功%@",data);
        
    } fail:^(NSError *error) {
        NSLog(@"登出失败%@",error);
    }];
    
}
@end
