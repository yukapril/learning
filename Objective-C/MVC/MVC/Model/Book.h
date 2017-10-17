//
//  Book.h
//  MVC
//
//  Created by yukaPriL on 2017/10/16.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Book : NSObject

@property NSString *name;
@property NSString *type;
@property CGFloat price;

+ (Book *)bookWithName:(NSString *)name
                  type:(NSString *)type
                 price:(CGFloat)price;
@end
