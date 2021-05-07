//
//  JNMatchZS_ZF_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JNMatchZS_ZF_HeadView.h"

@implementation JNMatchZS_ZF_HeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCClearColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.bottom.offset(0);
    }];

    [bgView addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(AUTO(80));
    }];
    
    [bgView addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(bgView).offset(AUTO(-30));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [bgView addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.loseLab.mas_left);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [bgView addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.equalLab.mas_left);
        make.width.mas_equalTo(AUTO(70));
    }];

}


- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab = [UILabel initWithTitle:@"公司" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"平局" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}


- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

@end
