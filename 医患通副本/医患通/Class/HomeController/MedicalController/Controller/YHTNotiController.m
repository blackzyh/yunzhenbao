//
//  YHTNotiController.m
//  医患通
//
//  Created by 张耀华 on 16/1/17.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTNotiController.h"
#import "YHTChooseTimeController.h"
@interface YHTNotiController ()<UITableViewDataSource,UITableViewDelegate,sendValueDelegate>
{
    UITableView *_notiTableView;
    UITextField     *_label;
    UILabel     *_timeLabe;
}
@end

@implementation YHTNotiController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"提醒设置";
    //提醒界面
    [self creatNotiTable];
}
#pragma mark -- 提醒界面
- (void)creatNotiTable
{
    _notiTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _notiTableView.delegate = self;
    _notiTableView.dataSource = self;
    [self.view addSubview:_notiTableView];
    
}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
    if(indexPath.row == 0){
        //UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(160, 12, 300, 20)];
        UITextField *label = [[UITextField alloc]initWithFrame:CGRectMake(160, 12, 300, 20)];
        
        label.font = YHTFont(14);
        label.textColor = [UIColor redColor];
        _label = label;
        [cell.contentView addSubview:label];
        UILabel *left = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, 100, 20)];
        left.text = @"提示语:";
        left.textAlignment = NSTextAlignmentCenter;
        left.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:left];
        //开启跑马灯
        [self startMarquee];
    }
    if(indexPath.row == 1){
        UILabel *left = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, 100, 20)];
        left.text = @"提醒开关";
        left.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:left];
        
        UISwitch *switchBtn = [[UISwitch alloc]initWithFrame:CGRectMake(YHTScreenW-10-80, 7, 80, 20)];
        [switchBtn setOn:YES];
        [switchBtn addTarget:self action:@selector(switchBtnClick) forControlEvents:(UIControlEventValueChanged)];
        [cell.contentView addSubview:switchBtn];
    }
    if(indexPath.row == 2){
        [cell setAccessoryType:(UITableViewCellAccessoryDisclosureIndicator)];
        UILabel *left = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, 100, 20)];
        left.text = @"日期:";
        left.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:left];
        
        _timeLabe = [[UILabel alloc]initWithFrame:CGRectMake(YHTScreenW-30-80, 12, 80, 20)];
        _timeLabe.textColor = [UIColor blackColor];
        _timeLabe.text = @"全天";
        _timeLabe.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:_timeLabe];
    }
    if(indexPath.row == 3){
        [cell setAccessoryType:(UITableViewCellAccessoryDisclosureIndicator)];
        UILabel *left = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, 100, 20)];
        left.text = @"提醒时间:";
        left.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:left];
    }
    return cell;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2){
        YHTChooseTimeController *chooseTime = [[YHTChooseTimeController alloc]init];
        chooseTime.delegate = self;
        [self.navigationController pushViewController:chooseTime animated:YES];
        }if(indexPath.row == 3){
        
    }
}
#pragma mark -- 代理传值
- (void)sentTime:(NSString *)time
{
    _timeLabe.text = time;
}
#pragma mark -- 跑马灯
- (void)startMarquee{
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    
    CGRect rect=[_label.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    _label.text = @"良药苦口利于病,按时用药早日康复";
    CGFloat width = rect.size.width;
    _label.frame = CGRectMake(160, 12, width, 20);
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(- (width/2), _label.layer.position.y)];
    ani.duration = width / 60;
    ani.delegate = self;
    //ani.fillMode = kCAFillModeForwards;
    
    [_label.layer addAnimation:ani forKey:nil];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    // 重新开始跑马灯效果
    [self startMarquee];
}
#pragma mark -- 点击switchBtn
- (void)switchBtnClick
{
    
}
@end
