//
//  JCKindSignTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindSignTipView.h"

@implementation JCKindSignTipView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(80));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(280), AUTO(306)));
    }];
    
    UIImageView *topImgView = [UIImageView new];
    topImgView.image = JCIMAGE(@"ic_kind_img_signin");
    [self.bgView addSubview:topImgView];
    [topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(224, 132));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"caiyun_close") forState:0];
    [closeBtn setImage:JCIMAGE(@"caiyun_close") forState:UIControlStateHighlighted];
    [self.bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.right.offset(0);
        make.width.height.mas_equalTo(40);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"签到成功" andFont:AUTO(18) andWeight:1 andTextColor:UIColorFromRGB(0x252424) andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImgView.mas_bottom).offset(24);
        make.centerX.equalTo(self.bgView);
    }];
    
    UILabel *scoreLab = [UILabel initWithTitle:@"积分 +1" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_FB5835 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:scoreLab];
    [scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(8);
        make.centerX.equalTo(self.bgView);
    }];
    
    UILabel *sureLab = [UILabel initWithTitle:@"我知道了" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:UIColorFromRGB(0xFF3125) andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:sureLab];
    [sureLab hg_setAllCornerWithCornerRadius:22];
    sureLab.userInteractionEnabled = YES;
    [sureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scoreLab.mas_bottom).offset(24);
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(128, 44));
    }];
    
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
    [sureLab bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:4];
    }
    return _bgView;
}

@end
