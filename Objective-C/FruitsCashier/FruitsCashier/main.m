//
//  main.m
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/26.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Fruit.h"
#import "Cashier.h"

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSMutableArray* fruits = [NSMutableArray array];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"apple1": 1.0]];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"apple2": 1.5]];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"orange1": 2.0]];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"orange2": 2.5]];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"banana1": 3.0]];
        [fruits addObject:[[Fruit alloc] initWithNameAndPrice: @"banana2": 3.5]];
    
//        NSLog(@"List: %@", fruits);
//        for (Fruit* fruit in fruits) {
//            NSLog(@"cart: %@", [fruit say]) ;
//        }
        
        Cashier* cashier = [[Cashier alloc] initWithFruit: fruits];
        CGFloat cash = [cashier checkout];
        NSLog(@"总计: %@",@(cash));
        
    }
    return 0;
}
