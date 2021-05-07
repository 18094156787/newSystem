//
//  JCActivityTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityTipView.h"

@implementation JCActivityTipView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(50));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(315), AUTO(390)));
    }];
    
//    UIView *sureView = [UIView new];
////    sureView.userInteractionEnabled = YES;
//    [self.imgView addSubview:sureView];
//    [sureView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.offset(AUTO(-25));
//        make.centerX.equalTo(self.imgView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
//    }];
//    CAGradientLayer *gl = [CAGradientLayer layer];
//    gl.frame = CGRectMake(0,0,AUTO(275),AUTO(44));
//    gl.startPoint = CGPointMake(0.5, 0);
//    gl.endPoint = CGPointMake(0.5, 1);
//    gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:229/255.0 blue:145/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:201/255.0 blue:113/255.0 alpha:1.0].CGColor];
//    gl.locations = @[@(0), @(1.0f)];
//    sureView.layer.cornerRadius = AUTO(22);
//    sureView.layer.masksToBounds = YES;
//    [sureView.layer addSublayer:gl];
    
//    [sureView addSubview:self.sureBtn];
//    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(20));
        make.width.height.mas_equalTo(AUTO(40));
    }];
    

    WeakSelf;
//    [self.sureBtn bk_whenTapped:^{
//
//    }];
    
    [self.imgView bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            [weakSelf removeFromSuperview];
            weakSelf.JCSureBlock();
        }
    }];
    
    
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCancelBlock) {
            weakSelf.JCCancelBlock();
        }
    }];
}

//- (void)data {
//    self.imgView.backgroundColor = JCBaseColor;
//}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.userInteractionEnabled = YES;
        [_imgView hg_setAllCornerWithCornerRadius:20];
    }
    return _imgView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"点击领取福利" FontSize:AUTO(16) BackGroundColor:JCClearColor TextColor:UIColorFromRGB(0xE24F00)];
//        _sureBtn.userInteractionEnabled = YES;
    }
    return _sureBtn;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:UIControlStateHighlighted];
    }
    return _closeBtn;
}

@end
