//
//  YHTSelfBtn.m
//  医患通
//
//  Created by 张耀华 on 16/1/22.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSelfBtn.h"

@implementation YHTSelfBtn
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height;
    
    return CGRectMake(0, 0, imageW, imageH - 10);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat imageWH = contentRect.size.width;
    
    return CGRectMake(0, imageWH + 5, imageWH, 10);
}
@end
