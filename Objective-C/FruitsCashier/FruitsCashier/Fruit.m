//
//  Fruit.m
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

- (instancetype) initWithName: (NSString*) name price: (CGFloat) price {
    self = [super init];
    if(self) {
        _name = name;
        _price = price;
    }
    return self;
}

- (NSString*) say {
   return _name;
}




@end
