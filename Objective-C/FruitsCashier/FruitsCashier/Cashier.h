//
//  Cashier.h
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruit.h"

@interface Cashier : NSObject

- (instancetype) initWithFruit: (NSArray<Fruit*>*) fruit;

- (CGFloat) checkout;

@end
