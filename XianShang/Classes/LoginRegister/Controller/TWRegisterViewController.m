//
//  TWRegisterViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWRegisterViewController.h"
#import "TWProtocolViewController.h"
#import "TWVertifyViewController.h"
@interface TWRegisterViewController ()

@property (weak, nonatomic) IBOutlet UIButton *vertifyBtn;

@end

@implementation TWRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航栏中间标题
    self.title = @"注册";
    [self.vertifyBtn.layer setMasksToBounds:YES];
    [self.vertifyBtn.layer setCornerRadius:5.0];
    
}

- (IBAction)nextStep:(id)sender {
    TWVertifyViewController *vvc = [[TWVertifyViewController alloc] init];
    [self.navigationController pushViewController:vvc animated:YES];
}

- (IBAction)protocol:(id)sender {
    TWProtocolViewController *pvc = [[TWProtocolViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
