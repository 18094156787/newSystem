//
//  JCMineHeadItemView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMineHeadItemView.h"

@implementation JCMineHeadItemView

- (void)initViews {
    [self addSubview:self.numLab];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.numLab.mas_top).offset(2);
        make.left.equalTo(self.numLab.mas_right);
        make.width.height.mas_equalTo(8);
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numLab.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(30));
    }];
}

- (void)setNumber:(NSString *)number {
    _number = number;
    self.numLab.text = number;
    if (self.isMsg) {
        self.redView.hidden = [number integerValue]>0?NO:YES;
    }else {
        self.redView.hidden = YES;
    }
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

- (UILabel *)numLab {
    if (!_numLab) {
        _numLab = [UILabel labelTitle:@"0" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[JCWhiteColor colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView new];
        _redView.backgroundColor = JCBaseColor;
        _redView.layer.borderColor = JCWhiteColor.CGColor;
        _redView.layer.borderWidth = 1;
        _redView.layer.cornerRadius = 4;
        _redView.layer.masksToBounds = YES;
        _redView.hidden = YES;
    }
    return _redView;
}

@end
