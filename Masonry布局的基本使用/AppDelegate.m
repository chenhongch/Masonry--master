//
//  AppDelegate.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CHViewController2.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
/*
 ViewController 模块布局
 CHViewController2 朋友圈布局
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController * vc1 = [[ViewController alloc] init];
    CHViewController2 * vc2 = [[CHViewController2 alloc] init];
    vc2.title = @"朋友圈";
    ViewController * vc3 = [[ViewController alloc] init];
    ViewController * vc4 = [[ViewController alloc] init];
    
    UINavigationController * navi1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController * navi2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController * navi3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController * navi4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    
    self.tabbar = [[CHTaBarViewController alloc] init];
    
    self.tabbar.viewControllers = @[navi1,navi2,navi3,navi4];
    
    self.window.rootViewController = self.tabbar;
    
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
