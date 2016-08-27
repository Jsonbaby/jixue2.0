//
//  TWVerticalButton.m
//  即学即用
//
//  Created by Apple on 16/4/5.
//  Copyright © 2016年 8lei. All rights reserved.
//

#import "TWVerticalButton.h"

@implementation TWVerticalButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:9];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = 4;
    self.imageView.y = 0;
    self.imageView.width = 14;
    self.imageView.height = 14;
    
    // 调整文字
    self.titleLabel.x = 2;
    self.titleLabel.y = self.imageView.height+4;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}


@end
