//
//  YHTHospitalInfoController.m
//  医患通
//
//  Created by 张耀华 on 16/1/21.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTHospitalInfoController.h"
#import "YHTHospitalDetailCell.h"
#import "YHTHospitalDetailModel.h"
#import "YHTHospitalImgCell.h"
#import "ChatViewController.h"
#import "YHTDepartmentController.h"
#define MID (YHTScreenW-2*40-3*50)/2
@interface YHTHospitalInfoController()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton    *_favoriteBtn;//收藏
    UIButton    *_consultBtn;//咨询
    UIButton    *_registrationBtn;//挂号
    
    UITableView *_hospitalInfoTable;//医院详情视图
    NSMutableArray *_dataArr;//数据
    UILabel     *_titleLabel;//
    UILabel     *_infoLabel;
    
    BOOL        _isClick;
 
}

@end
@implementation YHTHospitalInfoController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _isClick = YES;
    self.title = @"医院详情";
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    
    //底下3个按钮
    [self creatBottomBtn];
    //数据源
    NSArray *arr = @[@{@"info":@"医院简介:",@"abstract":@"复旦大学附属中山医院是卫生部部属综合性教学医院。中山医院创建于1936年，是当时中国人管理的第一所大型综合性医院，隶属于国立上海医学院，为纪念中国民主革命的先驱孙中山先生而命名为孙中山纪念医院，后更名为中山医院。解放后曾称上海第一医学院附属中山医院和上海医科大学附属中山医院，2001年用现名。"},@{@"info":@"地址:",@"abstract":@"上海市徐汇区枫林路180号"},@{@"info":@"交通路线:",@"abstract":@"上海中山医院公交站，途径中山医院公交站的有301路、等1条公交线路。上海中山医院附近有29个公交站，分别是中山医院(枫林路肇嘉浜路)(16米)、中山医院(平江路枫林路)(119米)、肇嘉浜路枫林路(203米)、肇嘉浜路襄阳南路(245米)、枫林路斜土路(247米)、等。"},@{@"info":@"联系电话:",@"abstract":@"13817722747"},@{@"info":@"图片展示:",@"abstract":@""}];
    for(NSDictionary *dict in arr)
    {
        YHTHospitalDetailModel *model = [[YHTHospitalDetailModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [_dataArr addObject:model];
    }
    
    //创建医院详情界面
    [self creatHospitalInfoView];
    

    //加载医院详情数据
    [self loadHospitalInfoData];
}
#pragma mark -- 加载医院详情数据
- (void)loadHospitalInfoData
{
   
    NSString *url = [NSString stringWithFormat:@"http://www.hisforce.cn:3001/api/hospitals/%@",self.hospitalID];
    [YHTHttpRequestManager getUrl:url parameters:nil success:^(id data) {
        NSDictionary *data1 = YHTJsonParserWithData(data);
      //  NSLog(@"获取医院详情成功%@",data1[@"data"]);
    // NSLog(@"%@",[data1[@"data"]allValues]);
        for(NSDictionary *dict in data1[@"data"]){
            
        }
        
    } fail:^(NSError *error) {
        NSLog(@"获取医院详情失败%@",error);
    }];
}
#pragma mark --底下3个按钮
- (void)creatBottomBtn
{
    UIView *bottonView = [[UIView alloc]initWithFrame:CGRectMake(0, YHTScreenH-50-64, YHTScreenW, 50)];
    bottonView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    [self.view addSubview:bottonView];
  
    _favoriteBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 6, 50, 50)];
    //favoriteBtn.backgroundColor = [UIColor cyanColor];
   // favoriteBtn.imageView.backgroundColor = [UIColor redColor];
    //favoriteBtn.titleLabel.backgroundColor = [UIColor yellowColor];
    if(_isClick){
        [_favoriteBtn setImage:YHTImage(@"tab_favorite_btn_normal") forState:UIControlStateNormal];}
    [_favoriteBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [_favoriteBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -60, 8, -8)];
   // [_favoriteBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    _favoriteBtn.titleLabel.font = YHTFont(14);
    [_favoriteBtn setTitleColor:RGBACOLOR(172, 172, 172, 1) forState:UIControlStateNormal];
    [_favoriteBtn addTarget:self action:@selector(favoriteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottonView addSubview:_favoriteBtn];
    
    _consultBtn = [[UIButton alloc]initWithFrame:CGRectMake(40+50+MID, 6, 50, 50)];

    [_consultBtn setImage:YHTImage(@"tab_consult_btn_normal") forState:UIControlStateNormal];
    [_consultBtn setImage:YHTImage(@"tab_consult_btn_selected") forState:UIControlStateHighlighted];
    [_consultBtn setTitle:@"咨询" forState:UIControlStateNormal];
    [_consultBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -60, 8, -8)];
   // [_consultBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 5, 0)];
    _consultBtn.titleLabel.font = YHTFont(14);
    [_consultBtn setTitleColor:RGBACOLOR(172, 173, 172, 1) forState:UIControlStateNormal];
    [_consultBtn addTarget:self action:@selector(consultBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottonView addSubview:_consultBtn];
    
    _registrationBtn = [[UIButton alloc]initWithFrame:CGRectMake(40+2*(50+MID), 6, 50, 50)];
    [_registrationBtn setImage:YHTImage(@"tab_registration_btn_normal") forState:UIControlStateNormal];
    [_registrationBtn setImage:YHTImage(@"tab_registration_btn_selected") forState:UIControlStateSelected];
    [_registrationBtn setTitle:@"挂号" forState:UIControlStateNormal];
    [_registrationBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -60, 8, -8)];
     [_registrationBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 5, 0)];
    _registrationBtn.titleLabel.font = YHTFont(14);
    [_registrationBtn setTitleColor:RGBACOLOR(172, 173, 172, 1) forState:UIControlStateNormal];
    [_registrationBtn addTarget:self action:@selector(registrationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottonView addSubview:_registrationBtn];
}
#pragma mark -- 点击收藏按钮
- (void)favoriteBtnClick
{
    if(_isClick){
    [_favoriteBtn setImage:YHTImage(@"tab_favorite_btn_selected")forState:UIControlStateNormal];
        _isClick = NO;
    }
    else{
        [_favoriteBtn setImage:YHTImage(@"tab_favorite_btn_normal")forState:UIControlStateNormal];
        _isClick = YES;
    }
    
}
#pragma mark -- 点击咨询按钮
- (void)consultBtnClick
{
    //和客服聊天
    ChatViewController *chatVC = [[ChatViewController alloc]initWithChatter:@"kefu" isGroup:NO];
    [self.navigationController pushViewController:chatVC animated:YES];
}
#pragma mark -- 点击挂号按钮
- (void)registrationBtnClick
{
    YHTDepartmentController *departmentVC = [[YHTDepartmentController alloc]init];
    [self.navigationController pushViewController:departmentVC animated:YES];
}
#pragma mark -- 创建医院详情界面
- (void)creatHospitalInfoView
{
    _hospitalInfoTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, YHTScreenW, YHTScreenH-15-64-50) style:UITableViewStylePlain];
    _hospitalInfoTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _hospitalInfoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _hospitalInfoTable.delegate = self;
    _hospitalInfoTable.dataSource = self;
    [self.view addSubview:_hospitalInfoTable];
}
#pragma mark -- 代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTHospitalDetailCell *cell = [YHTHospitalDetailCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     if(indexPath.row == 3){
        UIButton *phoneBtn = [[UIButton alloc]initWithFrame:CGRectMake(100,45, 20, 20)];
        [phoneBtn setImage:YHTImage(@"home_dial_btn") forState:UIControlStateNormal];;
        [phoneBtn addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:phoneBtn];
    }
    if(indexPath.row == 4){
        YHTHospitalImgCell *cell = [YHTHospitalImgCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return cell;
}
#pragma mark -- 头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 155)];
    headerView.backgroundColor = [UIColor whiteColor];
    //医院图标
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100, 100)];
    img.image = YHTImage(@"hospital.jpg");
    [headerView addSubview:img];
    //医院名字
    UILabel  *name = [[UILabel alloc]initWithFrame:CGRectMake(img.maxX+30, 45, 200, 20)];
    name.text = @"上海中山医院";
    [headerView addSubview:name];
    
    //地理位子图标
    UIImageView *locaImg = [[UIImageView alloc]initWithFrame:CGRectMake(img.maxX+30, name.maxY+15, 12, 22)];
    locaImg.image = YHTImage(@"home_location");
    [headerView addSubview:locaImg];
    
    //位置
    UILabel  *locaLabel = [[UILabel alloc]initWithFrame:CGRectMake(locaImg.maxX+10, name.maxY+15, 80, 20)];
    locaLabel.textColor = RGBACOLOR(173, 137, 173, 1);
    locaLabel.font = YHTFont(12);
    locaLabel.text  = @"上海徐汇";
    [headerView addSubview:locaLabel];
    
    UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, img.maxY+20, YHTScreenW, 15)];
    bgImg.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    [headerView addSubview:bgImg];
    
    return headerView;
}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 155;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 4){
        return 380;
    }
    else{
        return [_dataArr[indexPath.row] cellHeight];
    }
}
#pragma mark -- 打电话
- (void)callPhone
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://021-8888888"]];
}

@end
