//
//  JCJingCaiReasonRefuseView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/2.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCJingCaiReasonRefuseView.h"

@implementation JCJingCaiReasonRefuseView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
        UIButton *bottom = [UIButton new];
//        bottom.backgroundColor = [UIColor redColor];
        [self addSubview:bottom];
        [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(5, 5, 5, 5));
//            make.size.mas_equalTo(CGSizeMake(410, AUTO(200)));
        }];
    WeakSelf;
        [bottom bk_whenTapped:^{
            [weakSelf removeFromSuperview];
        }];

    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(35));
        make.right.offset(AUTO(-35));
        make.top.offset(AUTO(80)+kNavigationBarHeight);
        make.height.mas_equalTo(AUTO(250));
    }];


    [self addSubview:self.topImgView];
    [self.topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(70)+kNavigationBarHeight);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(164), AUTO(40)));
    }];

    [self.topImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topImgView);
        make.centerX.equalTo(self.topImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(164), AUTO(40)));
    }];


    [self.bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(40));
        make.bottom.equalTo(self.bgView).offset(AUTO(-60));

    }];

    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(105), AUTO(35)));
    }];

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];


}


- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"拒绝理由" andFont:AUTO(15) andWeight:UIFontWeightSemibold andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}




- (UIImageView *)topImgView {
    if (!_topImgView) {
        _topImgView = [UIImageView new];
        _topImgView.image = JCIMAGE(@"norule_title");
    }
    return _topImgView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(10)];
    }
    return _bgView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"重新填写" FontSize:AUTO(12) BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _sureBtn;
}

@end
