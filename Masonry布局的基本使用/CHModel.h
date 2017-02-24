//
//  CHModel.h
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CHModel : NSObject

@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *nike; //昵称的label
@property (nonatomic,copy) NSString *time; //时间的label
@property (nonatomic,copy) NSString *content; //内容的label
/**
 *  评价图片
 */
@property (nonatomic,retain)NSArray *gImages;
//单元格的高度
@property (nonatomic,assign) CGFloat cellHeight;

@end
