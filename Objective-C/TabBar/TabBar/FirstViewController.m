//
//  FirstViewController.m
//  TabBar
//
//  Created by yukaPriL on 2017/10/22.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];

//    NSArray *items = [[[self tabBarController]tabBar]items];
//    items[0] == self.tabBarItem;

    // 重新创建 tabBarItem 来配置图片
    // 图片默认使用自动渲染，第二张图默认采用 tintColor 颜色来处理
    // 需要配置 imageWithRenderingMode 来防止此效果
//    UIImage *normalImage = [UIImage imageNamed:@"tab_home"];
    UIImage *normalImage = [[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:@"tab_home_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"First" image:normalImage selectedImage:selectedImage];
//
    // 设置角标
    self.tabBarItem.badgeValue = @"";
    // 设置文字位置偏移
    self.tabBarItem.titlePositionAdjustment = UIOffsetMake(-10, -10);
    // 设置阴影效果
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.750f]];
    [shadow setShadowOffset:CGSizeMake(0.0f, 1.0f)];
    NSDictionary *tabbarTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor yellowColor], NSShadowAttributeName:shadow};
    [self.tabBarItem setTitleTextAttributes:tabbarTitleTextAttributes forState:UIControlStateNormal];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
