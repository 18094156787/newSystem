//
//  JCHongBangCommomPriceView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongBangCommomPriceView.h"

@implementation JCHongBangCommomPriceView

- (void)initViews {
    [self addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(5);
        make.centerY.equalTo(self);
    }];
    
//    [self addSubview:self.hbIconImgView];
//    [self.hbIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.timeLab.mas_right).offset(AUTO(5));
//        make.centerY.equalTo(self);
//        make.width.mas_equalTo(AUTO(16));
//        make.height.mas_equalTo(AUTO(16));
//    }];
//
//    [self addSubview:self.priceLab];
//    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.hbIconImgView.mas_right).offset(2);
//        make.centerY.equalTo(self);
//    }];
    
    [self addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];
    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
        make.right.offset(0);
        make.centerY.equalTo(self.likeBtn);
    }];
}

- (void)setDianPingBall:(JCDianPingBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.likeLab.text = [dianPingBall.dz_number integerValue]>0?dianPingBall.dz_number:@"点赞";
    self.timeLab.text = dianPingBall.time;
    if ([dianPingBall.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if([dianPingBall.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
    self.typeLab.text = [NSString stringWithFormat:@" %@ ",dianPingBall.classfly_desc];
    if (dianPingBall.isbuy) {
        self.priceLab.text = @"已购";
        self.priceLab.textColor = COLOR_999999;
        self.hbIconImgView.image = JCIMAGE(@"icon_hongbi_gray");
    }else{
        self.priceLab.text = dianPingBall.wl_desc;
        self.priceLab.textColor = JCBaseColor;
        self.hbIconImgView.image = JCIMAGE(@"icon_hongbi");
    }
}


- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
    }
    return _typeLab;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIImageView *)hbIconImgView {
    if (!_hbIconImgView) {
        _hbIconImgView = [UIImageView new];
        _hbIconImgView.image = JCIMAGE(@"icon_hongbi");
    }
    return _hbIconImgView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _likeImgView.image = JCIMAGE(@"icon_dz_s_un");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}

@end
