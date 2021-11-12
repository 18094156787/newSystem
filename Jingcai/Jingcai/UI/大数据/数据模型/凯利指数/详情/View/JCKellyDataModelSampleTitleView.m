//
//  JCKellyDataModelSampleTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelSampleTitleView.h"

@implementation JCKellyDataModelSampleTitleView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    [self addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self addSubview:self.plLab];
    [self.plLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.companyLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(90));
    }];
    
    [self addSubview:self.klLab];
    [self.klLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.plLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(105));
    }];
    

    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.klLab.mas_right);
        make.right.offset(AUTO(-15));
    }];

    
    
    

}

- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab =[UILabel initWithTitle:@"公司" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}


- (UILabel *)plLab {
    if (!_plLab) {
        _plLab =[UILabel initWithTitle:@"初赔/即赔" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _plLab;
}

- (UILabel *)klLab {
    if (!_klLab) {
        _klLab =[UILabel initWithTitle:@"凯利指数/凯利方差" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _klLab;
}

- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab =[UILabel initWithTitle:@"返还率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateLab;
}


@end
