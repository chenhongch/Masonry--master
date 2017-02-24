//
//  PhotoImageView.h
//  E数字平台
//
//  Created by 陈红 on 16/1/29.
//  Copyright © 2016年 陈红. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PhotosViewOnImageTapBlock)(NSInteger cellIndex, NSInteger imageIndex);

@interface PhotoImageView : UIView

@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(NSUInteger)count;

@property (nonatomic, copy) PhotosViewOnImageTapBlock imageTapBlock;

@end


