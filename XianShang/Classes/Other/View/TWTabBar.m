//
//  TWTabBar.m
//  即学即用
//
//  Created by Apple on 16/4/5.
//  Copyright © 2016年 8lei. All rights reserved.
//

#import "TWTabBar.h"
#import "TWPostWordViewController.h"
#import "TWNavigationController.h"
@interface TWTabBar()
/** 发布按钮 */
@property (nonatomic, weak) UIButton *publishButton;
@end
@implementation TWTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置tabbar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        // 添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"发布-in"] forState:UIControlStateNormal];
//        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted_os7"] forState:UIControlStateHighlighted];
//        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_os7"] forState:UIControlStateNormal];
//        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7"] forState:UIControlStateHighlighted];
        publishButton.size = publishButton.currentBackgroundImage.size;
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchDown];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}
- (void)publishButtonClick
{
    
    TWPostWordViewController *postWord = [[TWPostWordViewController alloc] init];
    TWNavigationController *nav = [[TWNavigationController alloc] initWithRootViewController:postWord];
    
    // 这里不能使用self来弹出其他控制器, 因为self执行了dismiss操作
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [root presentViewController:nav animated:YES completion:nil];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}


@end
