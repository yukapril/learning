//
//  NavViewController.m
//  NavigationBar
//
//  Created by yukaPriL on 2017/10/19.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 配置状态栏颜色
// 首先要在 Main.storyboard 中配置此 controller 为导航 controller class
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
