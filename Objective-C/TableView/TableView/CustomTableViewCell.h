//
//  CustomTableViewCell.h
//  TableView
//
//  Created by yukaPriL on 2017/10/29.
//  Copyright © 2017年 yukaPriL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageInfo.h"

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *msgImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

- (void)setupMsgInfo:(MessageInfo *)msgInfo;

@end
