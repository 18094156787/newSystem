//
//  JCPayFreeView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPayFreeView.h"

@implementation JCPayFreeView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(38));
        make.right.offset(AUTO(-38));
        make.top.offset(kNavigationBarHeight+AUTO(90));
        make.height.mas_equalTo(AUTO(335));
    }];
    
    [self.bgView addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(82));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.smallBgView];
    [self.smallBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(3));
        make.right.offset(AUTO(-3));
        make.top.equalTo(self.tipLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(105));
    }];
    
    [self.smallBgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.smallBgView);
        make.width.mas_equalTo(AUTO(80));
        make.left.offset(AUTO(10));
    }];
    
    [self.smallBgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right);
        make.top.offset(AUTO(20));
    }];
    
    [self.smallBgView addSubview:self.beginTimeLab];
    [self.beginTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
    }];
    
    [self.smallBgView addSubview:self.endTimeLab];
    [self.endTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right);
        make.top.equalTo(self.beginTimeLab.mas_bottom).offset(AUTO(19));
    }];
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smallBgView.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(150), AUTO(40)));
    }];
    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCWhiteColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.bgView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, AUTO(20)));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"xx_close") forState:0];
     [closeBtn setImage:JCIMAGE(@"xx_close") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(23), AUTO(23)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCUseBlock) {
            weakSelf.JCUseBlock();
        }
    }];

}




- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.image = JCIMAGE(@"freepay_bg");
    }
    return _bgView;
}

- (UIImageView *)smallBgView {
    if (!_smallBgView) {
        _smallBgView = [UIImageView new];
        _smallBgView.image = JCIMAGE(@"freepay_bg _mdq");
    }
    return _smallBgView;
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [UILabel initWithTitle:@"请注意免单券有效时间，尽快使用哦" andFont:AUTO(12) andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _tipLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"你有一次免费查看方案的机会，是否使用？" andFont:AUTO(13) andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确定使用" FontSize:AUTO(15) BackGroundColor:COLOR_FFC971 TextColors:COLOR_E24F00];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(4)];
    }
    return _sureBtn;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"免" andFont:AUTO(24) andWeight:0 andTextColor:COLOR_DD2744 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont boldSystemFontOfSize:AUTO(24)];
    }
    return _priceLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"免单券" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_DD2744 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
    }
    return _titleLab;
}

- (UILabel *)beginTimeLab {
    if (!_beginTimeLab) {
        _beginTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:[COLOR_DD2744 colorWithAlphaComponent:0.7] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _beginTimeLab;
}

- (UILabel *)endTimeLab {
    if (!_endTimeLab) {
        _endTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:[COLOR_DD2744 colorWithAlphaComponent:0.7] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _endTimeLab;
}

@end
