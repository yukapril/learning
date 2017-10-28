//
//  SecondViewController.m
//  TabBar
//
//  Created by yukaPriL on 2017/10/22.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImage *normalImage = [[UIImage imageNamed:@"tab_cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectedImage = [[UIImage imageNamed:@"tab_cart_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:normalImage selectedImage:selectedImage];
    // 当前页为 navigation 页，默认title为第一个页面标题，上文设置title是无效的
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
