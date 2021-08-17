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
    
    self.backImgView.layer.borderWidth = 1;
    self.backImgView.layer.borderColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0].CGColor;

    self.backImgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.backImgView.layer.cornerRadius = 16;
    self.backImgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.12].CGColor;
    self.backImgView.layer.shadowOffset = CGSizeMake(0,0);
    self.backImgView.layer.shadowOpacity = 1;
    self.backImgView.layer.shadowRadius = 10;
    
    
    [self addSubview:self.backImgView];
    self.backImgView.frame = CGRectMake(0, 0, 200, 32);
    
    [self.backImgView addSubview:self.firBtn];
    self.firBtn.frame = CGRectMake(2, 0, 48, 28);
    self.firBtn.centerY = self.backImgView.centerY;
    
    [self.backImgView addSubview:self.secBtn];
    self.secBtn.frame = CGRectMake(2+48,0, 48, 28);
    self.secBtn.centerY = self.backImgView.centerY;
    
    [self.backImgView addSubview:self.thirdBtn];
    self.thirdBtn.frame = CGRectMake(2+48*2,0, 48, 28);
    self.thirdBtn.centerY = self.backImgView.centerY;
    
    [self.backImgView addSubview:self.fourBtn];
    self.fourBtn.frame = CGRectMake(2+48*3,0, 48, 28);
    self.fourBtn.centerY = self.backImgView.centerY;
    
}

- (void)showAll {
    self.selectBtn.selected = NO;
    self.selectBtn.backgroundColor = JCWhiteColor;
    self.selectIndex = 0;
    self.firBtn.selected = YES;
    self.secBtn.selected = NO;
    self.thirdBtn.selected = NO;
    self.fourBtn.selected = NO;
    self.selectBtn = self.firBtn;
    self.selectBtn.backgroundColor = JCBaseColor;
}

- (void)showImportmant{
    self.selectBtn.selected = NO;
    self.selectBtn.backgroundColor = JCWhiteColor;
    self.selectIndex = 1;
    self.firBtn.selected = NO;
    self.secBtn.selected = YES;
    self.thirdBtn.selected = NO;
    self.fourBtn.selected = NO;
    self.selectBtn = self.secBtn;
    self.selectBtn.backgroundColor = JCBaseColor;
}

- (void)showJingZu {
    self.selectBtn.selected = NO;
    self.selectBtn.backgroundColor = JCWhiteColor;
    self.selectIndex = 2;
    
    self.firBtn.selected = NO;
    self.secBtn.selected = NO;
    self.thirdBtn.selected = YES;
    self.fourBtn.selected = NO;
    self.selectBtn = self.thirdBtn;
    self.selectBtn.backgroundColor = JCBaseColor;
}

- (void)showBeiDan {
    self.selectBtn.selected = NO;
    self.selectBtn.backgroundColor = JCWhiteColor;
    self.selectIndex = 3;
    self.firBtn.selected = NO;
    self.secBtn.selected = NO;
    self.thirdBtn.selected = NO;
    self.fourBtn.selected = YES;
    self.selectBtn = self.fourBtn;
    self.selectBtn.backgroundColor = JCBaseColor;
}

- (void)btnClick:(UIButton *)sender {
    
    //防止重复点击
    {
        self.firBtn.userInteractionEnabled = NO;
        self.secBtn.userInteractionEnabled = NO;
        self.thirdBtn.userInteractionEnabled = NO;
        self.fourBtn.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.firBtn.userInteractionEnabled = YES;
            self.secBtn.userInteractionEnabled = YES;
            self.thirdBtn.userInteractionEnabled = YES;
            self.fourBtn.userInteractionEnabled = YES;
        });
    }
    self.selectIndex = sender.tag-100;
    if (self.JCBlock) {
        self.JCBlock(sender.tag-100);
    }
    self.selectBtn.backgroundColor = JCWhiteColor;
    self.selectBtn.selected = !self.selectBtn.selected;
    
    sender.selected =  !sender.selected;
    sender.backgroundColor = JCBaseColor;
    self.selectBtn = sender;
     
}

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.backgroundColor = JCWhiteColor;
//        [_backImgView hg_setAllCornerWithCornerRadius:16];
//        _backImgView.image = JCIMAGE(@"ic_match_filterSegment");
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}

- (UIButton *)firBtn {
    if (!_firBtn) {
        _firBtn = [UIButton initWithText:@"全部" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_firBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_firBtn setTitleColor:COLOR_2F2F2F forState:0];
        [_firBtn hg_setAllCornerWithCornerRadius:14];
        _firBtn.tag = 100;
        

        [_firBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firBtn;
}

- (UIButton *)secBtn {
    if (!_secBtn) {
        _secBtn = [UIButton initWithText:@"热门" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_secBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_secBtn setTitleColor:COLOR_2F2F2F forState:0];
        [_secBtn hg_setAllCornerWithCornerRadius:14];
        _secBtn.tag = 101;
        [_secBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _secBtn.backgroundColor = JCBaseColor;
        _secBtn.selected = YES;
        self.selectBtn = _secBtn;
    }
    return _secBtn;
}

- (UIButton *)thirdBtn {
    if (!_thirdBtn) {
        _thirdBtn = [UIButton initWithText:@"竞足" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_thirdBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_thirdBtn setTitleColor:COLOR_2F2F2F forState:0];
        [_thirdBtn hg_setAllCornerWithCornerRadius:14];
        _thirdBtn.tag = 102;
        

        [_thirdBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _thirdBtn;
}

- (UIButton *)fourBtn {
    if (!_fourBtn) {
        _fourBtn = [UIButton initWithText:@"北单" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_fourBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_fourBtn setTitleColor:COLOR_2F2F2F forState:0];
        [_fourBtn hg_setAllCornerWithCornerRadius:14];
        _fourBtn.tag = 103;
        

        [_fourBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fourBtn;
}
@end
