//
//  YHTOrderController.m
//  医患通
//
//  Created by 张耀华 on 16/1/16.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTOrderController.h"
#import "YHTDoctorView.h"
#import "YHTOrderCell.h"
#import "YHTDoctorDetailCell.h"
#import "YHTDoctorDetailModel.h"
#import "YHTCommentCell.h"
#define BTNW YHTScreenW/3
@interface YHTOrderController ()<UITableViewDataSource,UITableViewDelegate>

{
    UIWindow    *_window;
    //是否被点击
    BOOL        _isClick;
    //医生信息
    UIView      *_doctorView;
    
    UIImageView *_logo;
    UILabel     *_name;
    UILabel     *_hospitalKeshi;
    UILabel     *_money;
    //门诊时间
    UIButton    *_timeBtn;
    //详细信息
    UIButton    *_detailBtn;
    
    //预约时间表
    UITableView *_orderTimeTable;
    
    //医生详情表
    UITableView *_doctorDetailTable;
    
    //底部视图
    UIView      *_bottomView;
    
    //当前剩余时间
    UILabel     *_label;
    
    //医生详情数据
    NSMutableArray *_docDataArr;
}
@property (nonatomic,strong)UITableView *detailTimeTable;
@property (nonatomic,strong)UIImageView *flapView;//蒙板

@end

