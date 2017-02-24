//
//  HYNewTabBarController.h
//  HYTabBarController
//
//  Created by 王厚一 on 16/11/8.
//  Copyright © 2016年 why. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HYTabBarItem.h"

@interface HYOverrideTabBar : UIView

//初始化方法添加字典信息
- (instancetype)initWithFrame:(CGRect)frame andTabBarMsgDict:(NSDictionary<NSString *, NSArray *> *)dict;


@end
