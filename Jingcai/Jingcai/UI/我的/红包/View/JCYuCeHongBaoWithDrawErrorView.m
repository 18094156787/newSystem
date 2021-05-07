//
//  JCYuCeHongBaoWithDrawErrorView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoWithDrawErrorView.h"

@implementation JCYuCeHongBaoWithDrawErrorView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.offset(kNavigationBarHeight+AUTO(100));
//        make.height.mas_equalTo(AUTO(230));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(25));
        make.centerX.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(20));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self.bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(25));
        make.centerX.equalTo(self.bgView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self.bgView     addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(35));
        make.height.mas_equalTo(AUTO(46));
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.offset(kNavigationBarHeight+AUTO(100));
        make.bottom.equalTo(self.sureBtn.mas_bottom).offset(AUTO(25));
    }];
    
    self.titleLab.text = @"提现失败";
    [self.sureBtn setTitle:@"我知道了" forState:0];
    

    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.offset(kNavigationBarHeight+AUTO(100));
        make.bottom.equalTo(self.sureBtn.mas_bottom).offset(AUTO(35));
    }];
    
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];
    
}

- (void)setErrorString:(NSString *)errorString {
    _errorString = errorString;
    NSString *infoString = errorString;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    paragraphStyle.lineSpacing = 5; // 设置行间距
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:infoString];
    [atext addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:infoString.rangeOfAll];
    self.contentLab.attributedText = atext;
}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(26)];

    }
    return _sureBtn;
}



@end
