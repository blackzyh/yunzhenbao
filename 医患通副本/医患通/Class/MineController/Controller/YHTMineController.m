//
//  YHTMineController.m
//  医患通
//
//  Created by 张耀华 on 16/1/12.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineController.h"
#import "YHTMineCell.h"
#import "YHTMineModel.h"
#import "YHTMineRegController.h"
#import "YHTCollectController.h"
#import "YHTSystemController.h"
#import "YHTSetController.h"
#import "YHTMineInfoController.h"
@interface YHTMineController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mineTableView;
    
    UIView      *_topView;//头部视图
    
    NSMutableArray *_dataArr;
    
    UIImage    *_image;//头像
}
@property (nonatomic,strong)UIImageView *iconView;
@property (nonatomic,strong)UILabel     *nameLabel;
@property (nonatomic,strong)UILabel     *phoneNumber;

@end

@implementation YHTMineController
#pragma mark -- 视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //载入头像
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"image.png"];
    _image = [UIImage imageWithContentsOfFile:imagePath];
    if(_image == nil){
        //显示默认图片
        _iconView.image = YHTImage(@"head");
    }else{
        //显示保存过的
        _iconView.image = _image;
    }

    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
#pragma mark -- 视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    //分割线
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,YHTScreenH-50-64,YHTScreenW,0.5)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 1;
    [self.view addSubview:cutLine];
    
    //创建头部视图
    [self creatTopView];
    //创建我的界面
    [self creatMineView];
    
    //数据源
    [self creatData];
  
    
}
#pragma mark -- 数据源
- (void)creatData
{
    NSArray *data = @[@{@"icon":@"guahao",@"title":@"我的挂号"},@{@"icon":@"shoucang",@"title":@"我的收藏"},@{@"icon":@"xiaoxi",@"title":@"系统消息"},@{@"icon":@"shezhi",@"title":@"设置"}];
    for(NSDictionary *dict in data){
        YHTMineModel *model = [[YHTMineModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [_dataArr addObject:model];
    }
}
#pragma mark --创建我的界面
- (void)creatMineView
{
    _mineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, YHTScreenH-51) style:UITableViewStylePlain];
    _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mineTableView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _mineTableView.tableHeaderView = _topView;
    _mineTableView.scrollEnabled = NO;
    _mineTableView.delegate = self;
    _mineTableView.dataSource = self;
    [self.view addSubview:_mineTableView];
}
#pragma mark --创建头部视图
- (void)creatTopView
{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 200)];
    _topView.backgroundColor = [UIColor colorWithPatternImage:YHTImage(@"bgd_center")];
    
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 90, 90)];
    _iconView.center = CGPointMake(YHTScreenW/2, _topView.height/2);
    _iconView.layer.cornerRadius = 45;
    _iconView.clipsToBounds = YES;
    _iconView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickIcon)];
    [_iconView addGestureRecognizer:tap];
    _iconView.image = _image;
    [_topView addSubview:_iconView];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _iconView.maxY+17, 100, 20)];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.center = CGPointMake(YHTScreenW/2, _iconView.maxY+17);
    _nameLabel.font = YHTFont(17);
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = @"未登录";
    [_topView addSubview:_nameLabel];
    
}
#pragma mark -- 点击头像
- (void)clickIcon
{
    YHTMineInfoController *mineInfoVC = [[YHTMineInfoController alloc]init];
    [self.navigationController pushViewController:mineInfoVC animated:YES];
}

#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMineCell *cell = [YHTMineCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
     return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //我的挂号
    if(indexPath.row == 0){
        YHTMineRegController *mineReg = [[YHTMineRegController alloc]init];
        [self.navigationController pushViewController:mineReg animated:YES];
        
        
    }
    //我的收藏
    if(indexPath.row == 1){
        YHTCollectController *collectVC = [[YHTCollectController alloc]init];
        [self.navigationController pushViewController:collectVC animated:YES];
        }
    //系统消息
    if(indexPath.row == 2){
        YHTSystemController *systemVC = [[YHTSystemController alloc]init];
        [self.navigationController pushViewController:systemVC animated:YES];
        
    }
    //设置
    if(indexPath.row == 3)
    {
        YHTSetController *setVC = [[YHTSetController alloc]init];
        [self.navigationController pushViewController:setVC animated:YES];
    }
}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}
@end
