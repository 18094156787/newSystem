//
//  JCTeamMatchInfoTimeChooseView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTimeChooseView.h"

@implementation JCTeamMatchInfoTimeChooseView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.bottom.offset(0);
        make.width.mas_equalTo(80);
    }];
    
    
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.selView];
    [self.selView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.height.mas_equalTo(AUTO(24));
//        make.size.mas_equalTo(CGSizeMake(AUTO(78), AUTO(24)));
    }];
    
    [self.selView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-AUTO(8));
        make.centerY.equalTo(self.selView);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    

    
    [self.selView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconImgView.mas_left).offset(AUTO(-5));
        make.centerY.equalTo(self);
        make.left.offset(AUTO(10));
        make.height.mas_equalTo(AUTO(15));
//        make.size.mas_equalTo(CGSizeMake(AUTO(65), AUTO(15)));
    }];
    
    self.timeLab.text = @"";
    
    
    WeakSelf;
    [self.selView bk_whenTapped:^{
        if (weakSelf.JCChooseBlock) {
            weakSelf.JCChooseBlock();
        }
    }];

}

- (void)setTitle:(NSString *)title  {
    _title = title;
}

- (void)setChangeSize:(BOOL)changeSize {
    _changeSize = changeSize;
    if (changeSize) {
//            [self.selView mas_updateConstraints:^(MASConstraintMaker *make) {
//
//            make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(24)));
//        }];
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab  = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
//        _titleLab.userInteractionEnabled = NO;
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab  = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//         _timeLab.userInteractionEnabled = NO;
    }
    return _timeLab;
}

-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = JCIMAGE(@"teamMatch_detail_icon_ls_dsj");
//        _iconImgView.userInteractionEnabled = NO;
    }
    return _iconImgView;
}

-(UIImageView *)upIconImgView {
    if (!_upIconImgView) {
        _upIconImgView = [UIImageView new];
        _upIconImgView.image = JCIMAGE(@"teamMatch_detail_icon_lx_dsj");
//        _iconImgView.userInteractionEnabled = NO;
    }
    return _upIconImgView;
}

- (UIView *)selView {
    if (!_selView) {
        _selView = [UIView new];
        _selView.layer.borderColor= COLOR_E4E4E4.CGColor;
        _selView.layer.borderWidth = 0.5;
        _selView.layer.cornerRadius = AUTO(12);
        _selView.layer.masksToBounds = YES;
//        _selView.userInteractionEnabled = NO;
    }
    return _selView;
}

@end
