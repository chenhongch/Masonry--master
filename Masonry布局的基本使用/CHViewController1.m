
//
//  CHViewController1.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
// 

#import "CHViewController1.h"

@interface CHViewController1 ()

@end

@implementation CHViewController1
- (void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.alpha = 0.5;
}
- (void)viewWillLayoutSubviews{
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.alpha = 0.5;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.alpha = 0.5;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 80, 70, 30);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(dimissView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dimissView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 self的规则
 大家需要记住下面的规则：
 1，实例方法里面的self，是对象的首地址。
 2，类方法里面的self，是Class.
 尽管在同一个类里面的使用self，但是self却有着不同的解读。在类方法里面的self，可以翻译成class self；在实例方法里面的self，应该被翻译成为object self。在类方法里面的self和实例方法里面的self有着本质上的不同，尽管他们的名字都叫self。
 
*/

@end
