//
//  MessageInfo.h
//  TableView
//
//  Created by yukaPriL on 2017/10/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInfo : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, assign) NSInteger hintNum;

@end
