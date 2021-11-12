//
//  JCHistoryPayDataModelColumnarView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelColumnarView.h"

@implementation JCHistoryPayDataModelColumnarView

- (void)initViews {
    
    [self addSubview:self.colorView];
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(50));
        make.width.mas_equalTo(AUTO(16));
    }];
    
    [self addSubview:self.topLab];
    [self.topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.equalTo(self.colorView.mas_top).offset(AUTO(-2));
        make.height.mas_equalTo(AUTO(18));
    }];
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.colorView.mas_bottom);
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.bottomLab];
    [self.bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.nameLab.mas_bottom);
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.bottomLab.mas_bottom).offset(AUTO(4));
        make.height.mas_equalTo(AUTO(18));
    }];
    
}

- (UILabel *)topLab {
    if (!_topLab) {
        _topLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _topLab;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}

- (UILabel *)bottomLab {
    if (!_bottomLab) {
        _bottomLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _bottomLab;
}

- (UIView *)colorView {
    if (!_colorView) {
        _colorView = [UIView new];
    }
    return _colorView;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_606062 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}
@end
