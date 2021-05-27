//
//  JCActivityGuessFailureTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessFailureTipView.h"

@implementation JCActivityGuessFailureTipView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(80));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(312), AUTO(340)));
    }];
    
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(22));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    
    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.image = JCIMAGE(@"jc_guess_sorry");
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"icon_activity_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"icon_activity_close") forState:UIControlStateSelected];
    }
    return _closeBtn;
}
@end
