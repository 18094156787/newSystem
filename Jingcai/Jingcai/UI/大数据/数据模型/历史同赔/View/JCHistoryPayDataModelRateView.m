//
//  JCHistoryPayDataModelRateView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelRateView.h"

@implementation JCHistoryPayDataModelRateView

- (void)initViews {
    [self addSubview:self.topLab];
    [self.topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(18));
    }];
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.topLab.mas_bottom);
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.bottomLab];
    [self.bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.nameLab.mas_bottom);
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

@end
