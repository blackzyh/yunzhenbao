//
//  YHTSearchController.m
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTSearchController.h"
#import "YHTSearchBar.h"
#import "YHTDoctorCell.h"
#import "YHTTRegisterdCell.h"
#import "YHTDoctorController.h"
#import "YHTRegistController.h"
#import "YHTHospitalInfoController.h"
#import "YHTOrderController.h"
@interface YHTSearchController()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)YHTSearchBar *searchBar;//搜索栏
@property (nonatomic,strong)UIView       *navView;//自定义导航
@property (nonatomic,strong)UIButton     *cancelBtn;//取消按钮



@end
@implementation YHTSearchController
//懒加载
- (NSMutableArray *)dateArr
{
    if(!_dateArr)
    {
        self.dateArr = [NSMutableArray array];
    }
    return _dateArr;
}
#pragma mark -- 视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad
{
     [super viewDidLoad];
       self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    //创建自定义导航
    [self creatDIYNav];
    //创建搜索
    [self creatSearchBar];
    //创建取消按钮
    [self creatCancelBtn];
    //创建搜索界面
    [self creatSearchView];
    
    
}

#pragma mark -- 自定义导航
- (void)creatDIYNav
{
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 64)];
    _navView.backgroundColor = [UIColor colorWithPatternImage:YHTImage(@"nav_bg")];
    [self.view addSubview:_navView];
}
#pragma mark -- 导航搜索
- (void)creatSearchBar
{
    self.searchBar = [YHTSearchBar searchBar];
    _searchBar.frame = CGRectMake(15, 25,250, 31);
   AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    _searchBar.width = _searchBar.width*app.autoSizeScaleX;
    _searchBar.delegate = self;
    [_navView addSubview:_searchBar];
}
#pragma mark -- 取消按钮
- (void)creatCancelBtn
{
    self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(_searchBar.maxX, 25, YHTScreenW-_searchBar.width-15,31)];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelBtn];
}
#pragma mark -- 点击取消按钮
- (void)cancelBtnClick
{
    [self.delegate sendArr:self.dateArr];
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden  = NO;
    
}
#pragma mark -- 创建搜索界面
- (void)creatSearchView
{
    self.searchTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, YHTScreenW, YHTScreenH-64) style:UITableViewStylePlain];
    _searchTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _searchTabView.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _searchTabView.delegate = self;
    _searchTabView.dataSource = self;
    [self.view addSubview:_searchTabView];
}
#pragma mark -- 返回几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_searchTabView == tableView){
        return 1;
    }else{
        return 2;
    }
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_searchTabView == tableView){
        return self.dateArr.count;
    }else{
        return 3;
    }
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_searchTabView == tableView){
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = _dateArr[indexPath.row];
        //右边删除按钮
        UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-40-6, 4, 40, 40)];
        [deleteBtn setBackgroundImage:YHTImage(@"home_delete_round_btn") forState:UIControlStateNormal];
        deleteBtn.tag = indexPath.row;
        [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:deleteBtn];
        
        //底部下划线
        UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,45,YHTScreenW-15,0.5)];
        cutLine.backgroundColor = [UIColor lightGrayColor];
        cutLine.alpha = 0.2;
        [cell addSubview:cutLine];
        return cell;
    }else
    {
        if(indexPath.section == 0){
            
            YHTTRegisterdCell *cell = [YHTTRegisterdCell cellWithTableView:tableView];
            return cell;

        }
        else{
            YHTDoctorCell *cell = [YHTDoctorCell cellWithTableView:tableView];
            return cell;
            }
    }

}

#pragma mark -- 点击右边删除按钮
- (void)deleteBtnClick:(UIButton *)deleteBtn
{
    [_dateArr removeObjectAtIndex:deleteBtn.tag];
    [_searchTabView reloadData];
}
#pragma mark -- 头部视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(_searchTabView == tableView){
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 45)];
    view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    UILabel *searchHistory = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
    searchHistory.font = YHTFont(17);
    searchHistory.text = @"搜索历史";
    searchHistory.textColor = RGBACOLOR(0, 195, 219, 1);
    [view addSubview:searchHistory];
    UIButton *clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-51,8, 51, 26)];
    clearBtn.layer.cornerRadius = 12;
    clearBtn.backgroundColor = RGBACOLOR(231, 231, 230, 1);
    [clearBtn setTitle:@"清空" forState:UIControlStateNormal];
    [clearBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearBtnClick) forControlEvents:UIControlEventTouchUpInside];
    clearBtn.titleLabel.font = YHTFont(14);
    [view addSubview:clearBtn];
        return view;
    }
    else {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, 45)];
        view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
        if(section == 0){
        UILabel *doctorLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
        doctorLabel.font = YHTFont(17);
        doctorLabel.text = @"医院";
        doctorLabel.textColor = RGBACOLOR(27, 183, 204, 1);
        [view addSubview:doctorLabel];
        }
        if(section == 1){
            UILabel *doctorLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
            doctorLabel.font = YHTFont(17);
            doctorLabel.text = @"医生";
            doctorLabel.textColor = RGBACOLOR(27, 183, 204, 1);
            [view addSubview:doctorLabel];
        }
        UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(YHTScreenW-15-51,8, 51, 26)];
        moreBtn.tag = section+10;
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [moreBtn setTitleColor:RGBACOLOR(27, 183, 204, 1) forState:UIControlStateNormal];
        [moreBtn setImage:YHTImage(@"home_more_back_btn") forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.titleLabel.font = YHTFont(12);
        [moreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -50)];
        [moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [view addSubview:moreBtn];
        return view;

    }
}
#pragma mark -- 头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
#pragma mark -- 尾部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_searchTabView == tableView){
        return 45;
    }else{
        if(indexPath.section == 0){
            return 80;
        }else
            return 90;
    }
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_searchTabView == tableView){
        
    }
    else{
        if(indexPath.section == 0){
            YHTHospitalInfoController *hospitalInfoVC = [[YHTHospitalInfoController alloc]init];
            [self.navigationController pushViewController:hospitalInfoVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
        }
        else{
            YHTOrderController *orderVC = [[YHTOrderController alloc]init];
            [self.navigationController pushViewController:orderVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
        }
    }
}
#pragma mark -- 点击清除按钮
- (void)clearBtnClick
{
    [_dateArr removeAllObjects];
    [_searchTabView reloadData];
}
#pragma mark -- textfieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_searchBar resignFirstResponder];
    [self.dateArr addObject:textField.text];
    textField.text = nil;
   [_searchTabView reloadData];
    [self creatResultView];
    return YES;
}
#pragma mark -- 搜索结果
- (void)creatResultView
{
    self.resultTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, YHTScreenW, YHTScreenH-64) style:UITableViewStyleGrouped];
    _resultTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _resultTabView.delegate = self;
    _resultTabView.dataSource = self;
    [self.view addSubview:_resultTabView];

}
#pragma mark -- 点击更多按钮
- (void)moreBtnClick:(UIButton *)btn
{
    if(btn.tag == 10){
        YHTRegistController *regVC = [[YHTRegistController alloc]init];
        [self.navigationController pushViewController:regVC animated:YES];
    }
    else
    {
        YHTDoctorController *docVC = [[YHTDoctorController alloc]init];
        [self.navigationController pushViewController:docVC animated:YES];
    }
}

@end
