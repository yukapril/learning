//
//  NavStatistic.m
//  CustomNavigationBar
//
//  Created by yukaPriL on 2017/10/20.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "NavStatistic.h"

@interface NavStatistic()
// 判断是 push 还是 pop
@property (nonatomic, assign) NSInteger currentCount;
// 当前页面 controller
@property (nonatomic, weak) UIViewController *currentPage;
// 当前页面显示时间
@property (nonatomic, assign) NSTimeInterval currentShowTime;

@end

@implementation NavStatistic

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isPush = NO;
    if(navigationController.viewControllers.count > self.currentCount) {
        isPush = YES;
    }
    
    if(isPush) {
        if(self.currentPage){
            NSLog(@"first show view: %@, from: %@", NSStringFromClass([viewController class]),NSStringFromClass([self.currentPage class]));
        }else{
        NSLog(@"first show view: %@",NSStringFromClass([viewController class]));
        }
    }
    
    if(self.currentPage) {
        NSTimeInterval currentTime = [[NSDate date]timeIntervalSince1970];
        NSTimeInterval duration = currentTime - self.currentShowTime;
        NSLog(@"view: %@, hold: %f", NSStringFromClass([self.currentPage class]), duration);
    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.currentCount = [navigationController.viewControllers count];
    self.currentPage = viewController;
    self.currentShowTime = [[NSDate date]timeIntervalSince1970];
    
}

@end
