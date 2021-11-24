//
//  JNMatchSJAgainstTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstTipView.h"

@implementation JNMatchSJAgainstTipView

- (void)initViews {
    [self addSubview:self.tipImgView];
    [self.tipImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(146), AUTO(117)));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipImgView.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.centerX.equalTo(self);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.buyBgView];
    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.contentLab.mas_bottom);
        make.height.mas_equalTo(AUTO(150));
    }];
    
    [self.buyBgView addSubview:self.buyOneBtn];
    [self.buyOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(50));
    }];
    
    [self.buyBgView addSubview:self.buyMonthBtn];
    [self.buyMonthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.buyOneBtn.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(50));
    }];
    
    WeakSelf;
    [self.buyOneBtn bk_whenTapped:^{
        if (weakSelf.JCSingleMatchBlock) {
            weakSelf.JCSingleMatchBlock(1);
        }
    }];
    
    [self.buyMonthBtn bk_whenTapped:^{
        if (weakSelf.JCSingleMatchBlock) {
            weakSelf.JCSingleMatchBlock(2);
        }
    }];
}

- (void)setIsOnlyMonth:(BOOL)isOnlyMonth {
    _isOnlyMonth = isOnlyMonth;
    [self.buyMonthBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(50));
    }];
}

- (void)setIs_free:(BOOL)is_free {
    _is_free = is_free;
    [self.tipImgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(AUTO(240), AUTO(144)));
    }];
}



- (UIImageView *)tipImgView {
    if (!_tipImgView) {
        _tipImgView = [UIImageView new];
        _tipImgView.alpha = 0.5;
    }
    return _tipImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIView *)buyBgView {
    if (!_buyBgView) {
        _buyBgView = [UIView new];
    }
    return _buyBgView;
}

- (UIButton *)buyOneBtn {
    if (!_buyOneBtn) {
        _buyOneBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCWhiteColor TextColors:JCBaseColor];
        _buyOneBtn.layer.borderColor = JCBaseColor.CGColor;
        _buyOneBtn.layer.borderWidth = 1;
        _buyOneBtn.layer.cornerRadius = AUTO(22);
        _buyOneBtn.layer.masksToBounds = YES;
    }
    return _buyOneBtn;
}

- (UIButton *)buyMonthBtn {
    if (!_buyMonthBtn) {
        _buyMonthBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _buyMonthBtn.layer.cornerRadius = AUTO(22);
        _buyMonthBtn.layer.masksToBounds = YES;
        
    }
    return _buyMonthBtn;
}

@end
