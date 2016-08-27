//
//  TWTableViewCell.m
//  XianShang
//
//  Created by tao wai on 16/7/4.
//  Copyright © 2016年 jixuejiyong. All rights reserved.
//

#import "TWHeadTableViewCell.h"

@interface TWHeadTableViewCell()


@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabeldetail;
@property (weak, nonatomic) IBOutlet UILabel *statues;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statuesDetail;
@property (weak, nonatomic) IBOutlet UILabel *attentionLabel;
@property (weak, nonatomic) IBOutlet UILabel *attentionLabelDetail;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabelDetail;

@property (weak, nonatomic) IBOutlet UILabel *statuesLabelDetail;
@end

@implementation TWHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconView.layer.cornerRadius = self.iconView.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
    [self.infoLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(infoLabelClick:)]];
    [self.infoLabeldetail addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(infoLabelClick:)]];
    
    [self.statues addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statuesClick:)]];
    [self.statuesLabelDetail addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statuesClick:)]];
    
    [self.attentionLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(attentionClick:)]];
    [self.attentionLabelDetail addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(attentionClick:)]];
    
    [self.fansLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fansLabelClick:)]];
    [self.fansLabelDetail addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fansLabelClick:)]];
    
    
    
}

- (void)infoLabelClick:(UILabel *)label{
    self.leftMargin.constant = 20;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@(0),@"type", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"infoLabelClick" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)statuesClick:(UILabel *)label{
    self.leftMargin.constant = 20+(TWScreenW-16) * 0.25;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@(1),@"type", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"statuesClick" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)attentionClick:(UILabel *)label{
    self.leftMargin.constant = 20+(TWScreenW-16) * 0.5;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@(2),@"type", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"attentionClick" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)fansLabelClick:(UILabel *)label{
    self.leftMargin.constant = 20+(TWScreenW-16) * 0.75;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@(3),@"type", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"fansLabelClick" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
