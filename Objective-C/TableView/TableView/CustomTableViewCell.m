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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupMsgInfo:(MessageInfo *)msgInfo{
    self.titleLabel.text = msgInfo.title;
    self.detailLabel.text = msgInfo.detail;
    self.timeLabel.text = msgInfo.timeString;
    self.hintLabel.text = [NSString stringWithFormat:@"%@",@(msgInfo.hintNum)];
    
}

@end
