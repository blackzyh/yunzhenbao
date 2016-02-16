//
//  YHTTabBarController.m
//  医患通
//
//  Created by 张耀华 on 16/1/12.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTTabBarController.h"
#import "YHTNavController.h"
#import "YHTHomeController.h"
#import "YHTConsultController.h"
#import "YHTMineController.h"
@interface YHTTabBarController ()

@end

@implementation YHTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = YHTImage(@"tab_bg");
    [self addOneChlildVc:[[YHTHomeController alloc]init] title:@"首页" imageName:@"tab_home_normal" selectedImageName:@"tab_home_selected"];
    [self addOneChlildVc:[[YHTConsultController alloc]init] title:@"咨询" imageName:@"tab_consult_normal" selectedImageName:@"tab_consult_selected"];
    [self addOneChlildVc:[[YHTMineController alloc]init] title:@"我的" imageName:@"tab_me_normal" selectedImageName:@"tab_me_selected"];
    
    
}

#pragma mark 添加一个子控制器
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = YHTOriginalImage(imageName);
    // 设置选中的图标
    childVc.tabBarItem.selectedImage = YHTOriginalImage(selectedImageName);
    
    // 设置tabBarItem的普通文字颜色
    //[[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:YHTFont(12),NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:YHTFont(12),NSForegroundColorAttributeName:RGBACOLOR(0, 195, 219, 1)} forState:UIControlStateSelected];
    
    
    // 添加为tabbar控制器的子控制器
    YHTNavController *nav = [[YHTNavController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
