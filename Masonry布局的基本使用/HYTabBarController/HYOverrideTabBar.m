//
//  HYNewTabBarController.m
//  HYTabBarController
//
//  Created by 王厚一 on 16/11/8.
//  Copyright © 2016年 why. All rights reserved.
//

#import "HYOverrideTabBar.h"

@interface HYOverrideTabBar () {
    NSArray * _item_titles;//文字title
    NSArray * _item_icon_normal;//正常状态的iconfont
    NSArray * _item_icon_select;//选中状态的iconfont
    NSInteger _selectIndex;
}

@end

@implementation HYOverrideTabBar

- (instancetype)initWithFrame:(CGRect)frame andTabBarMsgDict:(NSDictionary *)dict{
    
    if (self = [super initWithFrame:frame]) {
                
        _item_titles = dict[@"item_title"];
        
        _item_icon_normal = dict[@"item_icon_normal"];
        
        _item_icon_select = dict[@"item_icon_select"];
        
        _selectIndex = 0;
        
        
        //添加tabbar的背景图
        [self addBackgroundImage];
        
        //添加tabbar的文字和图片
        [self addTitleAndIcon];
    }
    
    return self;
}

- (void)addBackgroundImage {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImage * backImage = [UIImage imageNamed:@"Item_background"];
    
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.width * backImage.size.height / backImage.size.width);
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - size.height, size.width, size.height)];
    
    imageView.image = backImage;
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:imageView];
}

- (void)addTitleAndIcon {
    
    UIImage * backImage = [UIImage imageNamed:@"Item_background"];
    
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.width * backImage.size.height / backImage.size.width);
    
    for (int i = 0; i < 5; i++) {
        
        //定制每个item
        HYTabBarItem * item = [[HYTabBarItem alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 * i, self.frame.size.height - size.height + 5, self.frame.size.width / 5, size.height - 10)];
        
        item.tag = 100 + i;
        
        [item addTarget:self action:@selector(itemTarget:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 2) {
            
            //中间item图标
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - size.height + 10) / 2, CGRectGetHeight(self.frame) - size.height + 5, size.height - 10, size.height - 10)];
            
            imageView.image = [UIImage imageNamed:@"make_docu"];
            
            [self addSubview:imageView];
            
        }else {
            
            BOOL selected = i == 0 ? YES : NO;
            
            [item setTitle:_item_titles[i] andIcon:_item_icon_normal[i] andCurrentSelected:selected];
            
        }
        
        [self addSubview:item];
    }

    
}


- (void)itemTarget:(UIControl *)selectItem {
    
    //点击事件传递到tabBarController的通知
    NSNotification * noti = [[NSNotification alloc] initWithName:@"SELECTINDEXCHANGED" object:@{@"index":[NSString stringWithFormat:@"%ld", selectItem.tag - 100]} userInfo:nil];
    
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    
    if (selectItem.tag - 100 == 2) {
        return;
    }
    
    for (int i = 0; i < 5; i++) {
        
        HYTabBarItem * item = [self viewWithTag:100 + i];
        
        if (i != 2) {
            
            BOOL selected = item == selectItem ? YES : NO;
            
            [item setTitle:_item_titles[i] andIcon:_item_icon_normal[i] andCurrentSelected:selected];

        }
    }
}




@end
