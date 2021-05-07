//
//  JCAIPlanBuyInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIPlanBuyInfoView.h"

@implementation JCAIPlanBuyInfoView


- (void)initViews {
    [self addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(5);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
    }];
   
}
- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.timeLab.text = [NSString stringWithFormat:@"%@",dianPingBall.base_info.created_at];
//    [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm 发布" time:[dianPingBall.base_info.time doubleValue]];
//    [NSString stringWithFormat:@"%@ 发布",dianPingBall.time];

    self.typeLab.text = [NSString stringWithFormat:@"  %@  ",dianPingBall.base_info.classfly_desc];
    self.typeLab.hidden = dianPingBall.base_info.classfly_desc.length>0?NO:YES;
    if ([dianPingBall.base_info.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if([dianPingBall.base_info.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
    if (dianPingBall.base_info.isbuy==1) {
        self.statusLab.text = @"已购买";
        self.statusLab.textColor = COLOR_2F2F2F;
    }else{
        self.statusLab.textColor = JCBaseColor;
        if ([dianPingBall.base_info.sf intValue]==0) {
            self.statusLab.text = @"免费";
        }else{
            NSString *price = [NSString stringWithFormat:@"%@红币",@([dianPingBall.base_info.sf floatValue]/100.0f)];
            self.statusLab.text = price;
        }
    }
    if (self.isMine) {
        if (dianPingBall.base_info.zucai_order_refund_status==4) {
            self.statusLab.text = @"已退款";
            self.statusLab.textColor = COLOR_30B27A;
        }else{

            self.statusLab.text = [NSString stringWithFormat:@"实付:%@红币",dianPingBall.base_info.zucai_order_pay_price];
            self.statusLab.textColor = [COLOR_000000 colorWithAlphaComponent:0.6];
        }
    }
//    self.statusLab.text = dianPingBall.zhong;
//    self.statusLab.textColor = [UIColor colorWithHexString:dianPingBall.zhong_color];

}


- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
        _typeLab.layer.borderColor = JCBaseColor.CGColor;
        _typeLab.layer.masksToBounds = YES;
        _typeLab.layer.cornerRadius = AUTO(8);

    }
    return _typeLab;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

@end
