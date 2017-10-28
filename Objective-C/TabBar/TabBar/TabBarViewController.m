//
//  TabBarViewController.m
//  TabBar
//
//  Created by yukaPriL on 2017/10/22.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "TabBarViewController.h"
//#import "FirstViewController.h"
//#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    FirstViewController *first = [[FirstViewController alloc]init];
//    SecondViewController *second =[[SecondViewController alloc]init];
//    ThirdViewController *third = [[ThirdViewController alloc]init];
//
//    self.viewControllers = @[first,second,third];
//
//
//    UIImage *normalImage1 = [[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectedImage1 = [[UIImage imageNamed:@"tab_home_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    first.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"First" image:normalImage1 selectedImage:selectedImage1];
//
//    UIImage *normalImage2 = [[UIImage imageNamed:@"tab_cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectedImage2 = [[UIImage imageNamed:@"tab_cart_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:normalImage2 selectedImage:selectedImage2];
//   // 当前页为 navigation 页，默认title为第一个页面标题，上文设置title是无效的
//
//    UIImage *normalImage3 = [[UIImage imageNamed:@"tab_cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectedImage3 = [[UIImage imageNamed:@"tab_cart_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Third" image:normalImage3 tag:selectedImage3];
    
    
    
    // 改变背景图片
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"barBack"];
    
    // 改变背景颜色
//    self.tabBar.barTintColor = [UIColor grayColor];
    
    // 背景透明(默认YES-毛玻璃效果，NO-不透明)
//    self.tabBar.translucent = NO;
    
    // 改变分割条(需要同时改变背景图片)
//    self.tabBar.shadowImage = [UIImage imageNamed:@"shadowBorder"];
    
    // 改变选中的颜色
    self.tabBar.tintColor = [UIColor greenColor];
    
    // 改变选中的背景图
//    self.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tab_indicator"];
    
    // 设置按钮宽度、间距(针对iPad有效)
//    self.tabBar.itemWidth = 60;
//    self.tabBar.itemSpacing = 10;
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if([viewController isKindOfClass:[ThirdViewController class]]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = NO;
        [self presentViewController:picker animated:YES completion:nil];
        return NO;
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"viewController: %@",viewController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end
