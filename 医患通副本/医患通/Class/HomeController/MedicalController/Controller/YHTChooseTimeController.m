//
//  YHTChooseTimeController.m
//  医患通
//
//  Created by 张耀华 on 16/1/20.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTChooseTimeController.h"
@interface YHTChooseTimeController()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_timeView;
}
@property (nonatomic,strong)NSArray *dateArr;
@end
@implementation YHTChooseTimeController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择时段";
    //创建时间列表
    [self creatTimeView];
}
//懒加载
- (NSArray *)dateArr
{
    if(!_dateArr){
        self.dateArr = @[@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"15:30",@"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"19:30",@"20:00",@"20:30",@"21:00",@"21:30",@"22:00"];
    }
    return _dateArr;
}
#pragma mark -- 时间表
- (void)creatTimeView
{
    _timeView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, YHTScreenH-64) style:UITableViewStylePlain];
    _timeView.delegate = self;
    _timeView.dataSource= self;
    [self.view addSubview:_timeView];
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dateArr.count;
}
#pragma mark -- 数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = _dateArr[indexPath.row];
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *time = _dateArr[indexPath.row];
    [self.delegate sentTime:time];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
