//
//  ViewController.m
//  CustomNavigationBar
//
//  Created by yukaPriL on 2017/10/20.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"
#import "NavStatistic.h"

@interface ViewController ()
@property (nonatomic, strong) NavStatistic *navStatistic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Page1";
    // 托管到 NavStatistic 上
    self.navStatistic = [[NavStatistic alloc]init];
    self.navigationController.delegate = self.navStatistic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickPush:(id)sender {
    TargetViewController *targetVC = [[TargetViewController alloc] init];
    [self.navigationController pushViewController:targetVC animated:YES];
}

@end
