//
//  JCDiscreteDataModelSampleTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDiscreteDataModelSampleTitleView.h"

@implementation JCDiscreteDataModelSampleTitleView

- (void)initViews {
//    UIView *topLineView = [UIView new];
//    topLineView.backgroundColor = COLOR_E8E8E8;
//    [self addSubview:topLineView];
//    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(1);
//        make.top.offset(0);
//    }];
    
    [self addSubview:self.compnayLab];
    [self.compnayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.compnayLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.chuLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.offset(0);
        make.left.equalTo(self.resultLab.mas_right);
    }];
    
//    UIView *bottmLineView = [UIView new];
//    bottmLineView.backgroundColor = COLOR_E8E8E8;
//    [self addSubview:bottmLineView];
//    [bottmLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(1);
//        make.bottom.offset(0);
//    }];
}

- (UILabel *)compnayLab {
    if (!_compnayLab) {
        _compnayLab =[UILabel initWithTitle:@"公司" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _compnayLab;
}

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"初赔/即赔" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab =[UILabel initWithTitle:@"赛果概率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}

- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab =[UILabel initWithTitle:@"返还率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateLab;
}

@end
