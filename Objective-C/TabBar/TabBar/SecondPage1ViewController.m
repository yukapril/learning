//
//  SecondPage1ViewController.m
//  TabBar
//
//  Created by yukaPriL on 2017/10/22.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "SecondPage1ViewController.h"
#import "SecondPage2ViewController.h"

@interface SecondPage1ViewController ()

@end

@implementation SecondPage1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SecondPage1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickPush:(id)sender {
    SecondPage2ViewController *view = [[SecondPage2ViewController alloc]init];
    // 隐藏底部bar
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];

}

@end
