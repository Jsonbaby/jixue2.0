//
//  TWGoodFriendViewController.m
//  即学即用
//
//  Created by Apple on 16/4/6.
//  Copyright © 2016年 8lei. All rights reserved.
//

#import "TWGoodFriendViewController.h"
#import <AFNetworking.h>
#import "TWAccount.h"
#import "TWAccountTool.h"
#import "IWBadgeButton.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import <UIImageView+WebCache.h>
#import "TWMessageTableViewCell.h"
#import "TWSystemTableViewCell.h"
#import "UIImage+MJ.h"
@interface TWGoodFriendViewController ()<UIAlertViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UISearchBar *searchBar;
@end

@implementation TWGoodFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    self.searchBar = searchBar;
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;
    searchBar.frame =CGRectMake(-3, 5, TWScreenW+6, 24);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TWScreenW, 35)];
    view.backgroundColor = TWRGBColor(244, 244, 244);
    [view addSubview:searchBar];
    self.tableView.tableHeaderView = view;
    self.searchBar.backgroundColor= [UIColor whiteColor];
    
    for (UIView *subview in searchBar.subviews) {
        for(UIView* grandSonView in subview.subviews){
            if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                grandSonView.alpha = 0.2f;
            }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){
                
            }else{
                grandSonView.alpha = 0.2f;
            }
        }//for cacheViews
    }//subviews

    
    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTableViewTouchInSide)];
    tableViewGesture.numberOfTapsRequired = 1;
    tableViewGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tableViewGesture];
 
    // 添加刷新控件
//    [self setupRefresh];
    
}

- (void)commentTableViewTouchInSide{
    [self.searchBar resignFirstResponder];
}

- (void)setupRefresh
{
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha= YES;
    [self.tableView.mj_header beginRefreshing];
    
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - 数据处理
/**
 * 加载新的帖子数据
 */
- (void)loadNewTopics
{
//    [SVProgressHUD show];
//    // 结束上啦
//    [self.tableView.mj_footer endRefreshing];
//    // 请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    TWAccount *accout = [TWAccountTool account];
//    
//    params[@"key"] = accout.key;
//    params[@"client"] = @"ios";
//    
//    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=friends" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        TWLog(@"成功数据：%@",responseObject);
//        self.friends = [TWFriend mj_objectArrayWithKeyValuesArray:responseObject[@"datas"][@"friends_list"]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        [self.tableView.mj_header endRefreshing];
//
//        [SVProgressHUD dismiss];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        [SVProgressHUD showErrorWithStatus:@"请求错误"];
//        [self.tableView.mj_header endRefreshing];
//    }];

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"message";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWSystemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWSystemTableViewCell" owner:nil options:nil] lastObject];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(TWScreenW - 40, 23, 20, 20)];
            [btn setTitle:@"5" forState:UIControlStateNormal];
            btn.userInteractionEnabled = NO;
            [btn setBackgroundImage:[UIImage resizedImageWithName:@"main_badge_os7"] forState:UIControlStateNormal];
           btn.titleLabel.font = [UIFont systemFontOfSize:11];
            [cell addSubview:btn];
        }
        cell.icon.image = [UIImage imageNamed:@"组-3"];
            return cell;
        
    }else{
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"message1";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWMessageTableViewCell" owner:nil options:nil] lastObject];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(TWScreenW - 40, 23, 20, 20)];
            [btn setTitle:@"5" forState:UIControlStateNormal];
            btn.userInteractionEnabled = NO;
            [btn setBackgroundImage:[UIImage resizedImageWithName:@"main_badge_os7"] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            [cell addSubview:btn];
        }
        NSArray *arr = @[@"@我的",@"评论",@"赞"];
        cell.nameLabel.text = arr[indexPath.row];
        NSArray *arr1 = @[@"@我的",@"图层-9",@"图层-10"];
        cell.iconView.image = [UIImage imageNamed:arr1[indexPath.row]];
        return cell;

    }
    
    
    
    

    
    
}

- (void)clickni:(UIButton *)btn{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消关注" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // 请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        TWAccount *accout = [TWAccountTool account];
        
        params[@"key"] = accout.key;
        params[@"client"] = @"ios";
        params[@"mid"] = @(btn.tag);
        
        [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=cancelfollow" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [SVProgressHUD showImage:nil status:@"取消关注成功"];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [SVProgressHUD showImage:nil status:@"请求失败"];
        }];
        
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"加入黑名单" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
                    // 请求参数
                    NSMutableDictionary *params = [NSMutableDictionary dictionary];
                    TWAccount *accout = [TWAccountTool account];
        
                    params[@"key"] = accout.key;
                    params[@"client"] = @"ios";
                    params[@"id"] = @(btn.tag);
        
                    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=addblack" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
                        [SVProgressHUD showImage:nil status:@"加入黑名单成功"];
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                        [SVProgressHUD showImage:nil status:@"请求失败"];
                    }];
                    
                }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1){
        // 请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        TWAccount *accout = [TWAccountTool account];
        
        params[@"key"] = accout.key;
        params[@"client"] = @"ios";
        params[@"mid"] = @(alertView.tag);
        
        [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=cancelfollow" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [SVProgressHUD showImage:nil status:@"取消关注成功"];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [SVProgressHUD showImage:nil status:@"请求失败"];
        }];
        
    }
}
/**
 * 加载更多的帖子数据
 */
- (void)loadMoreTopics
{
    // 结束下拉
    [self.tableView.mj_header endRefreshing];
    
    // 参数
    
    
    // 发送请求
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 66.5;
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
  
}


@end
