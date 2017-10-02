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
        [fruits addObject:[[Fruit alloc] initWithName:@"apple1" price:1.0]];
        [fruits addObject:[[Fruit alloc] initWithName: @"apple2" price: 1.5]];
        [fruits addObject:[[Fruit alloc] initWithName: @"orange1" price: 2.0]];
        [fruits addObject:[[Fruit alloc] initWithName: @"orange2" price: 2.5]];
        [fruits addObject:[[Fruit alloc] initWithName: @"banana1" price: 3.0]];
        [fruits addObject:[[Fruit alloc] initWithName: @"banana2" price: 3.5]];
    
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
