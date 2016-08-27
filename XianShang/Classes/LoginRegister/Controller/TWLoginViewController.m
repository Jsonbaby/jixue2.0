//
//  TWLoginViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWLoginViewController.h"
#import "TWRegisterViewController.h"
#import "TWTabBarController.h"
#import "TWForget1ViewController.h"
#import "TggDataService.h"
#import <SVProgressHUD.h>
@interface TWLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation TWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航栏中间标题
    self.title = @"登录";
    [self.loginBtn.layer setMasksToBounds:YES];
    [self.loginBtn.layer setCornerRadius:5.0];
    
    
}
- (IBAction)login:(id)sender {
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"username"] = self.username.text;
//    params[@"password"] = self.password.text;
//    [TggDataService TggAFrequestUrlString:@"/social/rest/passport/login" HTTPMethod:@"POST" params:params progressHandle:nil completionHandle:^(id result) {
//        TWLog(@"%@",result);
//        [SVProgressHUD showImage:nil status:@"登录成功"];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[TWTabBarController alloc] init];
//    } errorHandle:^(NSError *error) {
//        [SVProgressHUD showImage:nil status:@"登录失败"];
//    }];
}
- (IBAction)forgetPwd {
    TWForget1ViewController *fvc = [[TWForget1ViewController alloc] init];
    [self.navigationController pushViewController:fvc animated:YES];
}


- (IBAction)zhuce {
   
        TWRegisterViewController *rvc = [[TWRegisterViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
