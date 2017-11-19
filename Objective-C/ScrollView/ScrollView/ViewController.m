//
//  ViewController.m
//  ScrollView
//
//  Created by yukaPriL on 2017/10/28.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) UIView *subView1;
@property (nonatomic, weak) UIView *subView2;
@property (nonatomic, weak) UIView *subView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *subView1 = [[UIView alloc]init];
    [subView1 setBackgroundColor:[UIColor redColor]];
    [subView1 setFrame:CGRectMake(10, 40, 80, 180)];
    [self.scrollView addSubview:subView1];
    self.subView1 = subView1;
    
    UIView *subView2 = [[UIView alloc]init];
    [subView2 setBackgroundColor:[UIColor greenColor]];
    [subView2 setFrame:CGRectMake(100, 300, 150, 150)];
    [self.scrollView addSubview:subView2];
    self.subView2 = subView2;
    
    UIView *subView3 = [[UIView alloc]init];
    [subView3 setBackgroundColor:[UIColor blueColor]];
    [subView3 setFrame:CGRectMake(200, 500,90, 200)];
    [self.scrollView addSubview:subView3];
    self.subView3 = subView3;
    
    self.scrollView.delegate = self;
    
    // 缩放处理
    //    self.scrollView.minimumZoomScale = 1;
    //    self.scrollView.maximumZoomScale = 5;
    //    self.scrollView.zoomScale = 5;
    
    // 设置弹性
    //    self.scrollView.bounces = NO;
    
    // 设置内容位置偏移
    self.scrollView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
    // 设置滚动条位置偏移
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(80, 0, 0, 0);
    
    // 点击返回顶部
    //    self.scrollView.scrollsToTop = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 700);
    //    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*5, 700);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 滚动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@"%f, %f",scrollView.bounds.origin.x,scrollView.bounds.origin.y);
}

// 拖拽监听
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //    NSLog(@"start dragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //    NSLog(@"end dragging");
    //    NSLog(@"%f, %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    [self performSelector:@selector(scrollToPosition) withObject:nil afterDelay:2];
}

// 滚动到指定位置
-(void)scrollToPosition{
    [self.scrollView setContentOffset:CGPointMake(0, 50) animated:YES];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.subView1;
}


@end

