//
//  YHTSearchBar.m
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSearchBar.h"

@implementation YHTSearchBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景
        //self.backgroundColor = [UIColor redColor];
        UIImage *image = YHTImage(@"nav_search-frame_btn-0");
       image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:(UIImageResizingModeStretch)];
        self.background = image;
        // 设置内容 -- 垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.placeholder = @"输入关键词搜索";
        self.font = YHTFont(15);
        // 设置右边永远显示清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.returnKeyType =  UIReturnKeyGoogle;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return self;
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width-10, bounds.size.height);
}
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x +20, bounds.origin.y, bounds.size.width -10, bounds.size.height);
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
