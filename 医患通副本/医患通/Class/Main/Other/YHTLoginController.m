//
//  YHTLoginController.m
//  医患通登录界面
//
//  Created by 张耀华 on 15/12/30.
//  Copyright © 2015年 禾医科技. All rights reserved.
//

#import "YHTLoginController.h"
#import <SMS_SDK/SMSSDK.h>
#import "YHTTabBarController.h"
#import "YHTHttpRequestManager.h"
#import "YHTdenglu.h"
@interface YHTLoginController ()<UITextFieldDelegate>
{
    UIImageView  *_logoView;
    UITextField  *_phoneView;
    UITextField  *_YZView;
    UIButton     *_YZBtn;
    UITextField  *_passwordView;
    UIButton     *_registerBtn;
    UIAlertView  *_alert;
    UILabel      *_explainLabel;
    UIButton     *_protocol;
    NSInteger    _count;
}
@end

@implementation YHTLoginController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"注册";
    
    //注册界面
    [self creatLoginView];
    
    //注册按钮
    [self creatRegisterBtn];
    
   
}



#pragma mark -- 隐藏键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneView resignFirstResponder];
    [_YZView resignFirstResponder];
    [_passwordView resignFirstResponder];
}
#pragma mark -- 注册界面
- (void)creatLoginView
{    
    _phoneView = [self textFieldWithPlaceholder:@"请输入手机号码"];
    _phoneView.keyboardType = UIKeyboardTypeNumberPad;
    _phoneView.backgroundColor = [UIColor whiteColor];
    _phoneView.frame = CGRectMake(0, 100, YHTScreenW, 50);
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    label1.text=@"手机号:";
    label1.textAlignment = NSTextAlignmentCenter;
    _phoneView.leftView = label1;
    _phoneView.leftViewMode = UITextFieldViewModeAlways;
    
    
    //分割线
    UIImageView * cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(15,149,YHTScreenW-15,1)];
    cutLine1.backgroundColor = [UIColor lightGrayColor];
    cutLine1.alpha = 0.2;
    [self.view addSubview:cutLine1];

    
    
    _YZView = [self textFieldWithPlaceholder:@"请输入验证码"];
    _YZView.frame = CGRectMake(0, 150, YHTScreenW, 50);
    _YZView.backgroundColor = [UIColor  whiteColor];
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    label2.text=@"验证码:";
    label2.textAlignment = NSTextAlignmentCenter;
    _YZView.leftView = label2;
    _YZView.leftViewMode = UITextFieldViewModeAlways;
    
    _YZBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-90, 160, 80, 30)];
    [_YZBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_YZBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    _YZBtn.titleLabel.font = YHTFont(14);
    [_YZBtn addTarget:self action:@selector(yanzheng) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_YZBtn];
    
    //分割线
    UIImageView * cutLine2 = [[UIImageView alloc]initWithFrame:CGRectMake(15,199,YHTScreenW-15,1)];
    cutLine2.backgroundColor = [UIColor lightGrayColor];
    cutLine2.alpha = 0.2;
    [self.view addSubview:cutLine2];
    
    _passwordView = [self textFieldWithPlaceholder:@"请输入密码"];
    _passwordView.frame = CGRectMake(0, 200, YHTScreenW, 50);
    _passwordView.secureTextEntry = YES;
    _passwordView.backgroundColor = [UIColor whiteColor];
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    label3.text=@"密   码:";
    label3.textAlignment = NSTextAlignmentCenter;
    _passwordView.leftView = label3;
    _passwordView.leftViewMode = UITextFieldViewModeAlways;
    
    _explainLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 340, YHTScreenW/2, 20)];
    _explainLabel.text = @"注册表示您已同意";
    _explainLabel.font = YHTFont(13);
    _explainLabel.textColor = RGBACOLOR(172, 172, 173, 1);
    [_explainLabel sizeToFit];
    
    [self.view addSubview:_explainLabel];
    
    _protocol = [[UIButton alloc]initWithFrame:CGRectMake(_explainLabel.width, 340, YHTScreenW/2, 20)];
    [_protocol setTitle:@"《就珍宝用户许可协议》" forState:UIControlStateNormal];
    [_protocol setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 3, 0)];
    _protocol.titleLabel.font = YHTFont(13);
    [_protocol setTitleColor:RGBACOLOR(0, 192, 219, 1) forState:UIControlStateNormal];
    [self.view addSubview:_protocol];
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
#pragma mark -- 注册
- (void)creatRegisterBtn
{
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 270, YHTScreenW-40, 50)];
    _registerBtn.layer.cornerRadius = 5;
    _registerBtn.backgroundColor = RGBACOLOR(0, 192, 219, 1);
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    _registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
}

