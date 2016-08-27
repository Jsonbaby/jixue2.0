//
//  TWHomeViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/1.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWHomeViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import "TWTopicCell.h"
#import "TWDetailViewController.h"
@interface TWHomeViewController ()
/** 帖子数据 */
@property (nonatomic, strong) NSMutableArray *topics;
@end

@implementation TWHomeViewController

- (NSMutableArray *)topics
{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cheakNetworkStatus];
    // 添加刷新控件
    self.tableView.backgroundColor = TWRGBColor(242, 242, 242);
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

- (void)cheakNetworkStatus{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                [self setupRefresh];
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                [SVProgressHUD showImage:nil status:@"请连接网络"];
                [self getStatusFromCache];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                [self setupRefresh];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                [self setupRefresh];
                break;
        }
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
}

- (void)getStatusFromCache{
    // 1.先从缓存里面加载
//    NSArray *statusArray = [TWStatusCacheTool statuesWithParam:nil];
//    if (statusArray.count) { // 有缓存
//        self.topics = [NSMutableArray arrayWithArray:statusArray];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        
//    }
}

- (void)setupRefresh
{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha= YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
}


#pragma mark - 数据处理
/**
 * 加载新的帖子数据
 */
- (void)loadNewTopics
{
//    [SVProgressHUD show];
    
    // 请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    TWAccount *accout = [TWAccountTool account];
//    params[@"key"] = accout.key;
//    params[@"client"] = @"ios";
//    
//    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=friends_circle" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        TTLog(@"%@",responseObject);
//        self.topics = [TWMyStatus mj_objectArrayWithKeyValuesArray:responseObject[@"datas"][@"tracelist"]];
//        // 缓存
//        [TWStatusCacheTool addStatuses:_topics];
//        
//        //------------所有界面UI刷新都要放在主线程里面刷新-----------
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        //-----------------------------------------------------
//        
//        [self.tableView.mj_header endRefreshing];
//        [SVProgressHUD dismiss];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self.tableView.mj_header endRefreshing];
//        [SVProgressHUD showErrorWithStatus:@"请求错误"];
//    }];
    
}


/**
 * 加载更多的帖子数据
 */
- (void)loadMoreTopics
{
    
//    // 请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    TWAccount *accout = [TWAccountTool account];
//    params[@"key"] = accout.key;
//    params[@"client"] = @"ios";
//    params[@"num"] = @(self.topics.count + 1);
//    
//    [[AFHTTPSessionManager manager] POST:@"http://www.jixuejiyong.com/mobile/index.php?act=hg_member_sns_home&op=friends_circle" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSArray *arr = [TWMyStatus mj_objectArrayWithKeyValuesArray:responseObject[@"datas"][@"tracelist"]];
//        
//        [self.topics addObjectsFromArray:arr];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        [self.tableView.mj_footer endRefreshing];
//        [SVProgressHUD dismiss];
//        if (arr.count == 0) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self.tableView.mj_footer endRefreshing];
//        [SVProgressHUD showErrorWithStatus:@"请求错误"];
//    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.mj_footer.hidden = (self.topics.count == 0);
//    return self.topics.count;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString *ID = @"topic";
    
    // 1.通过一个标识去缓存池中寻找可循环利用的cell
    TWTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TWTopicCell" owner:nil options:nil] lastObject];
    }
    //    [cell.photoView setup];
    // 3.给cell设置新的数据
//    cell.tyLabel.text = @"据英国《每日邮报》7月20日报道，阿根廷一位超模近日前往危地马拉一所监狱探视囚犯，却赶上监狱内发生暴乱，在两派犯人交火的过程中不幸中弹身亡。";
    cell.tyLabel2.text = @"据英国《每日邮报》7月20日报道，阿根廷一位超模近日前往危地马拉一所监狱探视囚犯，却赶上监狱内发生暴乱，在两派犯人交火的过程中不幸中弹身亡。";
    cell.tyLabel.text = @"据英国《每日邮报》7月20日报道，阿根廷一位超模近日前往危地马拉一所监狱探视囚犯，却赶上监狱内发生暴乱，在两派犯人交火的过程中不幸中弹身亡。";
    cell.tyLabelH.constant = [cell.tyLabel getHeightWithWidth:(TWScreenW - 24)];
    cell.tyLabel2H.constant = [cell.tyLabel getHeightWithWidth:(TWScreenW - 24)];
    cell.phonoViewH.constant = 0;
    return cell;
    
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 315;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWDetailViewController *dvc = [[TWDetailViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

@end
