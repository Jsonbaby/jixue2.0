//
//  TWVertifyViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWVertifyViewController.h"
#import "TWSetupPwdController.h"
#import "CountButton.h"
@interface TWVertifyViewController ()
@property (weak, nonatomic) IBOutlet CountButton *vertifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation TWVertifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"验证码";
    [self.vertifyBtn.layer setMasksToBounds:YES];
    [self.vertifyBtn.layer setCornerRadius:5.0];
    
    [self.nextBtn.layer setMasksToBounds:YES];
    [self.nextBtn.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextStep:(id)sender {
    TWSetupPwdController *svc = [[TWSetupPwdController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}
- (IBAction)vertifyBtnClick:(CountButton *)sender {
    [sender startCountDown];
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
