//
//  YHTDetailCaseView.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTDetailCaseView.h"

@interface YHTDetailCaseView()
@property (nonatomic,strong)UILabel *base;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *sex;
@property (nonatomic,strong)UILabel *age;
@property (nonatomic,strong)UILabel *loca;
@property (nonatomic,strong)UILabel *lookTime;
@property (nonatomic,strong)UILabel *mainTok;
@property (nonatomic,strong)UILabel *talkContent;
@property (nonatomic,strong)UILabel *talkContent1;
@property (nonatomic,strong)UILabel *initialLook;
@property (nonatomic,strong)UIImageView *cutLine;
@property (nonatomic,strong)UIImageView *cutLine1;
@property (nonatomic,strong)UIImageView *cutLine2;
@end
@implementation YHTDetailCaseView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self creatView];
    }
    return self;
}
- (void)creatView
{
    // 基本信息
    self.base = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
    self.base.textColor = RGBACOLOR(0, 0, 0, 1);
    self.base.font = YHTFont(17);
    self.base.text = @"基本信息";
    [self addSubview:self.base];
    //姓名
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(15, _base.maxY+15,80, 20)];
    _name.textColor = RGBACOLOR(0, 0, 0, 1);
    _name.font = YHTFont(14);
    _name.text = @"姓名:张三";
    CGFloat width = [_name.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:_name.font}context:nil].size.width;
    _name.width = width;
    [self addSubview:_name];
    //性别
    self.sex = [[UILabel alloc]initWithFrame:CGRectMake(_name.maxX+25, _base.maxY+15, 60, 20)];
    self.sex.textColor = RGBACOLOR(0, 0, 0, 1);
    self.sex.text = @"性别:男";
    self.sex.font = YHTFont(14);
    CGFloat width1 = [_sex.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:_sex.font}context:nil].size.width;
    _sex.width = width1;
    [self addSubview:_sex];
    
    //年龄
    self.age = [[UILabel alloc]initWithFrame:CGRectMake(_sex.maxX+25, _base.maxY+15, 100, 20)];
    self.age.textColor = RGBACOLOR(0, 0, 0, 1);
    self.age.text = @"年龄:26岁";
    self.age.font = YHTFont(14);
    CGFloat width3 = [_age.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:_age.font}context:nil].size.width;
    _age.width = width3;
    [self addSubview:_age];
    
    //就诊科室
    self.loca = [[UILabel alloc]initWithFrame:CGRectMake(15, _name.maxY+15, 300, 20)];
    self.loca.textColor = RGBACOLOR(0, 0, 0, 1);
    self.loca.lineBreakMode = NSLineBreakByWordWrapping;
    self.loca.font = YHTFont(14);
    self.loca.text = @"就诊科室:上海中山医院－呼吸科";
    [self addSubview:self.loca];
    
    //就诊日期
    self.lookTime = [[UILabel alloc]initWithFrame:CGRectMake(15, _loca.maxY+15, 300, 20)];
    self.lookTime.textColor = RGBACOLOR(0, 0, 0, 1);
    self.lookTime.font = YHTFont(14);
    self.lookTime.lineBreakMode = NSLineBreakByWordWrapping;
    self.lookTime.text = @"就诊时间:2015-12-26";
    [self addSubview:self.lookTime];
    
    //分割线
    self.cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,_lookTime.maxY+15,YHTScreenW-15,1)];
    _cutLine.backgroundColor = [UIColor lightGrayColor];
    _cutLine.alpha = 0.2;
    [self addSubview:_cutLine];
    
    //主诉
    self.mainTok = [[UILabel alloc]initWithFrame:CGRectMake(15, _cutLine.maxY+30, 50, 20)];
    self.mainTok.textColor = RGBACOLOR(0, 0, 0, 1);
    self.mainTok.font = YHTFont(17);
    self.mainTok.lineBreakMode = NSLineBreakByWordWrapping;
    self.mainTok.text = @"主诉";
    [self addSubview:self.mainTok];
    
    
    //主诉内容
    self.talkContent = [[UILabel alloc]initWithFrame:CGRectMake(15, _mainTok.maxY+15, 300, 20)];
    self.talkContent.textColor = RGBACOLOR(0, 0, 0, 1);
    self.talkContent.font = YHTFont(14);
    self.talkContent.text = @"咳嗽伴发热三天";
    self.talkContent.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:_talkContent];
    
    //分割线
    self.cutLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(15,_talkContent.maxY+15,YHTScreenW-15,1)];
    _cutLine1.backgroundColor = [UIColor lightGrayColor];
    _cutLine1.alpha = 0.2;
    [self addSubview:_cutLine1];
    
     //初步诊断
    self.initialLook = [[UILabel alloc]initWithFrame:CGRectMake(15, _cutLine1.maxY+30, 100, 20)];
    self.initialLook.text = @"初步诊断";
    self.initialLook.textColor = RGBACOLOR(0, 0, 0, 1);
    self.initialLook.font = YHTFont(17);
    [self addSubview:_initialLook];
    
    //初步诊断内容
    self.talkContent1 = [[UILabel alloc]initWithFrame:CGRectMake(15, _initialLook.maxY+15, 200, 20)];
    self.talkContent1.text = @"上呼吸道感染";
    self.talkContent1.textColor = RGBACOLOR(0, 0, 0, 1);
    self.talkContent1.font = YHTFont(14);
    self.talkContent1.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:_talkContent1];
    
    //分割线
    self.cutLine2 = [[UIImageView alloc]initWithFrame:CGRectMake(15,_talkContent1.maxY+15,YHTScreenW-15,1)];
    _cutLine2.backgroundColor = [UIColor lightGrayColor];
    _cutLine2.alpha = 0.2;
    [self addSubview:_cutLine2];
   
}
@end
