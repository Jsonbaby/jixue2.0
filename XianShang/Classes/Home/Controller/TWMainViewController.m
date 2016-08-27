//
//  TWMainViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/5.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWMainViewController.h"
#import "TWTopicCell.h"
#import "TWHeadTableViewCell.h"
#import "TWFriendsTableViewCell.h"
typedef enum {
    TWMainButtonTypeInfo,
    TWMainButtonTypeStatues,
    TWMainButtonTypeAttention,
    TWMainButtonTypeFans,
} TWMainButtonType;
@interface TWMainViewController ()
@property (nonatomic, assign) TWMainButtonType buttontype;
@end

@implementation TWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"拉黑" style:UIBarButtonItemStyleDone target:self action:@selector(joinBlack)];
    self.title = @"主页卡片";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(infoLabelClick:) name:@"infoLabelClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statuesClick:) name:@"statuesClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(attentionClick:) name:@"attentionClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fansLabelClick:) name:@"fansLabelClick" object:nil];
}

- (void)joinBlack{
    
}

- (void)infoLabelClick:(NSNotification *)text{
    int myInterger = (int)[text.userInfo[@"type"] integerValue];
    self.buttontype = myInterger;
    dispatch_async(dispatch_get_main_queue(), ^{
       
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        
    });

}

- (void)statuesClick:(NSNotification *)text{
    int myInterger = (int)[text.userInfo[@"type"] integerValue];
    self.buttontype = myInterger;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    });
    
}

- (void)attentionClick:(NSNotification *)text{
    int myInterger = (int)[text.userInfo[@"type"] integerValue];
    self.buttontype = myInterger;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    });
    
}

- (void)fansLabelClick:(NSNotification *)text{
    int myInterger = (int)[text.userInfo[@"type"] integerValue];
    self.buttontype = myInterger;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    });
    
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        if (self.buttontype == TWMainButtonTypeInfo) {
            return 5;
        }else if (self.buttontype == TWMainButtonTypeStatues){
            return 20;
        }else if (self.buttontype == TWMainButtonTypeAttention){
            return 20;
        }else{
            return 20;
        }

    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 144;
    }else{
        if (self.buttontype == TWMainButtonTypeInfo) {
            return 44;
        }else if (self.buttontype == TWMainButtonTypeStatues){
            return 200;
        }else if (self.buttontype == TWMainButtonTypeAttention){
            return 70;
        }else{
            return 70;
        }
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 ) {
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"mainhead";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWHeadTableViewCell" owner:nil options:nil] lastObject];
            
        }
        return cell;
        
        
    }else{
        if (self.buttontype == TWMainButtonTypeInfo) {
            
            // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
            static NSString *ID = @"myinfo";
            
            // 1.通过一个标识去缓存池中寻找可循环利用的cell
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            
            // 2.如果没有可循环利用的cell
            if (cell == nil){
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
            }
            NSArray *arr1 = @[@"所在地",@"公司",@"行业",@"性别",@"注册时间"];
            NSArray *arr2 = @[@"北京海淀区",@"猿题库",@"纺织",@"男",@"2011-08-13"];
            cell.textLabel.text = arr1[indexPath.row];
            cell.detailTextLabel.text = arr2[indexPath.row];
            
            return cell;
        }else if (self.buttontype == TWMainButtonTypeStatues){
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
            
            return cell;

        }
//        else if (self.buttontype == TWMainButtonTypeAttention){
//            
//        }
        else{
            // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
            static NSString *ID = @"goodfriend";
            
            // 1.通过一个标识去缓存池中寻找可循环利用的cell
            TWFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            
            // 2.如果没有可循环利用的cell
            if (cell == nil){
                cell = [[TWFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
            }
            cell.titleView.text = @"小白";
            cell.priceView.text = @"叶的离去，是风的追求，还是树的不挽留";
            // 3.给cell设置新的数据
            
            cell.iconView.image=[UIImage imageNamed:@"defaultUserIcon"];
            
            return cell;

        }
    }
    
}


#pragma mark - <UITableViewDelegate>


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section == 1) {
//        return 30;
//    }
//    return 10;
//}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - MenuItem处理
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
