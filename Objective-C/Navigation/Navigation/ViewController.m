//
//  ViewController.m
//  Navigation
//
//  Created by yukaPriL on 2017/10/18.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPush:(id)sender {
    TargetViewController *targetViewController = [[TargetViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (IBAction)clickModal:(id)sender {
    TargetViewController *targetViewController = [[TargetViewController alloc] init];
    [self presentViewController:targetViewController animated:YES completion:^{
        NSLog(@"modal complete!");
    }];
}

@end
