//
//  TWTabBarController.m
//  即学即用
//
//  Created by Apple on 16/4/5.
//  Copyright © 2016年 8lei. All rights reserved.
//

#import "TWTabBarController.h"
#import "TWTabBar.h"
#import "TWNavigationController.h"
#import "TWHomeViewController.h"
#import "TWMeViewController.h"
#import "TWGoodFriendViewController.h"
#import "TWSearchViewController.h"
@interface TWTabBarController ()

@end

@implementation TWTabBarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildVc:[[TWHomeViewController alloc] init] title:@"首页" image:@"首页" selectedImage:@"首页1"];
    [self setupChildVc:[[TWGoodFriendViewController alloc] init] title:@"消息" image:@"消息-0" selectedImage:@"消息-(1)"];
    
    [self setupChildVc:[[TWSearchViewController alloc] init] title:@"广场" image:@"发现1" selectedImage:@"发现2"];
    
    
    
    [self setupChildVc:[[TWMeViewController alloc] init] title:@"我的" image:@"头像" selectedImage:@"头像1"];
    
    // 更换tabBar
    [self setValue:[[TWTabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    TWNavigationController *nav = [[TWNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
