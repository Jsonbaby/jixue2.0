//
//  TWFriendsTableViewCell.m
//  即学即用
//
//  Created by tao wai on 16/5/9.
//  Copyright © 2016年 8lei. All rights reserved.
//

#import "TWFriendsTableViewCell.h"
#import "UIImage+MJ.h"
//#import "IWBadgeButton.m"
@implementation TWFriendsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 17.5, 32, 32)];
        [self.contentView addSubview:self.iconView];
        self.iconView.layer.cornerRadius = self.iconView.width * 0.5;
        self.iconView.layer.masksToBounds = YES;
        
        self.titleView = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 250, 20)];
        self.titleView.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:self.titleView];
        
        
        self.priceView=[[UILabel alloc]initWithFrame:CGRectMake(70, 40, 250, 10)];
        self.priceView.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:self.priceView];
        
        self.Btn = [[UIButton alloc] initWithFrame:CGRectMake(TWScreenW - 40, 35, 20, 20)];
        [self.Btn setTitle:@"5" forState:UIControlStateNormal];
        self.Btn.userInteractionEnabled = NO;
        [self.Btn setBackgroundImage:[UIImage resizedImageWithName:@"main_badge_os7"] forState:UIControlStateNormal];
        self.Btn.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.Btn];
        
        self.timeView = [[UILabel alloc] initWithFrame:CGRectMake(TWScreenW - 120, 10, 100, 25)];
        self.timeView.text = @"6月5日";
        self.timeView.textAlignment = NSTextAlignmentRight;
        self.timeView.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:self.timeView];
    }
    return self;

}


@end
