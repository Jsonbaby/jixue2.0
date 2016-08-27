//
//  TWMeViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/1.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWMeViewController.h"
#import "TWTableViewCell.h"
#import "TWEditInfoViewController.h"
#import "TWMiddleTableViewCell.h"
@interface TWMeViewController ()

@end

@implementation TWMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    
     self.tableView.tableFooterView = [UIView new];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 420, TWScreenW, TWScreenH)];
    v.backgroundColor = TWRGBColor(247, 247, 247);
    [self.tableView addSubview:v];
    
}
- (void)edit{
    TWEditInfoViewController *ivc = [[TWEditInfoViewController alloc] init];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 2;
    }else if(section == 2){
        return 2;
    }else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"profilehead";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWTableViewCell" owner:nil options:nil] lastObject];
        }
             return cell;
    }else if(indexPath.section == 1){
        static NSString *ID = @"profile";
        TWMiddleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
          cell = [[[NSBundle mainBundle] loadNibNamed:@"TWMiddleTableViewCell" owner:nil options:nil] lastObject];
        }
        NSArray *arr1 = @[@"我的评论",@"@我的赞"];
        NSArray *arr2 = @[@"评论-(1)",@"赞"];
        cell.rightLabel.text = arr1[indexPath.row];
        cell.iconView.image = [UIImage imageNamed:arr2[indexPath.row]];
        return cell;
    }else if(indexPath.section == 2){
        static NSString *ID = @"profilehead";
        TWMiddleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWMiddleTableViewCell" owner:nil options:nil] lastObject];
        }
        NSArray *arr1 = @[@"检查更新",@"清除缓存"];
        NSArray *arr2 = @[@"检查更新",@"清除缓存"];
        cell.rightLabel.text = arr1[indexPath.row];
        cell.iconView.image = [UIImage imageNamed:arr2[indexPath.row]];
        return cell;
    }else{
        static NSString *ID = @"profilefoot";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWFootTableViewCell" owner:nil options:nil] lastObject];
        }
        return cell;
    }
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 20;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 121;
    }
    return 50;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
