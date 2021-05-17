//
//  JNMatchSJInBallItemView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJInBallItemView.h"

@implementation JNMatchSJInBallItemView

- (void)initViews {
    [self addSubview:self.label90];
    [self.label90 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
    }];
    
    [self addSubview:self.label75];
    [self.label75 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label90.mas_left).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.label60];
    [self.label60 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label75.mas_left).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.label45];
    [self.label45 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label60.mas_left).offset(AUTO(-2));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.label30];
    [self.label30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label45.mas_left).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.label15];
    [self.label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label30.mas_left).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.totalLab];
    [self.totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label15.mas_left).offset(AUTO(-3));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
        make.top.equalTo(self.label90);
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.totalLab.mas_left).offset(AUTO(-12));
        make.left.offset(AUTO(12));
        make.centerY.equalTo(self.label90);
    }];
}

- (void)data {
    self.label90.backgroundColor = JCBaseColor;
    self.label75.backgroundColor = JCBaseColor;
    self.label60.backgroundColor = JCBaseColor;
    self.label45.backgroundColor = JCBaseColor;
    self.label30.backgroundColor = JCBaseColor;
    self.label15.backgroundColor = JCBaseColor;
    
//    self.totalLab.text = @"44";
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    NSInteger  maxValue = [[dataArray valueForKeyPath:@"@max.integerValue"] integerValue];
    NSLog(@"最大值%ld",maxValue);
    
    [dataArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = self.isHome?JCBaseColor:COLOR_A9A9A9;
        if (idx==0) {
            self.label15.text = [NSString stringWithFormat:@"%@",obj];
            self.label15.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }
        if (idx==1) {
            self.label30.text = [NSString stringWithFormat:@"%@",obj];
            self.label30.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }
        if (idx==2) {
            self.label45.text = [NSString stringWithFormat:@"%@",obj];
            self.label45.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }
        if (idx==3) {
            self.label60.text = [NSString stringWithFormat:@"%@",obj];
            self.label60.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }
        if (idx==4) {
            self.label75.text = [NSString stringWithFormat:@"%@",obj];
            self.label75.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }
        if (idx==5) {
            self.label90.text = [NSString stringWithFormat:@"%@",obj];
            self.label90.backgroundColor = [obj integerValue]>=maxValue?color:[color colorWithAlphaComponent:0.5];
        }

        
    }];
    

    
    NSInteger value = 0;
    for (NSNumber *score in dataArray) {
        value = value + [score integerValue];
    }
    self.totalLab.text = [NSString stringWithFormat:@"%ld",value];
    

    
}

- (UILabel *)label15 {
    if (!_label15) {
        _label15 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label15;
}

- (UILabel *)label30 {
    if (!_label30) {
        _label30 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label30;
}

- (UILabel *)label45 {
    if (!_label45) {
        _label45 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label45;
}

- (UILabel *)label60 {
    if (!_label60) {
        _label60 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label60;
}

- (UILabel *)label75 {
    if (!_label75) {
        _label75 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label75;
}

- (UILabel *)label90 {
    if (!_label90) {
        _label90 = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label90;
}

- (UILabel *)totalLab {
    if (!_totalLab) {
        _totalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _totalLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

@end
