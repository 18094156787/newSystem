//
//  JCYesterdayAllRedTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYesterdayAllRedTipView.h"

@implementation JCYesterdayAllRedTipView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIImageView *bgView = [UIImageView new];
    bgView.userInteractionEnabled = YES;
    bgView.image = JCIMAGE(@"tc-zrqh");
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-AUTO(50));
        make.size.mas_equalTo(CGSizeMake(309, 236));
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.offset(-25);
        make.size.mas_equalTo(CGSizeMake(150, 44));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCWhiteColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.sureBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, AUTO(20)));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"xx_close") forState:0];
     [closeBtn setImage:JCIMAGE(@"xx_close") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(23), AUTO(23)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.sureBtn bk_whenTapped:^{
         [weakSelf removeFromSuperview];
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];
    
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即邀请" FontSize:AUTO(14) BackGroundColor:COLOR_FFC971 TextColor:COLOR_FF4642];
        [_sureBtn hg_setAllCornerWithCornerRadius:22];
    }
    return _sureBtn;
}


@end
