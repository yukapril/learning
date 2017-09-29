//
//  Fruit.m
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

- (instancetype) initWithNameAndPrice: (NSString*) name : (CGFloat) price {
    self = [super init];
    if(self) {
        self.name = name;
        self.price = price;
    }
    return self;
}

- (NSString*) say {
   return self.name;
}




@end
