//
//  CHTableViewCell.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
//

#import "CHTableViewCell.h"
#import "PhotoImageView.h"
#import "Masonry.h"
#import "CHModel.h"
@interface CHTableViewCell ()
@property (nonatomic,weak) UIImageView *icon;  //头像
@property (nonatomic,weak) UILabel *nikeLabel; //显示昵称的label
@property (nonatomic,weak) UILabel *content; //显示文本的label
@property (nonatomic,weak) UILabel *timeLabel; //显示时间的label
@property (nonatomic,weak) UIImageView *line;  //下划线

//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;
//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGSize ImagesSize;
@property (nonatomic,retain) SDWeiXinPhotoContainerView *picContainerView;

@end

@implementation CHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //1.添加子控件
        [self setupUI];
        
    }
    return self;
}

#pragma mark 添加子控件
-(void)setupUI
{
    //1.添加图片
    UIImageView *icon=[UIImageView new];
    icon.contentMode=UIViewContentModeScaleAspectFill;
    icon.clipsToBounds=YES;
    [self.contentView addSubview:icon];
    self.icon=icon;
    
    //2.添加昵称label
    UILabel *nike=[UILabel new];
    nike.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:nike];
    self.nikeLabel=nike;

    
    //2.添加内容label
    UILabel *content=[UILabel new];
    content.numberOfLines=0; //多行显示
    content.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:content];
    self.content=content;
    
    //3.添加时间label
    UILabel *timeLabel=[UILabel new];
    timeLabel.font=[UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    
    SDWeiXinPhotoContainerView *picContainerView = [SDWeiXinPhotoContainerView new];
    [self.contentView addSubview:picContainerView];
    self.picContainerView = picContainerView;
    
    //4.底部添加一条线
    UIImageView *line=[UIImageView new];
    line.backgroundColor=[UIColor grayColor];
    line.alpha = 0.3;
    [self.contentView addSubview:line];
    self.line=line;
    
/*
 *设置控件约束
 *
*/
 __weak __typeof(&*self)weakSelf = self;
    //1.设置图片的大小
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(10);
    }];
    
     //2.设置昵称
    [self.nikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.icon.mas_top).offset(2);
        make.left.mas_equalTo(weakSelf.icon.mas_right).offset(5);
        make.height.mas_equalTo(20);
    }];
    
     //3.设置时间
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nikeLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(weakSelf.icon.mas_right).offset(5);
        make.height.mas_equalTo(20);
    }];
    
    //4.设置内容
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.icon.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(10);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
        //文本高度height 得到模型的时候设置
    }];
    
    //5.设置图片
    [self.picContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.content.mas_bottom).offset(2);
        make.left.mas_equalTo(weakSelf.mas_left).offset(2);
    }];
    
    //6.设置下划线的大小
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
//        make.top.mas_equalTo(weakSelf.picContainerView.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
    }];
    
}

//传递数据模型
- (void)setChModel:(CHModel *)chModel{
    _chModel = chModel;
    self.icon.image = [UIImage imageNamed:chModel.icon];
    self.content.text = chModel.content;
    self.timeLabel.text = chModel.time;
    self.nikeLabel.text = chModel.nike;
    self.picContainerView.picPathStringsArray = chModel.gImages;
}

/*
 *获取行高
 */
- (CGFloat)rowHeightWithCellModel:(CHModel *)Model
{
    _chModel = Model;
    __weak __typeof(&*self)weakSelf = self;
    self.picContainerView.picPathStringsArray = _chModel.gImages;
    //1.设置标签的高度
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        //weakSelf.contentLabelH  这个会调用下面的懒加载方法
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
   
    [self.picContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 返回图片排列的高度
        make.size.mas_equalTo(weakSelf.ImagesSize);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.picContainerView.mas_bottom);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3. 获取最大值
    CGFloat h= CGRectGetMaxY(self.line.frame);
   
    return h+10;
}

/*
 *  懒加载的方法返回内容的高度
 */
- (CGFloat)contentLabelH
{
    if(!_contentLabelH){
        CGFloat h=[self.chModel.content boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        _contentLabelH=h;
    }
    return _contentLabelH;
}

- (CGSize)ImagesSize{
    if (!_ImagesSize.width) {
         CGSize PhotosSize = [_picContainerView sizeWithimage];
        _ImagesSize = PhotosSize;
    }
    return _ImagesSize;
}


@end
