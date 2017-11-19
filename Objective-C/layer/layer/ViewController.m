//
//  ViewController.m
//  layer
//
//  Created by yukaPriL on 2017/11/9.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CALayer *layer1 = [[CALayer alloc]init];
//    layer1.backgroundColor = [UIColor orangeColor].CGColor;
//    layer1.frame = CGRectMake(50, 50, 100, 100);
//    layer1.borderColor = [UIColor redColor].CGColor;
//    layer1.borderWidth = 5;
    // 圆角
//    layer1.cornerRadius = 25;
    // 防止内容溢出
//    layer1.masksToBounds = YES;
    // 修改中心点
//    layer1.anchorPoint = CGPointMake(0, 0);
//    NSLog(@"position: %@",NSStringFromCGPoint(layer1.position));
//    NSLog(@"frame%@",NSStringFromCGRect(layer1.frame));
    
    // 修改位置
    // layer1.position = CGPointMake(50, 50);
//    layer1.frame = CGRectMake(50, 50, 100, 100);
    // 加入图片
//    layer1.contents = (id)[UIImage imageNamed:@"dog"].CGImage;
//    layer1.transform = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
//    [self.view.layer addSublayer:layer1];
    
    UIView *subView1 = [[UIView alloc]init];
    subView1.backgroundColor = [UIColor grayColor];
    subView1.frame = CGRectMake(50, 100, 100, 100);
    [self.view addSubview:subView1];
    NSLog(@"subView1.layer %@",subView1.layer);
    
    UIView *subView2 = [[UIView alloc]init];
    subView2.backgroundColor = [UIColor orangeColor];
    subView2.frame = CGRectMake(200, 100, 100, 100);
    [self.view addSubview:subView2];
    NSLog(@"subView2.layer %@",subView2.layer);
    
    CALayer *subLayer3 = [[CALayer alloc]init];
    subLayer3.backgroundColor = [UIColor redColor].CGColor;
    subLayer3.frame = CGRectMake(50, 250, 100, 100);
    [self.view.layer addSublayer:subLayer3];
    NSLog(@"sublayer3 %@",subLayer3);
 
    NSArray *subLayers = [self.view.layer sublayers];
    for (CALayer *subLayer in subLayers) {
        NSLog(@"layer: %@",subLayer);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
