//
//  YHTHttpRequestManager.h
//  YHTHttpRequestManager
//
//  Created by 张耀华 on 16/1/4.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(NSError *error);
@interface YHTHttpRequestManager : NSObject
/**发送get请求*/
+ (void)getUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock;
/**发送post请求*/
+ (void)postUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock;
/**发送put请求*/
+(void)putUrl:(NSString *)url paramenters:(NSDictionary *)dict success:(SuccessBlock)successblock fail:(FailBlock)failblock;
@end
