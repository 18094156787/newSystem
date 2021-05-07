//
//  JCHomeTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeTitleView.h"

@implementation JCHomeTitleView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
    }];
    
    [self addSubview:self.infoBgView];
    [self.infoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(25)));
    }];
    
    [self.infoBgView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(9)));
    }];
    
    [self.infoBgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-2);
        make.centerY.equalTo(self.titleLab);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"查看更多" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIView *)infoBgView {
    if (!_infoBgView) {
        _infoBgView = [UIView new];
    }
    return _infoBgView;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"icon_more_right");
    }
    return _indicateImgView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor =  [COLOR_000000 colorWithAlphaComponent:0.05];
    }
    return _lineView;
}

@end
