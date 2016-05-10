//
//  ViewController.m
//  TTButtonLineView
//
//  Created by TT_code on 16/4/27.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "ViewController.h"
#import "TTButtonLineView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // 1.
   // TTButtonLineView* view=
    [TTButtonLineView CreateButtonLineWithFram:CGRectMake(0, 50, self.view.bounds.size.width, 50) dataarray:@[@"服务订单",@"到期服务"] linecolor:[UIColor redColor] showview:self.view ButtonClickBlock:^(NSInteger tag) {
         NSLog(@"我点击的是%ld",(long)tag);
    }];
    
    
    
    [TTButtonLineView CreateButtonWidthEquelLineWidthWithFram:CGRectMake(0, 150, self.view.bounds.size.width, 50) dataarray:@[@"全部",@"待付款",@"待收款",@"待发货"] linecolor:[UIColor redColor] showview:self.view ButtonClickBlock:^(NSInteger tag) {
         NSLog(@"我点击的是%ld",(long)tag);
    }];
    
    
    
    [TTButtonLineView CreateButtonWidthEquelLineWidthWithFram:CGRectMake(0, 150, self.view.bounds.size.width, 50) dataarray:@[@"全部",@"待付款",@"待收款",@"待发货"] linecolor:[UIColor redColor] showview:self.view ButtonClickBlock:^(NSInteger tag) {
        NSLog(@"我点击的是%ld",(long)tag);
    }];
    
    
    
    [TTButtonLineView CreateButtonCenterLineWidthWithFram:CGRectMake(0, 300, self.view.bounds.size.width, 50) dataarray:@[@"推荐",@"热点",@"上海",@"视频",@"社会",@"订阅",@"娱乐",@"图片",@"科技",@"汽车",@"体育",@"财经",@"军事",@"国际",@"段子",@"趣图",@"美女",@"健康",@"正能量",@"特卖"] linecolor:[UIColor redColor] showview:self.view ButtonClickBlock:^(NSInteger tag) {
        NSLog(@"我点击的是%ld",(long)tag);
    }];
 
}



@end
