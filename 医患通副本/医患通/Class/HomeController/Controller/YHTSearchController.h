//
//  YHTSearchController.h
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendArrDelegate <NSObject>
- (void)sendArr:(NSMutableArray*)array;//代理传值
@end
@interface YHTSearchController : UIViewController
@property (nonatomic,strong)NSMutableArray*dateArr;//数据源
@property (nonatomic,strong)UITableView  *searchTabView;//搜索界面
@property (nonatomic,strong)UITableView  *resultTabView;//搜索结果界面
@property(nonatomic ,weak)id<sendArrDelegate>delegate;//代理
@end
