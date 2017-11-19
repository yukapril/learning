//
//  TargetViewController.m
//  CustomNavigationBar
//
//  Created by yukaPriL on 2017/10/20.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "TargetViewController.h"

@interface TargetViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) id<UIGestureRecognizerDelegate> originalDelegate;
@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Page2";
    
    // 设置导航栏按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
//    UIBarButtonItem *negSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    negSpaceItem.width = -10;
    
    // 左侧按钮
    UIBarButtonItem *leftBackItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
    customView.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    UIBarButtonItem *leftCloseItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItems = @[leftBackItem, customItem, leftCloseItem];
    
    // 右侧按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleView.backgroundColor = [UIColor blueColor];
    self.navigationItem.titleView = titleView;
    
    // 滑动隐藏导航栏
    self.navigationController.hidesBarsOnSwipe = YES;
    // 点击隐藏导航栏
//    self.navigationController.hidesBarsOnTap = YES;
    // 输入内容时候隐藏导航栏
//    self.navigationController.hidesBarsWhenKeyboardAppears = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 处理左滑动返回
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self.originalDelegate;
    self.originalDelegate = nil;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.originalDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void) goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
