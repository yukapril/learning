//
//  ViewController.m
//  TableView
//
//  Created by yukaPriL on 2017/10/28.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
    [label setText:@"adsf"];
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
