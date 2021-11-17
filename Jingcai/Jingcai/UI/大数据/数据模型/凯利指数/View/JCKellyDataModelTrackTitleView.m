//
//  JCKellyDataModelTrackTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelTrackTitleView.h"

@implementation JCKellyDataModelTrackTitleView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.plLab];
    [self.plLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(75));
    }];
    
    [self addSubview:self.klLab];
    [self.klLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.plLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(129));
    }];
    

    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.klLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.rateLab.mas_right);
        make.right.offset(AUTO(-15));
    }];
    
    
    
    UIView *bottmLineView = [UIView new];
    bottmLineView.backgroundColor = COLOR_E8E8E8;
    [self addSubview:bottmLineView];
    [bottmLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.bottom.offset(0);
    }];
}

- (UILabel *)plLab {
    if (!_plLab) {
        _plLab =[UILabel initWithTitle:@"赔率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"更新时间" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

@end
