//
//  CustomTableViewCell.m
//  TableView
//
//  Created by yukaPriL on 2017/10/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.hintLabel.clipsToBounds = YES;
    self.hintLabel.layer.cornerRadius = 10;
    self.msgImageView.image = [UIImage imageNamed:@"asset"];
    
}

// 设置是否高亮
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    self.contentView.backgroundColor = highlighted ? [UIColor yellowColor] :[UIColor whiteColor];
    self.hintLabel.backgroundColor = [UIColor redColor];
    NSLog(@"setHighlighted %@",highlighted ? @"YES" : @"NO");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = selected ? [UIColor blueColor] : [UIColor whiteColor];
    self.hintLabel.backgroundColor = [UIColor redColor];
    NSLog(@"setSelected %@", selected ? @"YES" : @"NO");
}

- (void)setupMsgInfo:(MessageInfo *)msgInfo{
    self.titleLabel.text = msgInfo.title;
    self.detailLabel.text = msgInfo.detail;
    self.timeLabel.text = msgInfo.timeString;
    self.hintLabel.text = [NSString stringWithFormat:@"%@",@(msgInfo.hintNum)];
}

@end
