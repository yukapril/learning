//
//  NormalTableViewCell.m
//  TableView
//
//  Created by yukaPriL on 2017/10/30.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "NormalTableViewCell.h"

@implementation NormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSLog(@"initWithStyle For Normal Cell");
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    NSLog(@"initWithCoder For Normal Cell");
    return self;
}

@end
