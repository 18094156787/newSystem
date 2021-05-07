//
//  JCMatchDateCell.m
//  FootBallScore
//
//  Created by 陈继伟 on 2020/2/25.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCMatchDateCell.h"

@implementation JCMatchDateCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    [self.contentView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(3));
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.weekLab];
    [self.weekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLab.mas_bottom).offset(AUTO(3));
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
//    if ([model.hot integerValue]==1) {
//        self.todayLab.hidden = NO;
//    }else{
//        self.todayLab.hidden = YES;
//    }
    if (model.select) {
        self.dateLab.textColor = COLOR_333333;
//        self.weekLab.textColor = JCBaseColor;
        self.weekLab.textColor = JCBaseColor;
    }else{
        self.dateLab.textColor = COLOR_333333;
//        self.weekLab.textColor = COLOR_333333;
        self.weekLab.textColor = COLOR_333333;
    }
}


- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _dateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(11)];
    }
    return _dateLab;
}

- (UILabel *)weekLab {
    if (!_weekLab) {
        _weekLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _weekLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(11)];
    }
    return _weekLab;
}

- (UILabel *)todayLab {
    if (!_todayLab) {
        _todayLab =[UILabel initWithTitle:@"今天" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_969BA3 andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _todayLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _todayLab;
}
@end
