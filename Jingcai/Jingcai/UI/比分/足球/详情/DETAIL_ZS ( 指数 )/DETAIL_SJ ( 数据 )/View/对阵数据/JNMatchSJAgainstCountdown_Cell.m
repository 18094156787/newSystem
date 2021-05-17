//
//  JNMatchSJAgainstCountdown_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstCountdown_Cell.h"

@implementation JNMatchSJAgainstCountdown_Cell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.leftLineImgView];
    [self.leftLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab.mas_left).offset(-8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
    
    [self addSubview:self.rightLineImgView];
    [self.rightLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.left.equalTo(self.titleLab.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
    
    [self addSubview:self.minutesLab];
    [self.minutesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.size.mas_equalTo(CGSizeMake(AUTO(26), AUTO(26)));
    }];
    
    UILabel *leftLabel = [UILabel initWithTitle:@":" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_505050 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.minutesLab);
        make.right.equalTo(self.minutesLab.mas_left);
        make.width.mas_equalTo(AUTO(15));
    }];
    
    UILabel *rightLabel = [UILabel initWithTitle:@":" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_505050 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.minutesLab);
        make.left.equalTo(self.minutesLab.mas_right);
        make.width.mas_equalTo(AUTO(15));
    }];
    
    [self addSubview:self.hoursLab];
    [self.hoursLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.minutesLab);
        make.right.equalTo(leftLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(26), AUTO(26)));
    }];
    
    [self addSubview:self.secondsLab];
    [self.secondsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.minutesLab);
        make.left.equalTo(rightLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(AUTO(26), AUTO(26)));
    }];
    
    UILabel *caculateLab = [UILabel initWithTitle:@"大数据预测正在计算中…" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:caculateLab];
    [caculateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.minutesLab.mas_bottom).offset(AUTO(20));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"开赛前12小时将会给出结果！每小时更新，请准时查收！" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    infoLab.numberOfLines = 0;
    [self addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(caculateLab.mas_bottom).offset(AUTO(5));
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
    }];
    
}

- (void)data {
    self.titleLab.text = @"预测倒计时";
    self.hoursLab.text = @"0";
    self.minutesLab.text = @"0";
    self.secondsLab.text = @"0";
}

- (void)setHours:(NSString *)hours {
    _hours = hours;
    self.hoursLab.text = hours;
}

- (void)setMinutes:(NSString *)minutes {
    _minutes = minutes;
    self.minutesLab.text = minutes;
}

- (void)setSeconds:(NSString *)seconds {
    _seconds = seconds;
    self.secondsLab.text = seconds;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIImageView *)leftLineImgView {
    if (!_leftLineImgView) {
        _leftLineImgView = [UIImageView new];
        _leftLineImgView.image = JCIMAGE(@"match_dec_left");
    }
    return _leftLineImgView;
}
- (UIImageView *)rightLineImgView {
    if (!_rightLineImgView) {
        _rightLineImgView = [UIImageView new];
        _rightLineImgView.image = JCIMAGE(@"match_dec_right");
    }
    return _rightLineImgView;
}

- (UILabel *)hoursLab {
    if (!_hoursLab) {
        _hoursLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_hoursLab hg_setAllCornerWithCornerRadius:1];
    }
    return _hoursLab;
}

- (UILabel *)minutesLab {
    if (!_minutesLab) {
        _minutesLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_minutesLab hg_setAllCornerWithCornerRadius:1];
    }
    return _minutesLab;
}

- (UILabel *)secondsLab {
    if (!_secondsLab) {
        _secondsLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_secondsLab hg_setAllCornerWithCornerRadius:1];
    }
    return _secondsLab;
}

@end
