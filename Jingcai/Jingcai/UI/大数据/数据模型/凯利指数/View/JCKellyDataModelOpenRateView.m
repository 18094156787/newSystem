//
//  JCKellyDataModelOpenRateView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelOpenRateView.h"

@implementation JCKellyDataModelOpenRateView

- (void)initViews {
    [self addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.bottom.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(24)));
    }];
    
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chuLab);
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(6));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(17)));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.winLab.mas_right);
        make.top.equalTo(self.winLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(17)));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalLab.mas_right);
        make.top.equalTo(self.winLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(17)));
    }];
    

    
    UIView *view = [UIView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chuLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(1, AUTO(48)));
    }];
    
    [self addSubview:self.zs_LoseLab];
    [self.zs_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-7));
        make.top.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.zs_EqualLab];
    [self.zs_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.zs_LoseLab.mas_left);
        make.top.equalTo(self.zs_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.zs_WinLab];
    [self.zs_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.zs_EqualLab.mas_left);
        make.top.equalTo(self.zs_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.zsLab];
    [self.zsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.zs_WinLab.mas_left);
        make.top.equalTo(self.zs_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(24)));
    }];
    
    [self addSubview:self.fc_LoseLab];
    [self.fc_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-7));
        make.bottom.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.fc_EqualLab];
    [self.fc_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fc_LoseLab.mas_left);
        make.top.equalTo(self.fc_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.fc_WinLab];
    [self.fc_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fc_EqualLab.mas_left);
        make.top.equalTo(self.fc_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(24)));
    }];
    
    [self addSubview:self.fcLab];
    [self.fcLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fc_WinLab.mas_left);
        make.top.equalTo(self.fc_LoseLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(24)));
    }];
    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fcLab.mas_left).offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(48), AUTO(48)));
    }];
    
}

- (void)setIs_jp:(BOOL)is_jp {
    _is_jp = is_jp;
    self.chuLab.text = is_jp?@"即赔":@"初赔";
}

//- (void)data {
//    self.winLab.text = @"3.78";
//    self.equalLab.text = @"3.78";
//    self.loseLab.text = @"3.78";
//    
//    
//    self.zs_WinLab.text = @"99.99";
//    self.zs_EqualLab.text = @"18.00";
//    self.zs_LoseLab.text = @"18.00";
//    self.fc_WinLab.text = @"18.00";
//    self.fc_EqualLab.text = @"18.00";
//    self.fc_LoseLab.text = @"18.00";
//}

- (void)setModel:(JCKellyDataModelOddsIndexModel *)model {
    _model = model;
    self.rateLab.text = [NSString stringWithFormat:@"返还率\n%@",model.loss_ratio];
    [model.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.winLab.text = obj;
        }
        if (idx==1) {
            self.equalLab.text = obj;
        }
        if (idx==2) {
            self.loseLab.text = obj;
        }
    }];
    [model.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.zs_WinLab.text = obj;
        }
        if (idx==1) {
            self.zs_EqualLab.text = obj;
        }
        if (idx==2) {
            self.zs_LoseLab.text = obj;
        }
    }];
    [model.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.fc_WinLab.text = obj;
        }
        if (idx==1) {
            self.fc_EqualLab.text = obj;
        }
        if (idx==2) {
            self.fc_LoseLab.text = obj;
        }
    }];
}



- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"初赔" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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

- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_606062 andBackgroundColor:UIColorFromRGB(0xF5F5F5) andTextAlignment:NSTextAlignmentCenter];
        _rateLab.numberOfLines = 0;
        _rateLab.layer.borderColor = COLOR_E8E8E8.CGColor;
        _rateLab.layer.borderWidth = 1;
        _rateLab.layer.cornerRadius = AUTO(24);
        _rateLab.layer.masksToBounds = YES;
    }
    return _rateLab;
}

- (UILabel *)zsLab {
    if (!_zsLab) {
        _zsLab =[UILabel initWithTitle:@"凯利指数" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zsLab;
}

- (UILabel *)zs_WinLab {
    if (!_zs_WinLab) {
        _zs_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_WinLab;
}
- (UILabel *)zs_EqualLab {
    if (!_zs_EqualLab) {
        _zs_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_EqualLab;
}

- (UILabel *)zs_LoseLab {
    if (!_zs_LoseLab) {
        _zs_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_LoseLab;
}

- (UILabel *)fcLab {
    if (!_fcLab) {
        _fcLab =[UILabel initWithTitle:@"凯利方差" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fcLab;
}

- (UILabel *)fc_WinLab {
    if (!_fc_WinLab) {
        _fc_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_WinLab;
}

- (UILabel *)fc_EqualLab {
    if (!_fc_EqualLab) {
        _fc_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_EqualLab;
}

- (UILabel *)fc_LoseLab {
    if (!_fc_LoseLab) {
        _fc_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_LoseLab;
}
@end
