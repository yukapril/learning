//
//  main.m
//  BlockTest
//
//  Created by yukaPriL on 2017/10/8.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Block *block = [[Block alloc] init];
        [block putList:@[@"apple", @"banana"]];

        NSMutableArray *arr = [block map:^id(id obj) {
            NSString *str = [NSString stringWithFormat:@"%@!!", obj];
            return str;
        }];

        NSLog(@"%@", arr);
    }
    return 0;
}
