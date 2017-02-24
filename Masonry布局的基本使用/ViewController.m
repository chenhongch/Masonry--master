//
//  ViewController.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
// 模块布局

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self addSubvi];
}
- (void)addSubvi{
    UILabel *bel = [[UILabel alloc]init];
    bel.backgroundColor = [UIColor greenColor];
    bel.text = @"商品类别1";
    [self.view addSubview:bel];
    
    UILabel *bel1 = [[UILabel alloc]init];
    bel1.backgroundColor = [UIColor orangeColor];
    bel1.text = @"商品类别2";
    [self.view addSubview:bel1];
    
    UILabel *bel2 = [[UILabel alloc]init];
    bel2.backgroundColor = [UIColor grayColor];
    bel2.text = @"商品类别3";
    [self.view addSubview:bel2];
    
    UILabel *bel3 = [[UILabel alloc]init];
    bel3.backgroundColor = [UIColor yellowColor];
    bel3.text = @"商品类别4";
    [self.view addSubview:bel3];
    
    UILabel *bel4 = [[UILabel alloc]init];
    bel4.backgroundColor = [UIColor purpleColor];
    bel4.text = @"商品类别5";
    [self.view addSubview:bel4];
    
    UILabel *bel5 = [[UILabel alloc]init];
    bel5.backgroundColor = [UIColor orangeColor];
    bel5.text = @"商品类别6";
    [self.view addSubview:bel5];

    
    __weak typeof (self) weakself = self;
    
    //布局
    [bel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(weakself.view);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width/2, 100));
    }];
    
    [bel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(weakself.view);
        make.left.mas_equalTo(bel.mas_right);
       make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width/2, 100));
    }];
    
    [bel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bel.mas_bottom);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width/3, 100));
    }];
    
    [bel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bel.mas_bottom);
        make.left.mas_equalTo(bel2.mas_right);
       make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width/3, 100));    }];
    
    [bel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bel.mas_bottom);
        make.left.mas_equalTo(bel3.mas_right);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width/3, 100));
    }];
    
    [bel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bel4.mas_bottom);
        make.left.right.bottom.mas_equalTo(weakself.view);
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
