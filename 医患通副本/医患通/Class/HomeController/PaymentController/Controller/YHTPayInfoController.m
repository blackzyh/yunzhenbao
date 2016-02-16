//
//  YHTPayInfoController.m
//  医患通
//
//  Created by 张耀华 on 16/1/18.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTPayInfoController.h"

#define KMargin 96

#define KMID (YHTScreenW-30-3*80)/2
@interface YHTPayInfoController ()
{
    UIView   *_orderStateView;//订单状态
    
    UIView   *_orderDetialView;//订单详情
    
    UILabel  *_time;
    
    NSTimer  *_timer;//定时器
    
    UIButton *_tickBtn;//打勾
    
    UIButton *_tickBtn1;//打勾
    
    BOOL     _isClick1;
    BOOL     _isClick2;
  
    //AppDelegate       *_app;
   
}
@end

@implementation YHTPayInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
   // _app = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    _isClick1 = YES;
    _isClick2 = YES;
  
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeMinus) userInfo:nil repeats:YES];
    
    //订单状态按钮
    UIButton *orderStateBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW/2, 50)];
    [orderStateBtn setTitle:@"订单状态" forState:UIControlStateNormal];
    [orderStateBtn setBackgroundImage:YHTImage(@"home_option_box1") forState:UIControlStateNormal];
    orderStateBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [orderStateBtn addTarget:self action:@selector(orderStateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orderStateBtn];
    
    //订单详情按钮
    UIButton *orderDetialBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW/2, 15, YHTScreenW/2,50)];
    [orderDetialBtn setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    [orderDetialBtn setTitle:@"订单详情" forState:UIControlStateNormal];
    [orderDetialBtn setBackgroundImage:YHTImage(@"home_option_box1") forState:UIControlStateNormal];
    orderDetialBtn.backgroundColor = [UIColor whiteColor];
    [orderDetialBtn addTarget:self action:@selector(orderDetialBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orderDetialBtn];
    
    //订单状态
    [self creatOrderStateView];
   
    
}


#pragma mark -- 订单状态
- (void)creatOrderStateView
{
    _orderStateView = [[UIView alloc]initWithFrame:CGRectMake(0 ,65, YHTScreenW, YHTScreenH-64-65)];
    _orderStateView.backgroundColor = [UIColor whiteColor];
   // _orderStateView.height = _app.autoSizeScaleY*_orderStateView.height;
    [self.view addSubview:_orderStateView];
    
    UIView *timeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 50)];
    timeView.backgroundColor = RGBACOLOR(204, 204, 204, 1);
    [_orderStateView addSubview:timeView];
    
    UIImageView *timeImg = [[UIImageView alloc]initWithFrame:CGRectMake(KMargin, 10, 31, 31)];
    timeImg.image = YHTImage(@"home_clock");
    if(YHTScreenW<375){
        timeImg.x = 75;
    }
    [timeView addSubview:timeImg];
    
    UILabel *timeLabel  = [[UILabel alloc]initWithFrame:CGRectMake(timeImg.maxX+15, 18, 100, 20)];
    timeLabel.center = CGPointMake(YHTScreenW/2, 25);
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = YHTFont(14);
    timeLabel.text = @"支付剩余时间:";
    CGFloat width = [timeLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:timeLabel.font}context:nil].size.width;
    timeLabel.width = width;
    [timeView addSubview:timeLabel];
    
    _time = [[UILabel alloc]initWithFrame:CGRectMake(timeLabel.maxX+10, timeLabel.y, 100, 20)];
    _time.textColor = [UIColor whiteColor];
    _time.text = @"30:00";
    _time.font = YHTFont(14);
    [timeView addSubview:_time];
    
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(15, timeView.maxY+15, 80, 80)];
    btn1.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    btn1.layer.cornerRadius = 40;
    [btn1 setTitle:@"已提交" forState:UIControlStateNormal];
    [_orderStateView addSubview:btn1];

    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(15+80+KMID, timeView.maxY+15, 80, 80)];
   // btn2.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [btn2 setBackgroundImage:YHTImage(@"home_round") forState:UIControlStateNormal];
     btn2.layer.cornerRadius = 40;
    [btn2 setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    [btn2 setTitle:@"待支付" forState:UIControlStateNormal];
    [_orderStateView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(15+(80+KMID)*2, timeView.maxY+15, 80, 80)];
    btn3.layer.cornerRadius = 40;
    [btn3 setBackgroundImage:YHTImage(@"home_round") forState:UIControlStateNormal];
    [btn3 setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    //btn3.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [btn3 setTitle:@"订单完成" forState:UIControlStateNormal];
    [_orderStateView addSubview:btn3];
    
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, btn1.maxY+15, YHTScreenW, 15)];
    cutLine.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    [_orderStateView addSubview:cutLine];
    
    //支付金额
    UILabel *payNumber = [[UILabel alloc]initWithFrame:CGRectMake(15, cutLine.maxY+15, 80, 20)];
    payNumber.textColor = [UIColor blackColor];
    payNumber.text = @"支付金额:";
    [_orderStateView addSubview:payNumber];
    
    UILabel *money = [[UILabel alloc]initWithFrame:CGRectMake(payNumber.maxX+15, cutLine.maxY+15, 80, 20)];
    money.textColor = [UIColor redColor];
    money.text = @"¥13";
    [_orderStateView addSubview:money];
    
    //分割线
    UIImageView *cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,cutLine.maxY+50,YHTScreenW,0.5)];
    cutLine1.backgroundColor = [UIColor lightGrayColor];
    cutLine1.alpha = 0.2;
    [_orderStateView addSubview:cutLine1];
    
    //选择支付方式
    UILabel *payMethod = [[UILabel alloc]initWithFrame:CGRectMake(15, cutLine1.maxY+15, 120, 20)];
    payMethod.textColor = [UIColor blackColor];
    payMethod.text = @"选择支付方式:";
    [_orderStateView addSubview:payMethod];
    
    
    UIImageView *weixin = [[UIImageView alloc]initWithFrame:CGRectMake(15, payMethod.maxY+15, 30, 30)];
    weixin.image = YHTImage(@"home_wechat");
    [_orderStateView addSubview:weixin];
    
    //微信支付
    UILabel *payWeixin = [[UILabel alloc]initWithFrame:CGRectMake(weixin.maxX+15, payMethod.maxY+23, 120, 20)];
    payWeixin.textColor = [UIColor blackColor];
    payWeixin.text = @"微信支付";
    [_orderStateView addSubview:payWeixin];
    
    //打勾按钮
    _tickBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-44, cutLine1.maxY+46, 44, 44)];
    [_tickBtn setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
    [_tickBtn addTarget:self action:@selector(tickBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_orderStateView addSubview:_tickBtn];
    
    //分割线
    UIImageView *cutLine2 = [[UIImageView alloc]initWithFrame:CGRectMake(0,cutLine1.y+95,YHTScreenW,0.5)];
    cutLine2.backgroundColor = [UIColor lightGrayColor];
    cutLine2.alpha = 0.2;
    [_orderStateView addSubview:cutLine2];
    
    
    UIImageView *alipay = [[UIImageView alloc]initWithFrame:CGRectMake(15, cutLine2.maxY+15, 30, 30)];
    alipay.image = YHTImage(@"alipay");
    [_orderStateView addSubview:alipay];
    
    //支付宝支付
    UILabel *PayAlipay = [[UILabel alloc]initWithFrame:CGRectMake(alipay.maxX+15, cutLine2.maxY+23, 120, 20)];
    PayAlipay.textColor = [UIColor blackColor];
    PayAlipay.text = @"支付宝支付";
    [_orderStateView addSubview:PayAlipay];

    
    //打勾按钮
    _tickBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-44, cutLine2.maxY+10, 44, 44)];
    [_tickBtn1 setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
    [_tickBtn1 addTarget:self action:@selector(tickBtnClick1) forControlEvents:UIControlEventTouchUpInside];
    [_orderStateView addSubview:_tickBtn1];


    _orderStateView.height = alipay.maxY+15;
    
    //提交
    UIButton *presentBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, _orderStateView.maxY+30, YHTScreenW-30, 50)];
    presentBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    presentBtn.layer.cornerRadius = 10;
    [presentBtn setTitle:@"提交" forState:UIControlStateNormal];
    if(YHTScreenH<667){
        presentBtn.y = _orderStateView.maxY+10;
        presentBtn.height = 30;
    }
    [self.view addSubview:presentBtn];
}

#pragma mark -- 倒计时
- (void)timeMinus
{
    
    
}
#pragma mark -- 点击订单状态
- (void)orderStateBtnClick
{
    
}
#pragma mark -- 点击订单详情
- (void)orderDetialBtnClick
{
    
}

#pragma mark -- 点击微信打勾
- (void)tickBtnClick
{
    if(_isClick1){
        [_tickBtn setImage:YHTImage(@"home_payment_btn_selected") forState:UIControlStateNormal];
        [_tickBtn1 setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
        _isClick1 = NO;
        _isClick2 = YES;
   }else{
        [_tickBtn setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
        _isClick1 = YES;
        
    }
}
#pragma mark -- 点击支付宝打勾
- (void)tickBtnClick1
{
    if(_isClick2){
        [_tickBtn1 setImage:YHTImage(@"home_payment_btn_selected") forState:UIControlStateNormal];
        [_tickBtn setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
        _isClick2 = NO;
        _isClick1 = YES;
    }else{
        [_tickBtn1 setImage:YHTImage(@"home_payment_btn_normal") forState:UIControlStateNormal];
        _isClick2 = YES;
        _tickBtn.enabled = YES;
    }
}
@end
