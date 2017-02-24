//
//  PhotoImageView.m
//  E数字平台
//
//  Created by 陈红 on 16/1/29.
//  Copyright © 2016年 陈红. All rights reserved.
//

#import "PhotoImageView.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#define HWStatusPhotoWH 80
#define HWStatusPhotoMargin 5
 #define HWStatusPhotoMaxCol(count) ((count==4)?2:3)
//#define HWStatusPhotoMaxCol(count) 3

@implementation PhotoImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
/*
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    NSUInteger photosCount = photos.count;
    
    // 创建足够数量的图片控件
    // 这里的self.subviews.count不要单独赋值给其他变量
    while (self.subviews.count < photosCount) {
        UIImageView *photoView = [[UIImageView alloc] init];
        // 内容模式
        photoView.contentMode = UIViewContentModeScaleAspectFill;
        // 超出边框的内容都剪掉
        photoView.clipsToBounds = YES;
        
        [self addSubview:photoView];
    }
    
    // 遍历所有的图片控件，设置图片
//        CGFloat width = 70;
//        CGFloat height = 70;
//        CGFloat margin = 20;
//        CGFloat startX = (self.frame.size.width - 3 * width - 2 * margin) * 0.5;
//        CGFloat startY = 10.0f/SCY;

    for (int i = 0; i<self.subviews.count; i++) {
        UIImageView *photoView = self.subviews[i];
//        photoView.frame = CGRectMake(startX, startY, width, height);
//        [self addSubview:photoView];
        if (i < photosCount) { // 显示
//             NSString *str = [NSString stringWithFormat:@"%@%@",COMMON_URL,photos[i]];
//            NSURL *url = [NSURL URLWithString:str];
//            [photoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"photo_Default"]];
            photoView.image = [UIImage imageNamed:photos[i]];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger photosCount = self.photos.count;
    int maxCol = HWStatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        UIImageView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (HWStatusPhotoWH + HWStatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (HWStatusPhotoWH + HWStatusPhotoMargin);
        photoView.width = HWStatusPhotoWH;
        photoView.height = HWStatusPhotoWH;
        photoView.userInteractionEnabled = YES;
    }
}

//- (void)addAllImage:(CGFloat)H witharry:(NSArray *)allimage{
//    NSInteger num = allimage.count;
//    if (num > 9) {
//        num = 9;
//    }
//    CGFloat width = 70;
//    CGFloat height = 70;
//    CGFloat margin = 20;
//    CGFloat startX = (self.view.frame.size.width - 3 * width - 2 * margin) * 0.5;
//    CGFloat startY = H+10.0f/SCY;
//    for (int i = 0; i<num; i++) {
//        UIImageView *imageView = [[UIImageView alloc] init];
//        NSString *str = [NSString stringWithFormat:@"%@%@",COMMON_URL,allimage[i]];
//        NSURL *url = [NSURL URLWithString:str];
//        [imageView sd_setImageWithPreviousCachedImageWithURL:url andPlaceholderImage:[UIImage imageNamed:@"Image_Default"] options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            
//        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        }];
//        
//        imageView.tag = 10 + i;
//        
//        // 计算位置
//        int row = i/3;
//        int column = i%3;
//        CGFloat x = startX + column * (width + margin);
//        CGFloat y = startY + row * (height + margin);
//        imageView.frame = CGRectMake(x, y, width, height);
//        [self addSubview:imageView];
//    }
//}
*/

+ (CGSize)sizeWithCount:(NSUInteger)count
{
    
        // 最大列数（一行最多有多少列）
        int maxCols = HWStatusPhotoMaxCol(count);
        //列数
        NSUInteger cols = (count >= maxCols)? maxCols : count;
        CGFloat photosW = cols * HWStatusPhotoWH + (cols - 1) * HWStatusPhotoMargin;
        
        // 行数
        NSUInteger rows = (count + maxCols - 1) / maxCols;
        CGFloat photosH = rows * HWStatusPhotoWH + (rows - 1) * HWStatusPhotoMargin;
        
        return CGSizeMake(photosW, photosH);
}



@end
