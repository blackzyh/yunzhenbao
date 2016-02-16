//
//  YHTChooseTimeController.h
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendValueDelegate <NSObject>
- (void)sentTime:(NSString *)time;//代理传值
@end
@interface YHTChooseTimeController : UIViewController
@property (nonatomic,weak)id<sendValueDelegate>delegate;// 代理
@end
