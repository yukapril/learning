//
//  YukaprilViewController.m
//  AppDelegate
//
//  Created by yukaPriL on 2017/11/8.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "YukaprilViewController.h"

@interface YukaprilViewController ()

@end

@implementation YukaprilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)applicationEnterBackground: (NSNotification *) notification{
    NSLog(@"background!!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
