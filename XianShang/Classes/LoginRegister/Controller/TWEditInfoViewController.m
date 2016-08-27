//
//  TWEditInfoViewController.m
//  XianShang
//
//  Created by Apple on 16/7/3.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWEditInfoViewController.h"
#import "TWEditViewController.h"
#import <SVProgressHUD.h>
#import "ImageTool.h"
#import "TWInfoTableViewCell.h"
@interface TWEditInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, weak) UIImageView *imgView;

@end

@implementation TWEditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑个人信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳过" style:UIBarButtonItemStyleDone target:self action:@selector(finish)];
    [self.navigationItem.rightBarButtonItem setTintColor:TWRGBColor(88, 121, 205)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = TWRGBColor(247, 247, 247);
    view.frame = CGRectMake(0,0,TWScreenW,TWScreenH-384);
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake((TWScreenW - 260)/2, 65, 260, 45);
    btn.backgroundColor = TWRGBColor(255, 85, 85);
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:5.0];
    [view addSubview:btn];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    self.tableView.tableFooterView = view;
    //省
    _province = @[@"北京", @"广西", @"广东"];
    //市
    _city = @{
              @"北京":@[@"朝阳区", @"东城区", @"西城区"],
              @"广西":@[@"桂林市", @"南宁市"],
              @"广东":@[@"惠州市", @"广州市", @"深圳市",@"东莞市"]
              };
    _country = @{
                 @"朝阳区":@[@"朝阳区1", @"朝阳区2", @"朝阳区3"],
                 @"东城区":@[@"东城区1", @"东城区2",@"东城区3",@"东城区4"],
                 @"西城区":@[@"西城区1", @"西城区2", @"西城区3",@"西城区4"],
                 @"桂林市":@[@"桂林市1", @"桂林市2", @"桂林市3"],
                 @"南宁市":@[@"南宁市1", @"南宁市2",@"南宁市3",@"南宁市4"],
                 @"惠州市":@[@"惠州市1", @"惠州市2", @"惠州市3",@"惠州市4"],
                 @"广州市":@[@"广州市1", @"广州市2", @"广州市3"],
                 @"深圳市":@[@"深圳市1", @"深圳市2",@"深圳市3",@"深圳市4"],
                 @"东莞市":@[@"东莞市1", @"东莞市2", @"东莞市3",@"东莞市4"],
                 };
    
}

- (void)finish{
    
}

#pragma mark -- UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"editinfo";
    TWInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[TWInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(TWScreenW-21, 15, 11, 20)];
        imageView.image = [UIImage imageNamed:@"方向---右"];
        [cell.contentView addSubview:imageView];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 49, TWScreenW, 1)];
        view.backgroundColor = TWRGBColor(217, 217, 217);
        [cell addSubview:view];
        if(indexPath.row==0){
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TWScreenW, 1)];
            view.backgroundColor = TWRGBColor(217, 217, 217);
            [cell addSubview:view];
            
        }
        
        if (indexPath.section == 0) {
            if(indexPath.row==0){
                // 头像图标
                UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(TWScreenW-76, 5, 40, 40)];
                imageview.layer.masksToBounds=YES;
                imageview.layer.cornerRadius=20;
                imageview.image = [UIImage imageNamed:@"xianshang"];
                [cell.contentView addSubview:imageview];
                cell.textLabel.text=@"设置头像";
                
            }else {
                
                NSArray *array = @[@"设置头像",@"昵称",@"性别"];
                NSArray *array1 = @[@"",@"小明",@"男"];
                cell.textLabel.text=array[indexPath.row];
                cell.detailTextLabel.text = array1[indexPath.row];
                
                
                    }
        }else{
            NSArray *array = @[@"我的行业",@"公司",@"所在地"];
            NSArray *array1 = @[@"互联网",@"杭州网络急急急有限",@"杭州"];
            cell.textLabel.text=array[indexPath.row];
            cell.detailTextLabel.text = array1[indexPath.row];
        }

    }
        
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        if(indexPath.row==0){
            
            UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机",@"相册",nil];
            [actionSheet showInView:self.tableView];
        }
        if(indexPath.row==1){
            TWEditViewController *evc = [[TWEditViewController alloc]init];
            evc.delegate = self;
            // 从沙盒中读取昵称
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            evc.name = [defaults objectForKey:@"name"];
            if (evc.name.length == 0) {
//                TWAccount *accout = [TWAccountTool account];
//                evc.name = accout.member_nickname;
            }
            
            
            [self.navigationController pushViewController:evc animated:YES];
        }
        if(indexPath.row==2){
            
         
            
        }
        if (indexPath.row == 3) {
            TWEditViewController *evc = [[TWEditViewController alloc]init];
            evc.delegate = self;
            // 从沙盒中读取昵称
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            evc.name = [defaults objectForKey:@"name"];
            if (evc.name.length == 0) {
                //                TWAccount *accout = [TWAccountTool account];
                //                evc.name = accout.member_nickname;
            }
            
            
            [self.navigationController pushViewController:evc animated:YES];
            
        }
        if (indexPath.row == 4) {
            UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, TWScreenH - 200, TWScreenW, 50)];
            pickview.dataSource = self;
            pickview.delegate = self;
            [self.view addSubview:pickview];
            
        }
        if (indexPath.row == 5) {
            
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                
            }]];
            
           
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        }
        
        
    }
}

