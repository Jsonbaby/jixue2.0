//
//  TWInfoTableViewCell.m
//  XianShang
//
//  Created by tao wai on 16/7/26.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWInfoTableViewCell.h"

@implementation TWInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.detailTextLabel.frame= CGRectMake(TWScreenW-250, 15, 209, 20);
}
@end
