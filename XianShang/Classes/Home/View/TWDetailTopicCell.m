

#import "TWDetailTopicCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+ViewController.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import "TWAccount.h"
#import "TWAccountTool.h"
#import "UIView+ViewController.h"
#import "TWMainViewController.h"
#import "TWNavigationController.h"
#import "TWZhanfaViewController.h"
#import "TWCommentViewController.h"

@interface TWDetailTopicCell()<UIAlertViewDelegate>


/** 图片帖子中间的内容 */

- (IBAction)like:(id)sender;

- (IBAction)zhuanfa:(id)sender;

- (IBAction)comment:(id)sender;


@end

@implementation TWDetailTopicCell


// 0喜欢、1不喜欢
- (IBAction)like:(id)sender {
    

}


- (IBAction)zhuanfa:(id)sender
{
  
    TWZhanfaViewController *zvc = [[TWZhanfaViewController alloc] init];
    
    
    TWNavigationController *nav = [[TWNavigationController alloc] initWithRootViewController:zvc];
    
    // 这里不能使用self来弹出其他控制器, 因为self执行了dismiss操作
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [root presentViewController:nav animated:YES completion:nil];;
}

- (IBAction)comment:(id)sender {

    TWCommentViewController *zvc = [[TWCommentViewController alloc] init];
    
    
    TWNavigationController *nav = [[TWNavigationController alloc] initWithRootViewController:zvc];
    
    // 这里不能使用self来弹出其他控制器, 因为self执行了dismiss操作
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [root presentViewController:nav animated:YES completion:nil];;
}


- (void)awakeFromNib
{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
    
    self.profileImageView.userInteractionEnabled = YES;
    [self.profileImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headIconClick:)]];
    self.profileImageView.image = [UIImage imageNamed:@"bg_deal_purchaseButton_highlighted"];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.width * 0.5;
    self.profileImageView.layer.masksToBounds = YES;
   
    
}

- (void)headIconClick:(UITapGestureRecognizer *)tap
{
    TWMainViewController *mvc = [[TWMainViewController alloc] init];

    [self.viewController.navigationController pushViewController:mvc animated:YES];
}





- (IBAction)more {
//    TWAccount *accout = [TWAccountTool account];
//    if ([self.topic.trace_memberid isEqualToString:accout.member_id]) {
//        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//            // 请求参数
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            TWAccount *accout = [TWAccountTool account];
//            params[@"key"] = accout.key;
//            params[@"client"] = @"ios";
//            params[@"trace_id"]=self.topic.trace_id;
//            params[@"favourite_item_type"] = @1;
//            [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=favoritesFn" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                [SVProgressHUD showImage:nil status:@"收藏成功"];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                
//                [SVProgressHUD showErrorWithStatus:@"请求错误"];
//            }];
//            
//        }]];
//         [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//        [self.viewController presentViewController:alert animated:YES completion:nil];
//        
//    }else{
//
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            // 请求参数
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            TWAccount *accout = [TWAccountTool account];
//            params[@"key"] = accout.key;
//            params[@"client"] = @"ios";
//            params[@"trace_id"]=self.topic.trace_id;
//            params[@"favourite_item_type"] = @1;
//            [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=favoritesFn" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                [SVProgressHUD showImage:nil status:@"收藏成功"];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                
//                [SVProgressHUD showErrorWithStatus:@"请求错误"];
//            }];
//            
//        }]];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"取消关注" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            
//            // 请求参数
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            TWAccount *accout = [TWAccountTool account];
//            
//            params[@"key"] = accout.key;
//            params[@"client"] = @"ios";
//            params[@"mid"] = self.topic.trace_memberid;
//            
//            [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=cancelfollow" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                
//                
//                [SVProgressHUD showImage:nil status:@"取消关注成功"];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                
//                [SVProgressHUD showImage:nil status:@"请求失败"];
//            }];
//
//        }]];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            
//            UIAlertView * alerView = [[UIAlertView alloc]initWithTitle:@"举报内容" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"发送",nil];
//            
//            alerView.alertViewStyle = UIAlertViewStylePlainTextInput;
//            
//            alerView.delegate = self;
//            
//            UITextField * newGroup = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
//            
//            newGroup.tag = 1001;
//            
//            [alerView addSubview:newGroup];
//            
//            [alerView show];
//
//        }]];
    
//        [alert addAction:[UIAlertAction actionWithTitle:@"加入黑名单" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            
//            // 请求参数
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            TWAccount *accout = [TWAccountTool account];
//            
//            params[@"key"] = accout.key;
//            params[@"client"] = @"ios";
//            params[@"id"] = self.topic.trace_memberid;
//            
//            [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=addblack" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                
//                [SVProgressHUD showImage:nil status:@"加入黑名单成功"];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                
//                [SVProgressHUD showImage:nil status:@"请求失败"];
//            }];
//            
//        }]];
//        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//        [self.viewController presentViewController:alert animated:YES completion:nil];
//    }
    
}

#pragma mark UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    if (buttonIndex == 0)
    {
        
       
        
    }else if (buttonIndex == 1)
        
    {
        
        [SVProgressHUD showImage:nil status:@"举报成功"];
        
    }
    
}
@end
