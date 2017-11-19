//
//  ViewController.m
//  maskLayer
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
    self.view.backgroundColor = [UIColor whiteColor];
//    [self imgMask];
//    [self gradientlayer];
    [self maskLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 特殊形状 mask
- (void)imgMask{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"chatImage"];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.frame = CGRectMake(50, 50, 200, 250);
    [self.view addSubview:imgView];
    
    UIImageView *imgViewMask = [[UIImageView alloc]init];
    imgViewMask.image = [[UIImage imageNamed:@"imageMask"] stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    imgViewMask.frame = imgView.bounds;
    imgView.layer.mask = imgViewMask.layer;
}

// 渐变效果
- (void)gradientlayer{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(100, 100, 150, 150);
    [layer setColors:@[
                       (id)[UIColor yellowColor].CGColor,
                       (id)[UIColor greenColor].CGColor,
                       (id)[UIColor blueColor].CGColor,
                       ]];
    [layer setLocations:@[@0.25,@0.5,@0.75]];
    [layer setStartPoint:CGPointMake(0, 0)];
    [layer setEndPoint:CGPointMake(1,0)];
//    [layer setColors:@[
//                       (id)[UIColor yellowColor].CGColor,
//                       (id)[UIColor greenColor].CGColor]];
//    [layer setLocations:@[@0.25,@0.75]];
//    [layer setStartPoint:CGPointMake(0, 0)];
//    [layer setEndPoint:CGPointMake(0.5, 0.5)];
    [self.view.layer addSublayer:layer];
}

// 倒影效果
- (void) maskLayer{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"nature"];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.frame = CGRectMake(50, 50, 150, 100);
    [self.view addSubview:imgView];
    
    // 制作倒影
    UIImageView *mirrorImgView = [[UIImageView alloc]init];
    mirrorImgView.image = imgView.image;
    mirrorImgView.contentMode = UIViewContentModeScaleToFill;
    mirrorImgView.transform = CGAffineTransformMakeScale(1, -1);
    mirrorImgView.bounds = imgView.bounds;
    mirrorImgView.center = CGPointMake(imgView.center.x, imgView.center.y + imgView.bounds.size.height);
    [self.view addSubview:mirrorImgView];
    
    // 制作倒影 mask 区域
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, imgView.frame.size.width, imgView.frame.size.height);
    // 从底部到顶部进行渐变
    [gradientLayer setColors:@[
                               (id)[UIColor clearColor].CGColor,
                               (id)[UIColor colorWithWhite:0 alpha:0.3].CGColor
                               ]];
    [gradientLayer setStartPoint:CGPointMake(0, 0.7)];
    [gradientLayer setEndPoint:CGPointMake(0, 1)];
    mirrorImgView.layer.mask = gradientLayer;
    
}







@end
