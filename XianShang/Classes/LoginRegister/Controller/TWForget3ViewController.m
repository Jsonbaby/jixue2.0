//
//  TWForget3ViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWForget3ViewController.h"

@interface TWForget3ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *modifyPwdBtn;

@end

@implementation TWForget3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置密码";
    [self.modifyPwdBtn.layer setMasksToBounds:YES];
    [self.modifyPwdBtn.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)modifyPwd {
    
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
