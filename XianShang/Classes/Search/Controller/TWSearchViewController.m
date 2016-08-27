//
//  TWSearchViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/1.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWSearchViewController.h"
#import <AFNetworking.h>
#import "TWAccount.h"
#import "TWAccountTool.h"
#import <SVProgressHUD.h>
#import "TWFriendsTableViewCell.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import <UIImageView+WebCache.h>
#import "TWSystemTableViewCell.h"
#import "TWVerticalButton.h"
@interface TWSearchViewController ()<UIAlertViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UISearchBar *searchBar;
@end

@implementation TWSearchViewController

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
                grandSonView.alpha = 0.1f;
            }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){
                NSLog(@"Keep textfiedld bkg color");
            }else{
                grandSonView.alpha = 0.1f;
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
    //    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=followings" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        TTLog(@"%@",responseObject);
    //        self.friends = [TWFriend mj_objectArrayWithKeyValuesArray:responseObject[@"datas"][@"friend_list"]];
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self.tableView reloadData];
    //        });
    //        [SVProgressHUD dismiss];
    //        [self.tableView.mj_header endRefreshing];
    //
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //
    //        [SVProgressHUD showErrorWithStatus:@"请求错误"];
    //        [self.tableView.mj_header endRefreshing];
    //    }];
    
    
}

// 先下拉刷新, 再上拉刷新第5页数据

// 下拉刷新成功回来: 只有一页数据, page == 0
// 上啦刷新成功回来: 最前面那页 + 第5页数据

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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString *ID = @"message3";
    
    // 1.通过一个标识去缓存池中寻找可循环利用的cell
    TWSystemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TWSystemTableViewCell" owner:nil options:nil] lastObject];
        TWVerticalButton *vBtn = [[TWVerticalButton alloc] init];
        [vBtn setTitle:@"关注" forState:UIControlStateNormal];
        [vBtn setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
        vBtn.frame = CGRectMake(TWScreenW - 38, 19, 18, 28.5);
        [vBtn setTitleColor:TWRGBColor(255, 85, 85) forState:UIControlStateNormal];
        [cell addSubview:vBtn];
    }
    cell.nameLabel.text = @"环球家居";
    cell.dongtai.text = @"干什么都说最好的";
    cell.icon.image = [UIImage imageNamed:@"组-3"];
    return cell;
    
}

- (void)clickni:(UIButton *)btn{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"确定取消关注吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.delegate = self;
    alert.tag = btn.tag;
    [alert show];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    TWPeopleMainViewController *mvc = [[TWPeopleMainViewController alloc] init];
    //    TWFriend *friend = self.friends[indexPath.row];
    //    mvc.mid = friend.member_id;
    //    [self.navigationController pushViewController:mvc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 66.5;
    
}
//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"特别推荐";
//}
@end
