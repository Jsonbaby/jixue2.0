//
//  TWForget1ViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/2.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWForget1ViewController.h"
#import "TWForget2ViewController.h"
@interface TWForget1ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getSmsBtn;

@end

@implementation TWForget1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密码找回";
    [self.getSmsBtn.layer setMasksToBounds:YES];
    [self.getSmsBtn.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextStep {
    TWForget2ViewController *f2vc = [[TWForget2ViewController alloc] init];
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
