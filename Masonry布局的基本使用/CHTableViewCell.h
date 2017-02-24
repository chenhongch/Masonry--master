//
//  CHTableViewCell.h
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWeiXinPhotoContainerView.h"

@class CHModel;
//static  NSString *homeIndentifier=@"Cell";
@interface CHTableViewCell : UITableViewCell
//数据模型
@property (nonatomic,strong) CHModel *chModel;

//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(CHModel *)Model;

@end
