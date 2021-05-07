//
//  JCAIPlanPriceInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIPlanPriceInfoView.h"

@implementation JCAIPlanPriceInfoView

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
    

    
    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.buyStatusLab];
    [self.buyStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];

}

- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    if (![dianPingBall isKindOfClass:[JCHongBangBall class]]) {
        return;;
    }
    _dianPingBall = dianPingBall;
    self.likeBtn.hidden = self.isMine?YES:NO;
    self.buyStatusLab.hidden = self.isMine?NO:YES;
    if (dianPingBall.base_info.zucai_order_refund_status==4) {
        self.buyStatusLab.text = @"已退款";
        self.buyStatusLab.textColor = COLOR_30B27A;
    }else{

        self.buyStatusLab.text = [NSString stringWithFormat:@"实付:%@红币",dianPingBall.base_info.zucai_order_pay_price];
        self.buyStatusLab.textColor = [COLOR_000000 colorWithAlphaComponent:0.6];
    }
    
//    self.buyStatusLab.textColor = [UIColor colorWithHexString:dianPingBall.zhong_color];
    
//    NSString *time = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[dianPingBall.base_info.time doubleValue]];

    self.timeLab.text = [NSString stringWithFormat:@"%@ 发布 %@人浏览",dianPingBall.base_info.created_at,NonNil(dianPingBall.base_info.click)];
    if ([dianPingBall.base_info.click intValue]==0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ 发布 ",dianPingBall.base_info.created_at];

    }
    if (dianPingBall.base_info.click.length==0||self.hideSee) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ 发布 ",dianPingBall.base_info.created_at];
    }
    
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

    if (dianPingBall.base_info.is_pay==1) {
        self.priceLab.text = @"已购买";
        self.priceLab.textColor = COLOR_2F2F2F;
    }else{
        self.priceLab.textColor = JCBaseColor;
        if ([dianPingBall.base_info.sf intValue]==0) {
            self.priceLab.text = @"免费";
        }else{
            NSString *price = [NSString stringWithFormat:@"%@红币",@([dianPingBall.base_info.sf floatValue]/100.0f)];
            self.priceLab.text = price;
        }
    }
//    if (dianPingBall.base_info.status==7) {
//        self.priceLab.textColor = COLOR_999999;
//        self.priceLab.text = @"等待接入";
////        self.priceLab.text = dianPingBall.status_type;
//        self.likeBtn.hidden = YES;
//        
//    }

    
    
    //已开奖的不展示价格 
    if (dianPingBall.base_info.wl>0) {

        self.priceLab.text = @"";
    }
    
}




- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
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


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _likeBtn;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"icon_click_s_un");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}

- (UILabel *)buyStatusLab {
    if (!_buyStatusLab) {
        _buyStatusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _buyStatusLab;
}
@end
