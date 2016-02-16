//
//  YHTHomeController.m
//  医患通
//
//  Created by 张耀华 on 16/1/12.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTHomeController.h"
#import "YHTSearchController.h"
#import "YHTRegistController.h"
#import "YHTCaseController.h"
#import "YHTMedicalController.h"
#import "YHTPaymentController.h"
#define BtnW YHTScreenW/2
#define BtnH (YHTScreenH-64-44-SHOWH)/2
#define SHOWH  227
@interface YHTHomeController ()<UIScrollViewDelegate,sendArrDelegate>
{
    AppDelegate       *_app;
    UIButton          *_searchBtn;//搜索
    UIScrollView      *_homeShowView;//轮播图
    UIPageControl     *_pageVC;//页面指示器
    NSTimer           *_timer;//定时器
    
    UIButton         *_registered;
}
@end

@implementation YHTHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    //分割线
    UIImageView *cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,YHTScreenH-50-64,YHTScreenW,1)];
    cutLine1.backgroundColor = RGBACOLOR(172, 172, 172, 0.5);
    cutLine1.alpha = 1;
    [self.view addSubview:cutLine1];
    
    
    //导航右侧搜索
    [self creatSearch];
    
    //首页轮播展示
    [self creatShowView];
    
    //首页下方4个按钮
    [self creatBtn];
    
}
#pragma mark -- 导航右侧搜索
- (void)creatSearch
{
    _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [_searchBtn setImage:YHTImage(@"nav_search_btn") forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(searchBarClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_searchBtn];
}
#pragma mark -- 首页4个按钮
- (void)creatBtn
{
    UIButton *registered = [[UIButton alloc]initWithFrame:CGRectMake(0, _homeShowView.height, YHTScreenW/2,(YHTScreenH-_homeShowView.height-49-64)/2)];
   // NSLog(@"%f",registered.height);
    [registered setBackgroundImage:YHTImage(@"home_normal") forState:UIControlStateNormal];
    [registered setBackgroundImage:YHTImage(@"home_selected") forState:UIControlStateHighlighted];
    [registered setImage:YHTImage(@"home_registration_btn") forState:UIControlStateNormal];
    [registered setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, -35)];
    [registered setTitle:@"挂号" forState:UIControlStateNormal];
    [registered setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registered setTitleEdgeInsets:UIEdgeInsetsMake(120, -72, 35, 0)];
    [registered addTarget:self action:@selector(registerdClcik) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registered];
    
    UIButton *caseBtn  = [[UIButton alloc]initWithFrame:CGRectMake(registered.maxX, _homeShowView.height, YHTScreenW/2, (YHTScreenH-_homeShowView.height-49-64)/2)];
    [caseBtn setBackgroundImage:YHTImage(@"home_normal") forState:UIControlStateNormal];
    [caseBtn setBackgroundImage:YHTImage(@"home_selected") forState:UIControlStateHighlighted];
    [caseBtn setImage:YHTImage(@"home_case_btn") forState:UIControlStateNormal];
    [caseBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, -35)];
    [caseBtn setTitle:@"病历" forState:UIControlStateNormal];
    [caseBtn setTitleEdgeInsets:UIEdgeInsetsMake(120, -72, 35, 0)];
    [caseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [caseBtn addTarget:self action:@selector(caseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:caseBtn ];

    UIButton *medical = [[UIButton alloc]initWithFrame:CGRectMake(0, registered.maxY, YHTScreenW/2, (YHTScreenH-_homeShowView.height-49-64)/2)];
    [medical setBackgroundImage:YHTImage(@"home_normal") forState:UIControlStateNormal];
    [medical setBackgroundImage:YHTImage(@"home_selected") forState:UIControlStateHighlighted];
    [medical setImage:YHTImage(@"home_medical-kit_btn") forState:UIControlStateNormal];
    [medical setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, -35)];
    [medical setTitleEdgeInsets:UIEdgeInsetsMake(120, -72, 35, 0)];
    [medical setTitle:@"药箱" forState:UIControlStateNormal];
    [medical setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [medical addTarget:self action:@selector(medicalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:medical];
 
    
    UIButton *payment = [[UIButton alloc]initWithFrame:CGRectMake(medical.maxX, registered.maxY, YHTScreenW/2, (YHTScreenH-_homeShowView.height-49-64)/2)];
    [payment setBackgroundImage:YHTImage(@"home_normal") forState:UIControlStateNormal];
    [payment setBackgroundImage:YHTImage(@"home_selected") forState:UIControlStateHighlighted];
    [payment setImage:YHTImage(@"home_payment_btn") forState:UIControlStateNormal];
    [payment setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, -35)];
    [payment setTitleEdgeInsets:UIEdgeInsetsMake(120, -72, 35, 0)];
    [payment setTitle:@"缴费" forState:UIControlStateNormal];
    [payment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [payment addTarget:self action:@selector(paymentClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payment];
    
    
    UIImageView *lineView1 = [[UIImageView alloc]initWithFrame:CGRectMake(registered.maxX-0.5, _homeShowView.height, 0.5, (YHTScreenH-_homeShowView.height-49-64))];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    lineView1.alpha = 0.2;
    [self.view addSubview:lineView1];
    
    UIImageView *lineView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, registered.maxY-0.5, YHTScreenW, 0.5)];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    lineView2.alpha = 0.2;
    [self.view addSubview:lineView2];
   
    }

 
#pragma mark -- 首页轮播展示
- (void)creatShowView
{
    _homeShowView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 140)];
    _homeShowView.width = _app.autoSizeScaleX*_homeShowView.width;
    _homeShowView.height = _app.autoSizeScaleY*_homeShowView.height;
   // NSLog(@"%f",_homeShowView.height);
    [self.view addSubview:_homeShowView];

    
    //   图片的宽
         CGFloat imageW = _homeShowView.frame.size.width;
    //    图片高
         CGFloat imageH = _homeShowView.frame.size.height;
     //   图片的Y
         CGFloat imageY = 0;
     //   图片总数
         NSInteger totalCount = 3;
     //   添加3张图片
         for (int i = 0; i < totalCount; i++) {
                 UIImageView *imageView = [[UIImageView alloc] init];
         //        图片X
                 CGFloat imageX = i * imageW;
        //        设置frame
                imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
         //        设置图片
                 NSString *name = [NSString stringWithFormat:@"%d.jpg", i];
            // NSString *name = @"lunbo";
                imageView.image = [UIImage imageNamed:name];
         //    隐藏指示条
             _homeShowView.showsHorizontalScrollIndicator = NO;
             
                 [_homeShowView addSubview:imageView];
             }
        //设置scrollview的滚动范围
         CGFloat contentW = totalCount *imageW;
         //不允许在垂直方向上进行滚动
         _homeShowView.contentSize = CGSizeMake(contentW, 0);
    
     //   设置分页
        _homeShowView.pagingEnabled = YES;
    
     //   监听scrollview的滚动
         _homeShowView.delegate = self;
       //添加定时器
         [self addTimer];
    
    //页面指示器
    _pageVC = [[UIPageControl alloc]initWithFrame:CGRectMake(110, 120, 100, 0)];
    _pageVC.x = _app.autoSizeScaleX*_pageVC.x;
    _pageVC.y = _app.autoSizeScaleY*_pageVC.y;
    _pageVC.width = _app.autoSizeScaleX*_pageVC.width;
    _pageVC.height = _app.autoSizeScaleY*_pageVC.height;
    _pageVC.numberOfPages = 3;
    _pageVC.pageIndicatorTintColor = [UIColor whiteColor];
    //设置当前页码的颜色
    _pageVC.currentPageIndicatorTintColor= RGBACOLOR(0, 195, 219, 1);
    [self.view addSubview:_pageVC];
    
    //分割线
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,_homeShowView.maxY,YHTScreenW,0.5)];
    cutLine.backgroundColor = RGBACOLOR(172, 172, 172, 1);
    cutLine.alpha = 1;
    [self.view addSubview:cutLine];
    
}
#pragma mark -- 下一张图片
 - (void)nextImage
 {
    int page = (int)_pageVC.currentPage;
    if (page == 2) {
            page = 0;
    }else
    {
        page++;
    }
    
     //  滚动scrollview
         CGFloat x = page * _homeShowView.frame.size.width;
        _homeShowView.contentOffset = CGPointMake(x, 0);
     }

