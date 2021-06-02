//
//  JCKindInviteView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindInviteView.h"

@implementation JCKindInviteView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(50));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(280), AUTO(508)));
    }];
    
    [self.bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.width.height.mas_equalTo(40);
    }];
    
    
    [self addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.bgView.mas_bottom).offset(16);
        make.size.mas_equalTo(CGSizeMake(AUTO(320), AUTO(44)));
    }];
    
    UILabel *inviteLab = [UILabel initWithTitle:@"分享给朋友，邀请朋友一起助力中国足球" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    inviteLab.userInteractionEnabled = YES;
    [self.shareBtn addSubview:inviteLab];
    [inviteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
    [inviteLab bk_whenTapped:^{
        if (!weakSelf.shareImage) {
            return;
            }
        if (weakSelf.JCBlock) {
            weakSelf.shareBtn.hidden = YES;
            weakSelf.JCBlock(self.shareImage);
            
        }
    }];
}



- (void)setImgUrl:(NSString *)imgUrl {
    _imgUrl = imgUrl;
    [self.bgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!error) {
            self.isFinish = YES;
            self.shareImage = image;
        }
    }];
}

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"mine_close_white") forState:0];
        [_closeBtn setImage:JCIMAGE(@"mine_close_white") forState:UIControlStateSelected];
    }
    return _closeBtn;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton new];
        _shareBtn.layer.cornerRadius = AUTO(22);
        _shareBtn.layer.masksToBounds = YES;
        CAGradientLayer *opGl = [CAGradientLayer layer];
        opGl.frame = CGRectMake(0,0,AUTO(320),AUTO(44));
        opGl.startPoint = CGPointMake(0, 0);
        opGl.endPoint = CGPointMake(1, 0);
        opGl.colors = @[(__bridge id)UIColorFromRGB(0xFB5735).CGColor, (__bridge id)UIColorFromRGB(0xFF3125).CGColor];
        opGl.locations = @[@(0), @(1.0f)];
        [_shareBtn.layer addSublayer:opGl];
    }
    return _shareBtn;
}

@end
