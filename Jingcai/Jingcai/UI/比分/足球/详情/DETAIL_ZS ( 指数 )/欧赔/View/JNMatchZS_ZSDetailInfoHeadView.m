//
//  JNMatchZS_ZSDetailInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_ZSDetailInfoHeadView.h"

@implementation JNMatchZS_ZSDetailInfoHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(AUTO(90));
    }];
    
    [self addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.companyLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.windLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.equalLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.loseLab.mas_right);
        make.right.offset(0);
    }];


}



- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab = [UILabel initWithTitle:@"公司" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"平局" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"更新时间" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

@end
    