#pragma mark -- registerClick
- (void)registerClick
{
//   if(_phoneView.text.length<1||_YZView.text.length<1||_passwordView.text.length<1)
//   {
//       _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确信息" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//       [_alert show];
//   }
//   if(_phoneView.text.length!=11 && _YZView.text.length>1 && _passwordView.text.length>1)
//    {
//        _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [_alert show];
//    }
//    if(_YZView.text.length<1&&_passwordView.text.length>1&&_phoneView.text.length == 11)
//    {
//        _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入验证码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [_alert show];
//    
//    }
//    if(_passwordView.text.length<6&&_YZView.text.length>1&&_phoneView.text.length == 11)
//   {
//        _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码长度过短" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [_alert show];
//    }
//    if(_phoneView.text.length==11&&_passwordView.text.length>6&&_YZView.text.length>1){
//    [SMSSDK commitVerificationCode:_YZView.text phoneNumber:_phoneView.text zone:@"86" result:^(NSError *error) {
//        if(!error){
//           _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"验证成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [_alert show];
//            
//            
//   
//        }
//        else
//        {
//            _alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [_alert show];
//        }
//      
//    }];
                    // [self presentViewController:[[YHTTabBarController alloc]init] animated:YES completion:nil];
        //注册接口
    if(_phoneView.text == nil&&_passwordView.text == nil){
        _phoneView.text = [YHTUserDefault valueForkey:@"phone"];
        _passwordView.text = [YHTUserDefault valueForkey:@"password"];
    }
    NSDictionary *dict = @{@"mobile":_phoneView.text,@"password":_passwordView.text,@"certCode":_YZView.text};
        [YHTHttpRequestManager postUrl:@"http://www.hisforce.cn:3001/api/register" parameters:dict success:^(id data) {
            NSLog(@"注册成功%@",data);
            NSLog(@"token=%@",data[@"data"][@"token"]);
            [YHTUserDefault setValue:data[@"data"][@"token"] forKey:@"token"];
        } fail:^(NSError *error) {
            NSLog(@"注册失败%@",error);
        }];
    
    [self.navigationController pushViewController:[[YHTTabBarController alloc]init] animated:YES];
        self.navigationController.navigationBarHidden = YES;
    [YHTUserDefault setValue:_phoneView.text forKey:@"phone"];
    [YHTUserDefault setValue:_passwordView.text forKey:@"pass"];

}
//}
#pragma mark -- 获取验证码
- (void)yanzheng
{
    _YZBtn.enabled = NO;
    _count = 60;
    [_YZBtn setTitle:@"60秒" forState:UIControlStateNormal];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeMinus:) userInfo:nil repeats:YES];
//    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethodSMS) phoneNumber:_phoneView.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
//        if (!error) {
//            NSLog(@"获取验证码成功");
//        } else {
//            NSLog(@"错误信息：%@",error);
//        }
//    }];
   // NSString *yanzheng =@"http://www.hisforce.cn:3001/api/sms/";
    NSString *yanzheng =  [@"http://www.hisforce.cn:3001/api/sms/" stringByAppendingString:_phoneView.text];
    [YHTHttpRequestManager getUrl:yanzheng parameters:nil success:^(id data) {
        NSString *yanzheng = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",yanzheng);
    } fail:^(NSError *error) {
        
    }];

   
}
-(void)timeMinus:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [_YZBtn setTitle:[NSString stringWithFormat:@"%ld秒",_count] forState:UIControlStateDisabled];
    }
    else
    {
        [timer invalidate];
        _YZBtn.enabled = YES;
        [_YZBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}
#pragma mark -- UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}







@end
