//
//  TWSystemTableViewCell.m
//  XianShang
//
//  Created by tao wai on 16/7/27.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWSystemTableViewCell.h"

@implementation TWSystemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.icon.layer.cornerRadius = self.icon.width * 0.5;
    self.icon.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