#pragma mark -- scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
     //    计算页码
     //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
         CGFloat scrollviewW =  scrollView.frame.size.width;
         CGFloat x = scrollView.contentOffset.x;
         int page = (x + scrollviewW / 2) /  scrollviewW;
         _pageVC.currentPage = page;
    }

#pragma mark -- 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
 {
     //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
     //    [self.timer invalidate];
         [self removeTimer];
     }
#pragma mark -- 结束拖拽
 - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
     //    开启定时器
         [self addTimer];
     }

#pragma mark -- 开启定时器
- (void)addTimer{
    
    _timer= [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
     }

#pragma mark -- 关闭定时器
 - (void)removeTimer {
   [_timer invalidate];
}
#pragma mark -- searchBarClick
- (void)searchBarClick
{
    YHTSearchController *searchVC = [[YHTSearchController alloc]init];
    searchVC.delegate = self;
    searchVC.dateArr = self.historyDate ;
    [self.navigationController pushViewController:searchVC animated:YES];
}
#pragma mark --  代理传值
- (void)sendArr:(NSMutableArray *)array
{
    self.historyDate = array;
}
#pragma mark -- registerdClcik
- (void)registerdClcik
{
    
    YHTRegistController *registerdVC = [[YHTRegistController alloc]init];
    [self.navigationController pushViewController:registerdVC animated:YES];
}
#pragma mark -- caseBtnClick
- (void)caseBtnClick
{
    YHTCaseController *caseVC = [[YHTCaseController alloc]init];
    [self.navigationController pushViewController:caseVC animated:YES];
}

#pragma mark -- medicalClick
- (void)medicalClick
{
    YHTMedicalController *medicalVC = [[YHTMedicalController alloc]init];
    [self.navigationController pushViewController:medicalVC animated:YES];
    
}
#pragma mark -- paymentClick
- (void)paymentClick
{
    YHTPaymentController *paymentVC = [[YHTPaymentController alloc]init];
    [self.navigationController pushViewController:paymentVC animated:YES];
}

@end
