//
//  Block.h
//  BlockTest
//
//  Created by yukaPriL on 2017/10/8.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject
@property NSArray *list;

- (void)putList:(NSArray *)list;

- (NSMutableArray *)map:(id (^)(id obj))helper;
@end
