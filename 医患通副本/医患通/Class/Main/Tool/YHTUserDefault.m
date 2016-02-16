//
//  YHTUserDefault.m
//  医患通
//
//  Created by 张耀华 on 16/2/15.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTUserDefault.h"

@implementation YHTUserDefault
+ (void)setValue:(id)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults]setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
+ (id)valueForkey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults]valueForKey:key];
}
@end