#pragma mark -- UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        // 图片选择控制器
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType =UIImagePickerControllerSourceTypeCamera;
        
        [self.navigationController presentViewController:imagePickerController animated:YES completion:nil];
        
    }else if(buttonIndex==1){
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [self.navigationController presentViewController:imagePickerController animated:YES completion:nil];
    }
}





#pragma mark -- TWEditViewControllerDelegate
- (void)editViewController:(TWEditViewController *)editVc didSaveName:(NSString *)name{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"name"];
    [defaults synchronize];
    
    // 刷新某一行
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
}

#pragma mark -- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    // 获取选中的图片
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    // 对图片做裁剪
    self.imgView.image = [ImageTool image:image byScalingToSize:CGSizeMake(120, 120)];
    // 对裁剪过的图片做本地化存储
    NSString *patch = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSData *imageData = UIImagePNGRepresentation(self.imgView.image);
    [imageData writeToFile:[NSString stringWithFormat:@"%@/%@",patch,@"icon.png"] atomically:YES];
    
    // 请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    TWAccount *accout = [TWAccountTool account];
//    params[@"key"] = accout.key;
//    params[@"client"] = @"ios";
//    
//    // 上传头像
//    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=changeAvatarHandle" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        [formData appendPartWithFileData:imageData name:@"file" fileName:@"icon.png" mimeType:@"image/png"];
//        
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        TWAccount *accout = [TWAccountTool account];
//        accout.member_avatar = responseObject[@"datas"][@"result"][@"src"];
//        [TWAccountTool saveAccount:accout];
//        TTLog(@"哈哈%@",responseObject[@"datas"][@"result"][@"src"]);
//        if ([responseObject[@"datas"][@"src"] isEqualToString:@""]) {
//            [SVProgressHUD showErrorWithStatus:@"操作失败"];
//        }else{
//            // 请求参数
//            NSMutableDictionary *params1 = [NSMutableDictionary dictionary];
//            params1[@"key"] = accout.key;
//            params1[@"client"] = @"ios";
//            params1[@"id"] = accout.member_id;
//            params1[@"src"] = responseObject[@"datas"][@"result"][@"src"];
//            // 修改头像
//            [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=avatarheader" parameters:params1 progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                
//                if ([responseObject[@"datas"][@"result"] isEqualToString:@"success"]) {
//                    [SVProgressHUD showImage:nil status:@"修改成功"];
//                }else{
//                    [SVProgressHUD showErrorWithStatus:@"操作失败"];
//                }
//                
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                [SVProgressHUD showErrorWithStatus:@"请求错误"];
//            }];
//            
//            
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD showErrorWithStatus:@"请求错误"];
//    }];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}
#pragma mark - 该方法的返回值决定该控件指定列包含多少个列表项
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (0 == component)
    {
        return _province.count;
    }
    if (1 == component) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        return citys.count;
    }else{
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        return country.count;
    }
}
#pragma mark - 该方法返回的NSString将作为UIPickerView中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (0 == component) {
        return _province[row];
    }
    if(1 == component){
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        return citys[row];
    }else{
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        return country[row];
    }
}
#pragma mark - 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(0 == component){
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    }
    if(1 == component)
        [pickerView reloadComponent:2];
    NSInteger rowOne = [pickerView selectedRowInComponent:0];
    NSInteger rowTow = [pickerView selectedRowInComponent:1];
    NSInteger rowThree = [pickerView selectedRowInComponent:2];
    NSString *provinceName = _province[rowOne];
    NSArray *citys = _city[provinceName];
    NSString *cityName = citys[rowTow];
    NSArray *countrys = _country[cityName];
    NSLog(@"%@~%@~%@", _province[rowOne], citys[rowTow],countrys[rowThree]);
}
@end
