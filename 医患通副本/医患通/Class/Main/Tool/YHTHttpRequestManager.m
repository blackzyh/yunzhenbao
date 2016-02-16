//
//  YHTHttpRequestManager.m
//  YHTHttpRequestManager
//
//  Created by 张耀华 on 16/1/4.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTHttpRequestManager.h"
#import "AFHTTPSessionManager.h"
@implementation YHTHttpRequestManager
+ (void)getUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    [session.requestSerializer setValue:[YHTUserDefault valueForkey:@"token"] forHTTPHeaderField:@"token"];
    [session GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successblock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failblock(error);
    }];
    
}
+ (void)postUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    [session POST:url parameters:dict constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successblock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failblock(error);
    }];
    
}
+ (void)putUrl:(NSString *)url paramenters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    AFJSONRequestSerializer *jsonRequestSerializer = [AFJSONRequestSerializer serializer];
    [session setRequestSerializer:jsonRequestSerializer];
    
    [session.requestSerializer setValue:[YHTUserDefault valueForkey:@"token"] forHTTPHeaderField:@"token"];
    NSLog(@"---------%@",  session.requestSerializer.HTTPRequestHeaders);
    NSLog(@"%@",[YHTUserDefault valueForkey:@"token"]);
    [session PUT:url parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successblock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failblock(error);
    }];
    
    
    
   
}
@end
