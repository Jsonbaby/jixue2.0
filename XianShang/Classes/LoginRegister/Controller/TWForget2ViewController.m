//
//  TWForget2ViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWForget2ViewController.h"
#import "TWForget3ViewController.h"
@interface TWForget2ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *vertifyBth;

@end

@implementation TWForget2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密码找回";
    [self.vertifyBth.layer setMasksToBounds:YES];
    [self.vertifyBth.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextStep {
    TWForget3ViewController *f2vc = [[TWForget3ViewController alloc] init];
    [self.navigationController pushViewController:f2vc animated:YES];
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
