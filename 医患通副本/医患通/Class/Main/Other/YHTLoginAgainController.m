//
//  YHTLoginAgainController.m
//  医患通
//
//  Created by 张耀华 on 16/2/15.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTLoginAgainController.h"
#import "YHTTabBarController.h"
#import "YHTLoginController.h"
@interface YHTLoginAgainController()<UITextFieldDelegate>
{
    UIImageView *_logoView;
    UITextField  *_phoneView;
    UITextField  *_passwordView;
    UIButton     *_loginAgainBtn;
    UIButton     *_registBtn;
    UIButton     *_forgetBtn;
}
@end

@implementation YHTLoginAgainController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    self.title = @"登录";
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);;
    [self creatLoginAgainView];
    
    [self creatLoginAgainBtn];
    
}
- (void)creatLoginAgainView
{
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 80, 80)];
    _logoView.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    _logoView.center = CGPointMake(YHTScreenW/2, 80);
    _logoView.layer.cornerRadius = 20;
    [self.view addSubview:_logoView];
    
    
    _phoneView = [self textFieldWithPlaceholder:@"请输入手机号码"];
    _phoneView.keyboardType = UIKeyboardTypeNumberPad;
    _phoneView.backgroundColor = [UIColor whiteColor];
    _phoneView.frame = CGRectMake(0, 160, YHTScreenW, 50);
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    label1.text=@"手机号:";
    label1.textAlignment = NSTextAlignmentCenter;
    _phoneView.leftView = label1;
    _phoneView.leftViewMode = UITextFieldViewModeAlways;
    
    
    //分割线
    UIImageView * cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(15,209,YHTScreenW-15,1)];
    cutLine1.backgroundColor = [UIColor lightGrayColor];
    cutLine1.alpha = 0.2;
    [self.view addSubview:cutLine1];
    

    _passwordView = [self textFieldWithPlaceholder:@"请输入密码"];
    _passwordView.frame = CGRectMake(0, 210, YHTScreenW, 50);
    _passwordView.secureTextEntry = YES;
    _passwordView.backgroundColor = [UIColor whiteColor];
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    label3.text=@"密   码:";
    label3.textAlignment = NSTextAlignmentCenter;
    _passwordView.leftView = label3;
    _passwordView.leftViewMode = UITextFieldViewModeAlways;
    
    
}
- (void)creatLoginAgainBtn
{
    _loginAgainBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 280, YHTScreenW-40, 50)];
    _loginAgainBtn.layer.cornerRadius = 5;
    _loginAgainBtn.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [_loginAgainBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginAgainBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_loginAgainBtn addTarget:self action:@selector(loginAgainBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginAgainBtn];
    
    _registBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 350, 100, 20)];
    [_registBtn setTitle:@"用户注册" forState:UIControlStateNormal];
    [_registBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_registBtn addTarget:self action:@selector(registBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _registBtn.titleLabel.font = YHTFont(14);
    [self.view addSubview:_registBtn];
    
    _forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-120, 350, 100, 20)];
    [_forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_forgetBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _forgetBtn.titleLabel.font = YHTFont(14);
    [self.view addSubview:_forgetBtn];
    
}

#pragma mark -- 点击登录
- (void)loginAgainBtnClick
{
//    NSString *phone = [YHTUserDefault valueForkey:@"phone"];
//    NSLog(@"%@",phone);
//    NSString *password = [YHTUserDefault valueForkey:@"pass"];
    
    
    NSString *phone = _phoneView.text;
    NSString *password = _passwordView.text;
    NSDictionary *dict = @{@"username":phone,@"password":password};
    [YHTHttpRequestManager postUrl:@"http://www.hisforce.cn:3001/api/login" parameters:dict success:^(id data) {
        
        NSLog(@"登录成功%@",data);
        [YHTUserDefault setValue:data[@"data"][@"token"] forKey:@"token"];
        
        //         [self.navigationController pushViewController:[[YHTTabBarController alloc]init] animated:YES];
        //         self.navigationController.navigationBarHidden = YES;
        
    } fail:^(NSError *error) {
        NSLog(@"登录失败%@",error);
    }];

    
    if([_phoneView.text isEqualToString:phone]&&[_passwordView.text isEqualToString:password]){
        
        [self.navigationController pushViewController:[[YHTTabBarController alloc]init] animated:YES];
        self.navigationController.navigationBarHidden = YES;
        NSLog(@"登录成功");
    }else{
        NSLog(@"密码账号错误");
    }
    
}
#pragma mark -- 点击用户注册
- (void)registBtnClick
{
    YHTLoginController *login = [[YHTLoginController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
 
}
#pragma mark -- 点击忘记密码
- (void)forgetBtnClick
{
    
}
- (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder
{
    UITextField * field = [[UITextField alloc]init];
    field.placeholder = placeholder;
    field.textAlignment=NSTextAlignmentLeft;
    field.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    field.clearButtonMode=UITextFieldViewModeAlways;
    field.delegate = self;
    [self.view addSubview:field];
    return field;
}
@end
