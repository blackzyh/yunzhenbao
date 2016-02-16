//
//  YHTUserDefault.h
//  医患通
//
//  Created by 张耀华 on 16/2/15.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHTUserDefault : NSObject
// 存值
+ (void)setValue:(id)value forKey:(NSString *)key;


// 取值
+ (id)valueForkey:(NSString *)key;

@end
