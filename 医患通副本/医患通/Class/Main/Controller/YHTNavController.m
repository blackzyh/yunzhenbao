//
//  YHTNavController.m
//  医患通
//
//  Created by 张耀华 on 16/1/12.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTNavController.h"

@interface YHTNavController ()

@end

@implementation YHTNavController

- (void)viewDidLoad {
    [super viewDidLoad];
                                //self.navigationBarHidden = YES;
    
//    //自定义导航
//    [self creatMyNavBar];
//
//}
//#pragma mark -- 自定义导航
//-(void)creatNavItemsWithTarget:(UIViewController *)target title:(NSString *)title rightAction1:(SEL)action1 rightAction2:(SEL)action2 leftAction:(SEL)action
//
//
//    {
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20,YHTScreenW,44)];
//        imageView.userInteractionEnabled = YES;
//        imageView.image = YHTImage(@"nav_bg");
//        [target.view addSubview:imageView];
//        
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
//        label.text = title;
//        label.center = CGPointMake(YHTScreenW/2, 20);
//        label.textColor = [UIColor whiteColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        [imageView addSubview:label];
//        
//        UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 3, 40, 40)];
//        [leftBtn setImage:YHTImage(@"qr@2x") forState:UIControlStateNormal];
//        [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        
//        [imageView addSubview:leftBtn];
//     
//        
//        UIButton *rightBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-40, 3, 40, 40)];
//        [rightBtn2 setImage:YHTImage(@"setting@2x") forState:UIControlStateNormal];
//        [rightBtn2 addTarget:target action:action2 forControlEvents:UIControlEventTouchUpInside];
//        [imageView addSubview:rightBtn2];
//        
//    }
}
+ (void)initialize
{
    //导航条主题
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:YHTFont(20.0f),NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setBackgroundImage:YHTImage(@"nav_bg") forBarMetrics:(UIBarMetricsDefault)];
    //去掉push后左边按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];

        UIImage* image = [UIImage imageNamed:@"nav_back_btn"];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{   
    if(self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
   
    [super pushViewController:viewController animated:animated];
   
}

@end
