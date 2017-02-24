
//
//  CHTaBarViewController.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import "CHTaBarViewController.h"
#import "CHViewController1.h"
@interface CHTaBarViewController ()

@property (nonatomic, strong) HYOverrideTabBar * overrideTabBar;

@end

@implementation CHTaBarViewController
- (instancetype)init {
    
    if (self = [super init]) {
        
        //接收到点击事件的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"SELECTINDEXCHANGED" object:nil];
    }
    return self;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SELECTINDEXCHANGED" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //字典存储tabbar的iconfont和title
    NSDictionary * dict2 = @{@"item_icon_normal":@[@"\U0000e606",@"\U0000e600",@"\U0000e614",@"\U0000e602",@"\U0000e604"],@"item_icon_select":@[@"\U0000e607",@"\U0000e601",@"\U0000e615",@"\U0000e603",@"\U0000e605"],@"item_title":@[@"首页",@"推荐",@"中间页",@"消息",@"我的"]};
    
    self.overrideTabBar = [[HYOverrideTabBar alloc] initWithFrame:self.tabBar.frame andTabBarMsgDict:dict2];
    
    
    [self.tabBar removeFromSuperview];
    
    [self.view addSubview:self.overrideTabBar];

}

- (void)receiveNotification:(NSNotification *)noti {
    
    int getIndex = [[noti object][@"index"] intValue];
    
    if (getIndex == 2) {
        
        CHViewController1 * vcmid = [[CHViewController1 alloc] init];
        
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:vcmid];
        
        navi.navigationBar.hidden = YES;
        
        [self presentViewController:navi animated:YES completion:nil];
        //中间页面模态视图弹出
        /*
        CHProduct *view = [[CHProduct alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.tabBar.subviews[2] addSubview:view];
         */
        NSLog(@"弹出视图");
    }else {
        
        int index = getIndex > 1 ? getIndex - 1 : getIndex;
        
        self.selectedIndex = index;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
