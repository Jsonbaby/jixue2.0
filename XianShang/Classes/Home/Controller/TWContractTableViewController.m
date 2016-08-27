//
//  TWContractTableViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/7.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWContractTableViewController.h"

@interface TWContractTableViewController ()

@end

@implementation TWContractTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.title = @"联系人";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"locate";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

        cell.imageView.image = [UIImage imageNamed:@"header_cry_icon"];
        cell.textLabel.text = @"好友昵称";
    cell.imageView.frame = CGRectMake(10, 2, 40, 40);
    cell.imageView.layer.cornerRadius = cell.imageView.width * 0.5;
    cell.imageView.layer.masksToBounds = YES;
    

    return cell;
}

@end
