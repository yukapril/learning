//
//  Block.m
//  BlockTest
//
//  Created by yukaPriL on 2017/10/8.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)putList:(NSArray *)list {
    _list = list;
}

- (NSMutableArray *)map:(id (^)(id obj))helper {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id item in _list) {
        [arr addObject:helper(item)];
    }
    return arr;
}
@end
