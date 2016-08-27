//
//  TWDetailViewController.m
//  XianShang
//
//  Created by tao wai on 16/7/5.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWDetailViewController.h"
#import "TWDetailTopicCell.h"
#import "TWCommentCell.h"
@interface TWDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TWDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 200;
    }else{
        return 100;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 ) {
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"dtopic";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWDetailTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWDetailTopicCell" owner:nil options:nil] lastObject];
        }
        return cell;
        
        
    }else{
        // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
        static NSString *ID = @"comment";
        
        // 1.通过一个标识去缓存池中寻找可循环利用的cell
        TWCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 2.如果没有可循环利用的cell
        if (cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TWCommentCell" owner:nil options:nil] lastObject];
        }
//        TWComment *comment = self.topic.comment_list[indexPath.row];
//        NSString *str = [NSString stringWithFormat:@"http://www.jixuejiyong.com/data/upload/shop/avatar/%@",comment.comment_memberavatar];
//        [cell.profileImageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
//        cell.contentLabel.text = comment.comment_content;
//        cell.usernameLabel.text = comment.comment_membername;
//        
//        // 转化时间戳
//        long long int date1 = (long long int)[comment.comment_addtime intValue];
//        NSDate *date = [NSDate dateWithTimeIntervalSince1970:date1];
//        // 设置时间格式
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSString *currentDateStr = [dateFormatter stringFromDate:date];
//        cell.timeLabel.text = currentDateStr;
        // 转化时间戳
        //        long long int date1 = (long long int)[comment.comment_addtime intValue];
        //        NSDate *date = [NSDate dateWithTimeIntervalSince1970:date1];
        //        // 设置时间格式
        //        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //        NSString *currentDateStr = [dateFormatter stringFromDate:date];
        //        cell.timeLabel.text = currentDateStr;
        return cell;
        
    }
    
    
    
}

#pragma mark - <UITableViewDelegate>
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TWScreenW, 30)];
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        [btn1 setTitle:@"转发9" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 50, 30)];
        [btn2 setTitle:@"评论9" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(TWScreenW-60, 0, 50, 30)];
        [btn3 setTitle:@"赞9" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        [view addSubview:btn3];
        [btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
        view.backgroundColor = [UIColor whiteColor];
        return view;

    }
    return nil;
}

- (void)btn1Click:(UIButton *)btn1{
    TWLogFunc;
}
- (void)btn2Click:(UIButton *)btn1{
    TWLogFunc;
}
- (void)btn3Click:(UIButton *)btn1{
    TWLogFunc;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 30;
    }
    return 10;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==1) {
        UIMenuController *menu = [UIMenuController sharedMenuController];
        if (menu.isMenuVisible) {
            [menu setMenuVisible:NO animated:YES];
        } else {
            // 被点击的cell
            TWCommentCell *cell = (TWCommentCell *)[tableView cellForRowAtIndexPath:indexPath];
            // 出现一个第一响应者
            [cell becomeFirstResponder];
            
            // 显示MenuController
            UIMenuItem *replay = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(replay:)];
            menu.menuItems = @[replay];
            CGRect rect = CGRectMake(0, cell.height * 0.5, cell.width, cell.height * 0.5);
            [menu setTargetRect:rect inView:cell];
            [menu setMenuVisible:YES animated:YES];
        }
        
    }
}

#pragma mark - MenuItem处理
- (void)replay:(UIMenuController *)menu
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"%s ", __func__);
   
    
}


@end
