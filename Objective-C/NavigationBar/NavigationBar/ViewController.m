//
//  ViewController.m
//  NavigationBar
//
//  Created by yukaPriL on 2017/10/19.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Page1";
    
    // 更换背景图
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navback"] forBarMetrics:UIBarMetricsDefault];
    
    // 更换背景颜色
    // 修改状态栏颜色，需要在 Main.storyboard 中配置自定义 controller 来实现
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    
    
    // 设置 view 背景颜色
    //    self.view.backgroundColor = [UIColor blueColor];
    
    // 设置导航栏透明状态
    //    self.navigationController.navigationBar.translucent = NO;
    
    // 切除导航栏边线
    //    self.navigationController.navigationBar.clipsToBounds = YES;
    
    // 设置导航栏阴影边线（要求必须替换背景图才能生效）
//    self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"border"];
    
//    NSShadow *shadow = [NSShadow new];
//    [shadow setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.750f]];
//    [shadow setShadowOffset:CGSizeMake(0.0f, 1.0f)];
//    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, shadow, NSShadowAttributeName,  nil];
    
    // 设置阴影效果
//    [self.navigationController.navigationBar setTitleTextAttributes:navbarTitleTextAttributes];
    
    // 设置垂直偏移
//    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment: 10.0f forBarMetrics:UIBarMetricsDefault];
    
    // 设置返回按钮颜色
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    // 设置返回按钮图片（需要同时设置背景图片和转场图片）
//    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back"]];
//    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back"]];

    // 设置导航栏隐藏
//    [self.navigationController.navigationBar setHidden:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickPush:(id)sender {
    TargetViewController *targetViewController = [[TargetViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}


@end

