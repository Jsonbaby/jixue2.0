//
//  AppDelegate.m
//  XianShang
//
//  Created by tao wai on 16/7/1.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "AppDelegate.h"
#import "TWTabBarController.h"
#import "TWAccountTool.h"
#import "TWAccount.h"
#import "TWNewfeatureViewController.h"
#import "JPUSHService.h"
#import <AdSupport/AdSupport.h>
#import "TWLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 如何知道第一次使用这个版本？比较上次的使用情况
        NSString *versionKey = @"CFBundleVersion";
    
    // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [defaults objectForKey:versionKey];
    
    // 获得当前打开软件的版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
        if ([currentVersion isEqualToString:lastVersion]) {
            // 当前版本号 == 上次使用的版本
            // 先判断有无存储账号信息
            TWAccount *account = [TWAccountTool account];
            
            if (account) { // 之前登录成功
                // 设置窗口的根控制器
                self.window.rootViewController = [[TWLoginViewController alloc] init];
            } else { // 之前没有登录成功
                self.window.rootViewController = [[TWNewfeatureViewController alloc] init];
                
                
            }
        } else { // 当前版本号 != 上次使用的版本：显示版本新特性
            self.window.rootViewController = [[TWNewfeatureViewController alloc] init];
   
           // 存储这次使用的软件版本
            [defaults setObject:currentVersion forKey:versionKey];
            [defaults synchronize];
        }
    

    
    //--------------集成极光推送-------------------
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:advertisingId];
    // -----------------------------------
    
       [self.window makeKeyAndVisible];

    return YES;
}

//--------------集成极光推送-------------------

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required -    DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:
(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

// -----------------------------------


@end