@implementation YHTOrderController
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [_detailTimeTable removeFromSuperview];
    [_flapView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _window = [[UIApplication sharedApplication].delegate window];
    //数据源初始化
    _docDataArr = [NSMutableArray arrayWithCapacity:0];
    
    _isClick = YES;
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    self.title = @"医生";
    
    //医生信息
    [self creatDoctorInfo];
    
    //底部视图
    [self creatBottomView];
    
    //门诊时间
    [self creatTimeTableView];
    
    //详细门诊时间
    [self creatDetailTime];
    
    //加载医生详情数据
    [self loadDocData];
}
//懒加载
- (UITableView *)detailTimeTable
{
    
    if(!_detailTimeTable)
    {
        _detailTimeTable = [[UITableView alloc]initWithFrame:CGRectMake(YHTScreenW, 0, YHTScreenW, YHTScreenH) style:UITableViewStylePlain];
        _detailTimeTable.backgroundColor = [UIColor whiteColor];
        _detailTimeTable.delegate = self;
        _detailTimeTable.dataSource = self;
        _detailTimeTable.tableHeaderView = _label;
        [_window addSubview:_detailTimeTable];
    }
    return _detailTimeTable;
}
- (UIImageView *)flapView
{
    if(!_flapView){
        _flapView = [[UIImageView alloc]initWithFrame:CGRectMake(YHTScreenW, 0, YHTScreenW, YHTScreenH)];
        _flapView.backgroundColor = [UIColor blackColor];
        _flapView.alpha = 0.2;
        [_window addSubview:_flapView];
    }
    return _flapView;
}
#pragma mark -- 加载医生详情数据
- (void)loadDocData
{
    NSArray *arr = @[@{@"doctorTitle":@"医生简介",@"doctorInfo":@"李刚是一个专注于内科10年的医生李刚是一个专注于内科10年的医生"},@{@"doctorTitle":@"医生擅长",@"doctorInfo":@"李刚是一个专注于内科10年的医生李刚是一个专注于内科10年的医生"},@{@"doctorTitle":@"荣誉证书",@"doctorZhengshu":@"zhengshu.jpg"},@{@"doctorTitle":@"评论",@"doctorInfo":@""}];
    for(NSDictionary *dict in arr){
        YHTDoctorDetailModel *model = [[YHTDoctorDetailModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [_docDataArr addObject:model];
    }
}
#pragma mark -- 医生信息
- (void)creatDoctorInfo
{
    _doctorView = [[UIView alloc]init];
    _doctorView.frame = CGRectMake(0, 15, YHTScreenW, 120);
    _doctorView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_doctorView];
    
    _logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 70, 70)];
    _logo.image = YHTImage(@"doctor.jpg");
    [_doctorView addSubview:_logo];
    
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(_logo.maxX+30, 15, 100, 20)];
    _name.textColor = [UIColor blackColor];
    _name.text = @"李刚";
    [_doctorView addSubview:_name];
    
    _hospitalKeshi = [[UILabel alloc]initWithFrame:CGRectMake(_logo.maxX+30, _name.maxY+5, 200, 20)];
    _hospitalKeshi.font = YHTFont(15);
    _hospitalKeshi.textColor =  RGBACOLOR(172, 172, 172, 1);
    _hospitalKeshi.text = @"上海中山医院 儿科";
    [_doctorView addSubview:_hospitalKeshi];
    
    _money = [[UILabel alloc]initWithFrame:CGRectMake(_logo.maxX+30, _hospitalKeshi.maxY+5, 200, 20)];
    _money.font = YHTFont(15);
    _money.textColor = RGBACOLOR(172, 172, 172, 1);
    _money.text = @"挂号费: ¥20";
    [_doctorView addSubview:_money];
    
    _timeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 150, YHTScreenW/2, 50)];
    _timeBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [_timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_timeBtn setTitle:@"门诊时间" forState:UIControlStateNormal];
    [_timeBtn addTarget:self action:@selector(timeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_timeBtn];
    
    _detailBtn = [[UIButton alloc]initWithFrame:CGRectMake(_timeBtn.maxX, 150, YHTScreenW/2, 50)];
    _detailBtn.backgroundColor = [UIColor whiteColor];
    [_detailBtn setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    [_detailBtn setTitle:@"医生详情" forState:UIControlStateNormal];
    [_detailBtn addTarget:self action:@selector(detailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_detailBtn];

}
#pragma mark -- 门诊时间
- (void)creatTimeTableView
{
    _orderTimeTable = [[UITableView alloc]initWithFrame:CGRectMake(0, _timeBtn.maxY+15, YHTScreenW, YHTScreenH-64-_timeBtn.maxY-15-50)style:UITableViewStylePlain];
    _orderTimeTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _orderTimeTable.delegate = self;
    _orderTimeTable.dataSource = self;
    [self.view addSubview:_orderTimeTable];
                                                                  
}
#pragma mark -- 底部视图
- (void)creatBottomView
{
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,_orderTimeTable.maxY,YHTScreenW,0.5)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 1;
    [self.view addSubview:cutLine];
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, YHTScreenH-(64+50), YHTScreenW, 50)];
    _bottomView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    [self.view addSubview:_bottomView];
    NSArray *imgnormalArr = @[@"tab_zan_btn_normal_0",@"tab_comment_btn_normal_1",@"tab_favorite_btn_normal_2"];
    NSArray *selectImgArr = @[@"tab_zan_btn_selected_0",@"tab_comment_btn_selected_1",@"tab_favorite_btn_selected_2"];
    for(int i=0;i<3;i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*BTNW, 0, BTNW, 50)];
        btn.tag = i+1;
       // [btn setTitle:[NSString stringWithFormat:@"%d",i+10] forState:UIControlStateNormal];
        [btn setTitleColor:RGBACOLOR(172, 172, 172, 1) forState:UIControlStateNormal];
        [btn setImage:YHTImage(imgnormalArr[i]) forState:UIControlStateNormal];
        [btn setImage:YHTImage(selectImgArr[i]) forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btn];
    }
    
}
#pragma mark -- 点击下面3个按钮
- (void)btnClick:(UIButton *)btn
{
    static int i = 1;
    switch (btn.tag) {
        case 1:
            [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            i++;
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
    
}

#pragma mark -- 详细门诊时间
- (void)creatDetailTime
{
    
}

#pragma mark -- 点击门诊时间
- (void)timeBtnClick
{
    _detailBtn.backgroundColor = [UIColor whiteColor];
    [_detailBtn setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    _timeBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [_timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_doctorDetailTable removeFromSuperview];
    [self.view addSubview:_orderTimeTable];
}
#pragma mark -- 点击医生详情
- (void)detailBtnClick
{
     _detailBtn.backgroundColor = RGBACOLOR(0, 195, 219, 1);
    [_detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _timeBtn.backgroundColor = [UIColor whiteColor];
    [_timeBtn setTitleColor:RGBACOLOR(0, 195, 219, 1) forState:UIControlStateNormal];
    
    [_orderTimeTable removeFromSuperview];
    _doctorDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, _timeBtn.maxY+15, YHTScreenW, YHTScreenH-64-_timeBtn.maxY-15-50)style:UITableViewStylePlain];
    _doctorDetailTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _doctorDetailTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _doctorDetailTable.delegate = self;
    _doctorDetailTable.dataSource = self;
    [self.view addSubview:_doctorDetailTable];
    
    
}
#pragma mark -- 代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _orderTimeTable){
        return 10;
    }else if(tableView == _doctorDetailTable){
        return _docDataArr.count;
    }else
        return 10;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _orderTimeTable){
    YHTOrderCell *cell = [YHTOrderCell cellWithTableView:tableView];
        return cell;
    }else if(tableView == _doctorDetailTable){
        if(indexPath.row<3){
        YHTDoctorDetailCell *cell = [YHTDoctorDetailCell cellWithTableView:tableView indexPath:indexPath];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
         cell.model = _docDataArr[indexPath.row];
            return cell;
        }
        else{
            YHTCommentCell *cell = [YHTCommentCell cellWithTableView:tableView];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
      
    }
    else{
        static NSString *ID = @"detailTimecell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.textLabel.font = YHTFont(14);
        if(indexPath.row == 0){
            cell.textLabel.text = @"当前可约时间段:";
            return cell;
        }
        cell.textLabel.text = @"08:00-08:30 (5/5)";
            return cell;

    }
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _orderTimeTable||tableView == _detailTimeTable){
        return 44;
    }
    else if (tableView == _doctorDetailTable&&(indexPath.row<2)){
        return 140;
    }
    else if(tableView == _doctorDetailTable&&(indexPath.row == 2)){
        return 180;
    }
    else{
        return 35+103*(indexPath.row+1);
        
    }
    
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _orderTimeTable){
    if(_isClick){
    self.flapView.frame = CGRectMake(0, 0, YHTScreenW, YHTScreenH);
    [UIView animateWithDuration:0.5 animations:^{
    self.detailTimeTable.frame = CGRectMake(YHTScreenW-200, 0, YHTScreenW, YHTScreenH);
         _isClick = NO;
    }];
    }
}  if(tableView == _detailTimeTable){
    self.flapView.frame = CGRectMake(YHTScreenW, 0, YHTScreenW, YHTScreenH);
    [UIView animateWithDuration:0.5 animations:^{
    self.detailTimeTable.frame = CGRectMake(YHTScreenW, 0, YHTScreenW, YHTScreenH);
            _isClick = YES;
        }];

    }
    
}

@end
