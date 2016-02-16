//
//  YHTConsultController.m
//  医患通
//
//  Created by 张耀华 on 16/1/12.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTConsultController.h"
#import "ChatViewController.h"
#import "EMIMHelper.h"
#import "EMRobot.h"
#import "EaseMob.h"
@interface YHTConsultController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  *_consultTable;
}
@end

@implementation YHTConsultController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //分割线
    UIImageView *cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(0,YHTScreenH-50-64,YHTScreenW,0.5)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 1;
    [self.view addSubview:cutLine];

    self.navigationItem.title = @"咨询";
    _consultTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, YHTScreenH-64-51) style:UITableViewStylePlain];
    _consultTable.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _consultTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _consultTable.delegate = self;
    _consultTable.dataSource = self;
    [self.view addSubview:_consultTable];
    
//    //登录
//    [[EMIMHelper defaultHelper] loginEasemobSDK];
//    
//    UIButton *chatBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 300, 50)];
//    chatBtn.backgroundColor = [UIColor yellowColor];
//    [chatBtn setTitle:@"联系客服" forState:UIControlStateNormal];
//    [chatBtn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:chatBtn];
//    
//    UIButton *chatBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 300, 50)];
//    chatBtn1.backgroundColor = [UIColor yellowColor];
//    [chatBtn1 setTitle:@"注销" forState:UIControlStateNormal];
//    [chatBtn1 addTarget:self action:@selector(btnclick1) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:chatBtn1];
    
    

}
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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

        UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
        iconView.image = YHTImage(@"doctor.jpg");
       // iconView.layer.cornerRadius = 25;
        [cell addSubview:iconView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(iconView.maxX+15, 15, 100, 20)];
    nameLabel.text = @"张大谨";
    nameLabel.textColor = [UIColor blackColor];
    [cell addSubview:nameLabel];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(iconView.maxX+15, nameLabel.maxY+5, 100, 20)];
    detailLabel.text = @"昆山同济口腔医院";
    detailLabel.font = YHTFont(12);
    detailLabel.textColor = RGBACOLOR(172, 172,172, 1);
    [cell addSubview:detailLabel];
    
   UIImageView* cutLine = [[UIImageView alloc]initWithFrame:CGRectMake(15,79,YHTScreenW-15,1)];
    cutLine.backgroundColor = [UIColor lightGrayColor];
    cutLine.alpha = 0.2;
    [cell addSubview:cutLine];
    return cell;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark -- 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //和客服聊天
    ChatViewController *chatVC = [[ChatViewController alloc]initWithChatter:@"kefu" isGroup:NO];
    [self.navigationController pushViewController:chatVC animated:YES];

}
#pragma mark -- 删除cell
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //删除数据的操作
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        //数据源删除
//       // NSMutableArray *sectionArray = _dataArray[indexPath.row];
//        //[sectionArray removeObjectAtIndex:indexPath.row];
//        
//        //UI上面的删除
//        
//         NSArray *array = @[indexPath];
//         [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
//         
//        
//        //刷新表格视图
//        [tableView reloadData];
//    }
//    
//}

- (void)btnclick
{
   
    //和客服聊天
    ChatViewController *chatVC1 = [[ChatViewController alloc]initWithChatter:@"kefu" isGroup:NO];
       NSLog(@"%@",chatVC1.chatter);

    
    
    [self.navigationController pushViewController:chatVC1 animated:YES];
}

- (void)btnclick1
{
//    [[EMIMHelper defaultHelper] loginEasemobSDK];
//
//    ChatViewController *chatVC2 = [[ChatViewController alloc]initWithChatter:@"kefu2" isGroup:NO];
//   
//    NSLog(@"%@",chatVC2.chatter);
//    
//    
//    [self.navigationController pushViewController:chatVC2 animated:YES];
    //注销
    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES];

}
@end
