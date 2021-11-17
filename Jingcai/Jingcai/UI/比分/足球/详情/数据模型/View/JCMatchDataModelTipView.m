//
//  JCMatchDataModelTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/17.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMatchDataModelTipView.h"

@implementation JCMatchDataModelTipView
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
    
    [self.buyBgView addSubview:self.buyBtn];
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(50));
    }];
    

    
    WeakSelf;
    [self.buyBtn bk_whenTapped:^{
        if (weakSelf.JCBuyBlock) {
            weakSelf.JCBuyBlock();
        }
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

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _buyBtn.layer.cornerRadius = AUTO(22);
        _buyBtn.layer.masksToBounds = YES;
        
    }
    return _buyBtn;
}

@end
