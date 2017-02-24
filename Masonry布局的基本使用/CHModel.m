
//
//  CHModel.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import "CHModel.h"
#import "CHTableViewCell.h"
@implementation CHModel

-(CGFloat)cellHeight
{
    //只在初始化的时候调用一次就Ok
    if(!_cellHeight){
        CHTableViewCell *cell=[[CHTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Hcell"];
        // 调用cell的方法计算出高度
        _cellHeight=[cell rowHeightWithCellModel:self];
      }
   
       return _cellHeight;
}

- (NSString *)time{
//    if (!_time) {
        _time = @"2017-2-22";
//    }
    return _time;
}
- (NSString *)nike{
    //    if (!_time) {
    _nike = @"ios_Hoen";
    //    }
    return _nike;
}

@end
