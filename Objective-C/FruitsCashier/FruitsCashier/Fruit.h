//
//  Fruit.h
//  OCHelloWorld
//
//  Created by yukaPriL on 2017/9/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property NSString* name;
@property CGFloat price;

- (instancetype) initWithNameAndPrice: (NSString*) name : (CGFloat) price;

- (NSString*) say;

@end
