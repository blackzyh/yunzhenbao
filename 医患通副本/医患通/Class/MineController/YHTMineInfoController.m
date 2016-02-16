//
//  YHTMineInfoController.m
//  医患通
//
//  Created by 张耀华 on 16/2/3.
//  Copyright © 2016年 禾医科技. All rights reserved.
//

#import "YHTMineInfoController.h"
#import "YHTMineInfoModel.h"
#import "YHTMineInfoCell.h"
@interface YHTMineInfoController()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *_dataArr;
    UITableView    *_mineInfoTab;
    UIImageView    *_iconView;
    UIActionSheet  *_sheet;
    NSString       *_imagePath;//图片路径
    UIImage        *_image;//头像
    YHTMineInfoModel *_model;
    NSUserDefaults *_defaults;
}

@end

@implementation YHTMineInfoController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //根据图片路径载入图片
    _image = [UIImage imageWithContentsOfFile:_imagePath];
    if(_image == nil){
        //显示默认图片
        _iconView.image = YHTImage(@"head");
    }else{
        //显示保存过的
        _iconView.image = _image;
    }
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人信息";
    self.view.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    //获取沙盒目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定文件路径
    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"image.png"];
    _imagePath = imagePath;
    //创建个人信息界面
    [self creatMineInfoTab];
    //创建数据源
    [self creatData];
    
}
#pragma mark -- 创建个人信息界面
- (void)creatMineInfoTab{
    _mineInfoTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YHTScreenW, YHTScreenH-64) style:UITableViewStylePlain];
    _mineInfoTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mineInfoTab.scrollEnabled = NO;
    _mineInfoTab.backgroundColor = RGBACOLOR(248, 248, 248, 1);
    _mineInfoTab.delegate = self;
    _mineInfoTab.dataSource = self;
    [self.view addSubview:_mineInfoTab];
   
}

#pragma mark -- 数据源
- (void)creatData{
       _dataArr = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = @[@{@"title":@"头像",@"content":@""},@{@"title":@"姓名",@"content":@"张三"},@{@"title":@"性别",@"content":@"男"},@{@"title":@"出生日期",@"content":@"1990/09/17"},@{@"title":@"手机号码",@"content":@"13817722747"},@{@"title":@"地址",@"content":@"上海市浦东新区188号"}];
    
        for(NSDictionary *dict in array){
            YHTMineInfoModel *model = [[YHTMineInfoModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
            
        }
   
//    NSString *token = [YHTUserDefault valueForkey:@"token"];
//    NSDictionary *dict = @{@"token":token};
//    NSString *urlStr = [NSString stringWithFormat:@"http://www.hisforce.cn:3001/api/me?token=%@",token];
//    NSLog(@"%@",token);
//    [YHTHttpRequestManager getUrl:urlStr parameters:nil success:^(id data) {
//        NSString *userInfoData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"个人信息%@",userInfoData);
//    } fail:^(NSError *error) {
//        NSLog(@"获取个人信息失败%@",error);
//    }];
    
    NSDictionary *dict = @{@"name":@"hahah"};
   
    [YHTHttpRequestManager putUrl:@"http://www.hisforce.cn:3001/api/me" paramenters:dict success:^(id data) {
        
        NSLog(@"修改个人信息成功%@",data);
    } fail:^(NSError *error) {
        NSLog(@"%@",error.description);
    }];
    
    
    
}

#pragma mark -- 代理和数据
#pragma mark -- cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
#pragma mark -- cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}
#pragma mark -- 数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHTMineInfoCell *cell = [YHTMineInfoCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    if(indexPath.row == 0){
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(YHTScreenW-40-40, 10, 40, 40)];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 20;
        _iconView.image = _image;
    [cell addSubview:_iconView];
        return cell;
  }
  
   
    return cell;
}
#pragma mark -- 选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.1];
    if(indexPath.row == 0){
        _sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选择",@"拍照", nil];
      [_sheet showInView:self.view];
        
    }
//    if(indexPath.row == 1){
//        _model = _dataArr[indexPath.row];
//        _model.content = @"lisi";
//        [_mineInfoTab reloadData];
//        _defaults = [NSUserDefaults standardUserDefaults];
//        [_defaults setObject:_model.content forKey:@"nicheng"];
//        [_defaults synchronize];
//     
//    }
    
}
#pragma mark -- 选中效果
-(void)unselectCell:(id)sender{
    [_mineInfoTab deselectRowAtIndexPath:[_mineInfoTab indexPathForSelectedRow] animated:YES];
}
#pragma mark -- actionSheet代理
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
            case 0:
            //从相册选择
            [self localPhoto];
            break;
            case 1:
            //拍照
            [self takePhoto];
            default:
            break;
    }
}
#pragma mark -- 从相册选择  
- (void)localPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];

}
#pragma mark -- 拍照
- (void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //是否有相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        return;
    }
    
}
#pragma mark -- imagePicker代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info
{
     UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if(image!= nil){
        _iconView.image = image;
        NSData *data;
        if(UIImagePNGRepresentation(image)){
            data = UIImagePNGRepresentation(image);
        }else{
            data = UIImageJPEGRepresentation(image, 0.0001);
        }
        //保存图片
        [data writeToFile:_imagePath atomically:NO];

    }
    
    else{
        return;
    }
    // 关闭相册
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
@end
