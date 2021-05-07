//
//  JCChargeItemCell.m
//  Jingcai
//
//  Created by Administrator on 2019/1/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeItemCell.h"

@interface JCChargeItemCell ()
@property (weak, nonatomic) IBOutlet UIButton * chargeButton;
@property (weak, nonatomic) IBOutlet UILabel * sendLabel;
@property (weak, nonatomic) IBOutlet UIImageView * hotImageView;
@property (strong, nonatomic) UILabel * sendLab;
@end

@implementation JCChargeItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.chargeButton.backgroundColor = COLOR_F0F0F0;
    self.chargeButton.layer.borderColor = JCClearColor.CGColor;
    [self.sendLab hg_setCornerOnLeftTopAndBottomRightWithRadius:5];
    [self.chargeButton addSubview:self.sendLab];
    [self.sendLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(-2);
        make.size.mas_equalTo(CGSizeMake(36, 16));
    }];
}
- (IBAction)chargeBtnClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(chargeItemClick:)]) {
        [self.delegate chargeItemClick:self];
    }
}
- (void)setCaiyunBall:(JCCaiyunBall *)caiyunBall {
    _caiyunBall = caiyunBall;
    if (!caiyunBall) {
        return ;
    }
    NSString * tag_prize = [NSString stringWithFormat:@"%@元",NonNil(caiyunBall.price)];
    NSString * tag_send = [NSString stringWithFormat:@"送%@",NonNil(caiyunBall.present)];
    NSInteger tag_total_inter = [caiyunBall.price intValue]+[caiyunBall.present intValue];
    NSString * tag_total = [NSString stringWithFormat:@"%ld红币",tag_total_inter];
//    NonNil(caiyunBall.tag_total);r
    self.chargeButton.selected = caiyunBall.state_issel;
    self.sendLabel.hidden = YES;
    self.sendLab.hidden = !caiyunBall.state_isshowsend;
    self.hotImageView.hidden = !caiyunBall.hot;
    self.sendLab.text = NonNil(tag_send);
    {
        //未选中下的title
        NSMutableAttributedString * title = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n",tag_prize] attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)], NSForegroundColorAttributeName:COLOR_2F2F2F}];
        NSAttributedString * caiyun = [[NSAttributedString alloc] initWithString:tag_total attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)],NSForegroundColorAttributeName:COLOR_A9A9A9}];
        [title appendAttributedString:caiyun];
        
        NSMutableParagraphStyle * paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setLineSpacing:0];
        paraStyle.alignment = NSTextAlignmentCenter;
        [title addAttributes:@{NSParagraphStyleAttributeName:paraStyle} range:NSMakeRange(0, title.length)];
        [self.chargeButton setAttributedTitle:title forState:UIControlStateNormal];

    }
    {
        //选中下的title
        NSMutableAttributedString * title = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n",tag_prize] attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)], NSForegroundColorAttributeName:JCBaseColor}];
        NSAttributedString * caiyun = [[NSAttributedString alloc] initWithString:tag_total attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)],NSForegroundColorAttributeName:JCBaseColor}];
        [title appendAttributedString:caiyun];
        
        NSMutableParagraphStyle * paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setLineSpacing:0];
        paraStyle.alignment = NSTextAlignmentCenter;
        [title addAttributes:@{NSParagraphStyleAttributeName:paraStyle} range:NSMakeRange(0, title.length)];
        [self.chargeButton setAttributedTitle:title forState:UIControlStateSelected];

    }
    if (self.chargeButton.selected) {
        self.chargeButton.backgroundColor = COLOR_F0F0F0;
        self.chargeButton.layer.borderColor = JCBaseColor.CGColor;
    }else{
        self.chargeButton.backgroundColor = COLOR_F0F0F0;
        self.chargeButton.layer.borderColor = JCClearColor.CGColor;
    }
}

- (UILabel *)sendLab {
    if (!_sendLab) {
        _sendLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
        _sendLab.hidden = YES;
    }
    return _sendLab;
}
@end
