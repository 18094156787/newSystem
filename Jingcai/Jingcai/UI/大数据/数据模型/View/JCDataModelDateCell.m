//
//  JCDataModelDateCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDataModelDateCell.h"

@implementation JCDataModelDateCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.bgVew = [UIView new];
    self.bgVew.layer.borderColor = JCClearColor.CGColor;
    self.bgVew.layer.cornerRadius = 8;
    self.bgVew.layer.borderWidth = 1;
//    [self.bgVew hg_setAllCornerWithCornerRadius:8];
    [self.contentView addSubview:self.bgVew];
    [self.bgVew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    [self.bgVew addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.bgVew addSubview:self.weekLab];
    [self.weekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLab.mas_bottom).offset(AUTO(2));
        make.centerX.equalTo(self.contentView);
    }];
    
    
//    [self.contentView addSubview:self.todayLab];
//    [self.todayLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];


    
//    [self data];
//
}

//- (void)data {
//    self.dateLab.text = @"02-19";
//    self.weekLab.text = @"星期三";
//}

- (void)setModel:(JCMatchTimeModel *)model {
    _model = model;
    self.dateLab.text = model.sort_time;
    self.weekLab.text = model.week;

    if (model.select) {
        self.dateLab.textColor = JCBaseColor;
//        self.weekLab.textColor = JCBaseColor;
        self.weekLab.textColor = JCBaseColor;
        self.bgVew.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.06];
        self.bgVew.layer.borderColor = COLOR_EF2F2F.CGColor;
    }else{
        self.dateLab.textColor = COLOR_2F2F2F;
//        self.weekLab.textColor = COLOR_333333;
        self.weekLab.textColor = COLOR_9F9F9F;
        self.bgVew.backgroundColor = self.clearBg?JCClearColor:JCWhiteColor;
        self.bgVew.layer.borderColor = JCClearColor.CGColor;
    }
}

- (void)setClearBg:(BOOL)clearBg {
    _clearBg = clearBg;
    if (self.clearBg) {
        self.backgroundColor = JCClearColor;
        self.bgVew.backgroundColor = JCClearColor;
    }else{
        self.backgroundColor = JCWhiteColor;
        self.bgVew.backgroundColor = JCWhiteColor;
    }
}


- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _dateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(11)];
    }
    return _dateLab;
}

- (UILabel *)weekLab {
    if (!_weekLab) {
        _weekLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _weekLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(11)];
    }
    return _weekLab;
}

- (UILabel *)todayLab {
    if (!_todayLab) {
        _todayLab =[UILabel initWithTitle:@"今天" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_969BA3 andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
//        _todayLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _todayLab;
}

@end
