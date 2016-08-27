//
//  TWSetupPwdController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWSetupPwdController.h"
#import "TWEditInfoViewController.h"
@interface TWSetupPwdController ()
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;

@end

@implementation TWSetupPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置密码";
    [self.finishBtn.layer setMasksToBounds:YES];
    [self.finishBtn.layer setCornerRadius:5.0];
}

- (IBAction)finish:(id)sender {
    TWEditInfoViewController *eivc = [[TWEditInfoViewController alloc] init];
    [self.navigationController pushViewController:eivc animated:YES];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
