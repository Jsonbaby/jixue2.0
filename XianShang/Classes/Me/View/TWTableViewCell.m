//
//  TWTableViewCell.m
//  XianShang
//
//  Created by tao wai on 16/7/4.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWTableViewCell.h"

@implementation TWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
