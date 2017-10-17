//
//  BookView.h
//  MVC
//
//  Created by yukaPriL on 2017/10/17.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookView : UIView
@property(strong, nonatomic) IBOutletCollection(UILabel) NSArray *bookName;
@property(strong, nonatomic) IBOutletCollection(UILabel) NSArray *bookType;
@property(strong, nonatomic) IBOutletCollection(UILabel) NSArray *bookPrice;
@end
