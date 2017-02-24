//
//  HYTabBarItem.m
//  HYTabBarController
//
//  Created by 王厚一 on 16/11/4.
//  Copyright © 2016年 why. All rights reserved.
//

#import "HYTabBarItem.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface HYTabBarItem () {
    UILabel * _titleLabel;//标题
    UILabel * _iconLabel;//图标
    
    float _fontSize;
}

@end

@implementation HYTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
                
        self.backgroundColor = [UIColor clearColor];
        
        if (self.tag != 102) {
            _iconLabel = [[UILabel alloc] init];
            
            if (SCREEN_WIDTH == 320.00) {//不同尺寸的屏幕对应iconfont的大小
                
                _fontSize = 4;
                _iconLabel.frame = CGRectMake(self.frame.size.width / 8.0 * 3, 10, self.frame.size.width / _fontSize, self.frame.size.width / _fontSize);
                
            }else if (SCREEN_WIDTH == 375.00) {
                
                _fontSize = 3.5;
                _iconLabel.frame = CGRectMake(self.frame.size.width / 14.0 * 5, 10, self.frame.size.width / _fontSize, self.frame.size.width / _fontSize);
                
            }else if (SCREEN_WIDTH == 414.00) {
                
                _fontSize = 3;
                _iconLabel.frame = CGRectMake(self.frame.size.width / 3, 10, self.frame.size.width / _fontSize, self.frame.size.width / _fontSize);
                
            }
            
            _iconLabel.font = [UIFont systemFontOfSize:self.frame.size.width / _fontSize];
            
            _iconLabel.textAlignment = NSTextAlignmentCenter;
            
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconLabel.frame)+5, self.frame.size.width, 15)];
            
            _titleLabel.font = [UIFont systemFontOfSize:12];
            
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            
            [self addSubview:_iconLabel];
            
            [self addSubview:_titleLabel];
        }
        
    }
    
    return self;
}

- (void)setTitle:(NSString *)title andIcon:(NSString *)icon andCurrentSelected:(BOOL)selected{
    
    _titleLabel.text = title;
    
    UIFont * iconfont = [UIFont fontWithName:@"iconfont" size:self.frame.size.width / _fontSize];
    
    _iconLabel.font = iconfont;
    
    _iconLabel.text = icon;
    
    if (selected) {
        
        _titleLabel.textColor = [UIColor colorWithRed:21.0f/255.0f green:194.0f/255.0f blue:159.0f/255.0f alpha:1];
        
        _iconLabel.textColor = [UIColor colorWithRed:21.0f/255.0f green:194.0f/255.0f blue:159.0f/255.0f alpha:1];
        
    }else {
        
        _titleLabel.textColor = [UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1];
        
        _iconLabel.textColor = [UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1];

    }
    
}



@end
