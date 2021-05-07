//
//  JCChargeWayCell.m
//  Jingcai
//
//  Created by Administrator on 2019/1/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeWayCell.h"

@interface JCChargeWayCell ()
@property (weak, nonatomic) IBOutlet UIImageView * iconImageView;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView * radioImageView;
@end

@implementation JCChargeWayCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    self.titleLabel.textColor = COLOR_2F2F2F;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setPayWayBall:(JCPayWayBall *)payWayBall {
    _payWayBall = payWayBall;
    //选中状态
    if (payWayBall.state_issel) {
        self.radioImageView.image = [UIImage imageNamed:@"radio_red_selecte_new"];
    } else {
        self.radioImageView.image = [UIImage imageNamed:@"radio_red_normal"];
    }

}
@end
