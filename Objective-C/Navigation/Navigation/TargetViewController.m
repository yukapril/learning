//
//  TargetViewController.m
//  Navigation
//
//  Created by yukaPriL on 2017/10/18.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "TargetViewController.h"

@interface TargetViewController ()

@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Modal back!");
    }];
}

- (IBAction)dismissPush:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
