//
//  Book.m
//  MVC
//
//  Created by yukaPriL on 2017/10/16.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (Book *)bookWithName:(NSString *)name
                  type:(NSString *)type
                 price:(CGFloat)price {
    Book *b = [[Book alloc] init];
    [b setName:name];
    [b setType:type];
    [b setPrice:price];
    return b;
}

@end
