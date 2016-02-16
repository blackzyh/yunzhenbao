//
//  EMIMHelper.m
//  CustomerSystem-ios
//
//  Created by dhc on 15/3/28.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "EMIMHelper.h"

#import "EaseMob.h"
//#import "LocalDefine.h"

static EMIMHelper *helper = nil;

@implementation EMIMHelper

@synthesize appkey = _appkey;
@synthesize cname = _cname;

@synthesize username = _username;
@synthesize password = _password;

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        _appkey = [userDefaults objectForKey:kAppKey];
//         NSLog(@"-----------%@",_appkey);
//        if ([_appkey length] == 0) {
//            _appkey = kDefaultAppKey;
//              NSLog(@"-----------%@",_appkey);
//            [userDefaults setObject:_appkey forKey:kAppKey];
//        }
//        
//        _cname = [userDefaults objectForKey:kCustomerName];
//        if ([_cname length] == 0) {
//            _cname = kDefaultCustomerName;
//            [userDefaults setObject:_cname forKey:kCustomerName];
//        }
//        
//        _username = [userDefaults objectForKey:@"username"];
//        _password = [userDefaults objectForKey:@"password"];
//        _appkey = kDefaultAppKey;
//        _username = @"zyh";
//        _password = @"123";
       // _cname = kDefaultCustomerName;
//        [[NSUserDefaults standardUserDefaults]setObject:_appkey forKey:@"username"];
//        [[NSUserDefaults standardUserDefaults]setObject:_password forKey:@"password"];
//        [[NSUserDefaults standardUserDefaults]setObject:_appkey forKey:kAppKey];
//        [[NSUserDefaults standardUserDefaults]setObject:_cname forKey:kCustomerName];
        _username = [[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
        _password = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];

    }
    
    return self;
}

+ (instancetype)defaultHelper
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[EMIMHelper alloc] init];
    });
    
    return helper;
}

#pragma mark - login

- (void)loginEasemobSDK
{
    EaseMob *easemob = [EaseMob sharedInstance];
    if (![easemob.chatManager isLoggedIn] || ([_username length] == 0 || [_password length] == 0)) {
        NSLog(@"-----------%@",_username);
        if ([_username length] == 0 || [_password length] == 0) {
           _username = @"zyh";
            _password = @"123";
            
            
            [easemob.chatManager asyncRegisterNewAccount:_username password:_password withCompletion:^(NSString *username, NSString *password, EMError *error) {
                if (!error || error.errorCode == EMErrorServerDuplicatedAccount) {
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

                    [userDefaults setObject:_username forKey:@"username"];
                    [userDefaults setObject:_password forKey:@"password"];
                    [easemob.chatManager asyncLoginWithUsername:_username password:_password];
                }
            } onQueue:nil];
        }
        else{
            [easemob.chatManager asyncLoginWithUsername:_username password:_password];
        }
    }
}

#pragma mark - info

//- (void)setCname:(NSString *)cname
//{
//    if ([cname length] > 0 && ![cname isEqualToString:_cname]) {
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        [userDefaults setObject:cname forKey:kCustomerName];
//        _cname = cname;
//    }
//}

//- (void)refreshHelperData
//{
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    _appkey = [userDefaults objectForKey:kAppKey];
//    if ([_appkey length] == 0) {
//        _appkey = kDefaultAppKey;
//      
//        [userDefaults setObject:_appkey forKey:kAppKey];
//    }
//     
//    _cname = [userDefaults objectForKey:kCustomerName];
//    if ([_cname length] == 0) {
//        _cname = kDefaultCustomerName;
//        [userDefaults setObject:_cname forKey:kCustomerName];
//    }
//    
//    [userDefaults removeObjectForKey:@"username"];
//    [userDefaults removeObjectForKey:@"password"];
//    _username = nil;
//    _password = nil;
//}

@end
