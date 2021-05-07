//
//  JNMatchZS_BD_SPFHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_BD_SPFHeadView.h"

@implementation JNMatchZS_BD_SPFHeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F4F6F9;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(AUTO(140));
    }];
    
    [bgView addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.eqalLab];
    [self.eqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.loseLab.mas_left);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.eqalLab.mas_left);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.rqLab];
    [self.rqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.windLab.mas_left);
        make.width.mas_equalTo(AUTO(45));
    }];
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"发布时间" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UILabel *)rqLab {
    if (!_rqLab) {
        _rqLab = [UILabel initWithTitle:@"让球" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rqLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"胜" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)eqalLab {
    if (!_eqalLab) {
        _eqalLab = [UILabel initWithTitle:@"平" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _eqalLab;
}


- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"负" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

@end
