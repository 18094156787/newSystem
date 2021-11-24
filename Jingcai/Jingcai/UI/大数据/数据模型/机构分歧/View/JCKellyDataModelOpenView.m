//
//  JCKellyDataModelOpenView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelOpenView.h"

@implementation JCKellyDataModelOpenView

- (void)initViews {
    [self addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.equalTo(self.mas_centerX);
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.chuLab);
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equalLab);
        make.right.equalTo(self.equalLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equalLab);
        make.left.equalTo(self.equalLab.mas_right);
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    
    [self addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.left.equalTo(self.mas_centerX);
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self addSubview:self.ji_equalLab];
    [self.ji_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.jiLab);
        make.top.equalTo(self.jiLab.mas_bottom).offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    
    [self addSubview:self.ji_winLab];
    [self.ji_winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.ji_equalLab);
        make.right.equalTo(self.ji_equalLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    
    [self addSubview:self.ji_loseLab];
    [self.ji_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equalLab);
        make.left.equalTo(self.ji_equalLab.mas_right);
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(17)));
    }];
    

    
}
- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)winLab {
    if (!_winLab) {
        _winLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _winLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}
- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
}

- (UILabel *)ji_winLab {
    if (!_ji_winLab) {
        _ji_winLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _ji_winLab;
}

- (UILabel *)ji_equalLab {
    if (!_ji_equalLab) {
        _ji_equalLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _ji_equalLab;
}

- (UILabel *)ji_loseLab {
    if (!_ji_loseLab) {
        _ji_loseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _ji_loseLab;
}
@end
