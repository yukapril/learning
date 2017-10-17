//
//  ViewController.m
//  Event
//
//  Created by yukaPriL on 2017/10/17.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupView {
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 20, 200, 50);
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    [label setText:@"tap here"];
    [label setTextColor:[UIColor whiteColor]];
    [view addSubview:label];

    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTouchUpInside:)];
    [label addGestureRecognizer:labelTapGestureRecognizer];
}

- (void)labelTouchUpInside:(UITapGestureRecognizer *)recognizer {
    NSLog(@"tap label,text(%@)", ((UILabel *) recognizer.view).text);
}

- (IBAction)buttonTouchUpInside:(id)sender {
    NSLog(@"tap button");
}

@end

