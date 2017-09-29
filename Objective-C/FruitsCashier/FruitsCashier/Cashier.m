//
//  Cashier.m
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "Cashier.h"
#import "Fruit.h"

@interface Cashier ()
@property NSArray<Fruit*>* fruits;
@end


@implementation Cashier

- (instancetype) initWithFruit: (NSArray<Fruit*>*) fruit {
    self = [super init];
    if(self) {
        self.fruits = fruit;
    }
    return self;
}

- (CGFloat) getDiscount: (Fruit*) fruit {
    NSInteger i = [self.fruits indexOfObject:fruit];
    if(i == NSNotFound) {
        return 1.0 * fruit.price;
    }
    if((i+1) % 2 == 0) {
        return 0.8 * fruit.price;
    }
    return 1.0 * fruit.price;
}

- (CGFloat) checkout {
    CGFloat sum = 0;
    for (Fruit* fruit in self.fruits) {
        CGFloat price = [self getDiscount:fruit];
        NSLog(@"商品: %@, 原价:%@, 现价:%@", fruit.name, @(fruit.price), @(price));
        sum += price;
    }
    return sum;
}


@end
