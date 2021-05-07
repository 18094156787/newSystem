//
//  JCMatchFilterSegmentView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchFilterSegmentView.h"

@implementation JCMatchFilterSegmentView

- (void)initViews {
    [self addSubview:self.backImgView];
    self.backImgView.frame = CGRectMake(0, 0, 112, 46);
    
    [self.backImgView addSubview:self.firBtn];
    self.firBtn.frame = CGRectMake(2, 2, 55, 42);
    self.firBtn.centerY = self.backImgView.centerY;
    
    [self.backImgView addSubview:self.secBtn];
    self.secBtn.frame = CGRectMake(55, 2, 55, 42);
    self.secBtn.centerY = self.backImgView.centerY;
    
}

- (void)showAll {
    self.selectIndex = 0;
    self.secBtn.selected = NO;
    self.firBtn.selected = YES;
    self.selectBtn = self.firBtn;
}

- (void)showImportmant{
    self.selectIndex = 1;
    self.secBtn.selected = YES;
    self.firBtn.selected = NO;
    self.selectBtn = self.secBtn;
}

- (void)btnClick:(UIButton *)sender {
    self.selectIndex = sender.tag-100;
    if (self.JCBlock) {
        self.JCBlock(sender.tag-100);
    }
    
    self.selectBtn.selected = !self.selectBtn.selected;
    sender.selected =  !sender.selected;
    self.selectBtn = sender;
     
}

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.image = JCIMAGE(@"ic_match_filterSegment");
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}

- (UIButton *)firBtn {
    if (!_firBtn) {
        _firBtn = [UIButton initWithText:@"全部" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_firBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_firBtn setTitleColor:[COLOR_000000 colorWithAlphaComponent:0.6] forState:0];
        [_firBtn setBackgroundImage:JCIMAGE(@"ic_fileter_match") forState:UIControlStateSelected];
        _firBtn.tag = 100;
        
        _firBtn.selected = YES;
        self.selectBtn = _firBtn;
        [_firBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firBtn;
}

- (UIButton *)secBtn {
    if (!_secBtn) {
        _secBtn = [UIButton initWithText:@"重要" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_secBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_secBtn setTitleColor:[COLOR_000000 colorWithAlphaComponent:0.6] forState:0];
        [_secBtn setBackgroundImage:JCIMAGE(@"ic_fileter_match") forState:UIControlStateSelected];
        _secBtn.tag = 101;
        [_secBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secBtn;
}

@end
