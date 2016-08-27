//
//  AppDelegate.h
//  XianShang
//
//  Created by tao wai on 16/7/1.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *appKey = @"cb126027ae418553197dfc98";
static NSString *channel = @"App Store";
static BOOL isProduction = FALSE;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UILabel *_infoLabel;
    UILabel *_tokenLabel;
    UILabel *_udidLabel;
}
@property (strong, nonatomic) UIWindow *window;
@end

