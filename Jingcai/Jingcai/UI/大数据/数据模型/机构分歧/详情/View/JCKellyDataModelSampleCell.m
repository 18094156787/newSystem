//
//  JCKellyDataModelSampleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelSampleCell.h"

@implementation JCKellyDataModelSampleCell

- (void)initViews {
    
    UIView *bottmLineView = [UIView new];
    bottmLineView.backgroundColor = COLOR_E8E8E8;
    [self addSubview:bottmLineView];
    [bottmLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.top.offset(0);
    }];
    
    [self addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(55));
    }];
    
    UIView *topView = [UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(self.companyLab.mas_right);
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(54));
    }];
    
    [topView addSubview:self.home_winLab];
    [self.home_winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [topView addSubview:self.home_equalLab];
    [self.home_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.home_winLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [topView addSubview:self.home_loseLab];
    [self.home_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.home_equalLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [topView addSubview:self.home_zs_WinLab];
    [self.home_zs_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_loseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [topView addSubview:self.home_zs_EqualLab];
    [self.home_zs_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_zs_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [topView addSubview:self.home_zs_LoseLab];
    [self.home_zs_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_zs_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [topView addSubview:self.home_fc_WinLab];
    [self.home_fc_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_zs_WinLab);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    
    [topView addSubview:self.home_fc_EqualLab];
    [self.home_fc_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_fc_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [topView addSubview:self.home_fc_LoseLab];
    [self.home_fc_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(topView.mas_centerY);
        make.left.equalTo(self.home_fc_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [topView addSubview:self.home_rateLab];
    [self.home_rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.home_fc_LoseLab.mas_right);
        make.right.offset(AUTO(-15));
    }];
    
    UIView *bottomView = [UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.equalTo(self.companyLab.mas_right);
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(54));
    }];
    
    [bottomView addSubview:self.away_winLab];
    [self.away_winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [bottomView addSubview:self.away_equalLab];
    [self.away_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.away_winLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [bottomView addSubview:self.away_loseLab];
    [self.away_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.away_equalLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [bottomView addSubview:self.away_zs_WinLab];
    [self.away_zs_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_loseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [bottomView addSubview:self.away_zs_EqualLab];
    [self.away_zs_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_zs_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [bottomView addSubview:self.away_zs_LoseLab];
    [self.away_zs_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_zs_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [bottomView addSubview:self.away_fc_WinLab];
    [self.away_fc_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_zs_WinLab);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    
    [bottomView addSubview:self.away_fc_EqualLab];
    [self.away_fc_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_fc_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [bottomView addSubview:self.away_fc_LoseLab];
    [self.away_fc_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(bottomView.mas_centerY);
        make.left.equalTo(self.away_fc_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [bottomView addSubview:self.away_rateLab];
    [self.away_rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.away_fc_LoseLab.mas_right);
        make.right.offset(AUTO(-15));
    }];

}

- (void)setModel:(JCKellyDataDetailSampleModel *)model {
    _model = model;
    self.companyLab.text = model.odds_company_name;
    self.home_rateLab.text = model.begin_odds.loss_ratio;
    self.away_rateLab.text = model.last_odds.loss_ratio;
    [model.begin_odds.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.home_winLab.text = obj;
        }
        if (idx==1) {
            self.home_equalLab.text = obj;
        }
        if (idx==2) {
            self.home_loseLab.text = obj;
        }
        
    }];
    
    [model.begin_odds.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.home_zs_WinLab.text = obj;
        }
        if (idx==1) {
            self.home_zs_EqualLab.text = obj;
        }
        if (idx==2) {
            self.home_zs_LoseLab.text = obj;
        }
        
    }];
    
    [model.begin_odds.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.home_fc_WinLab.text = obj;
        }
        if (idx==1) {
            self.home_fc_EqualLab.text = obj;
        }
        if (idx==2) {
            self.home_fc_LoseLab.text = obj;
        }
        
    }];
    //
    [model.last_odds.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.away_winLab.text = obj;
        }
        if (idx==1) {
            self.away_equalLab.text = obj;
        }
        if (idx==2) {
            self.away_loseLab.text = obj;
        }

    }];
    
    [model.last_odds.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.away_zs_WinLab.text = obj;
        }
        if (idx==1) {
            self.away_zs_EqualLab.text = obj;
        }
        if (idx==2) {
            self.away_zs_LoseLab.text = obj;
        }

    }];

    [model.last_odds.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.away_fc_WinLab.text = obj;
        }
        if (idx==1) {
            self.away_fc_EqualLab.text = obj;
        }
        if (idx==2) {
            self.away_fc_LoseLab.text = obj;
        }

    }];
    
    self.away_winLab.textColor = COLOR_2F2F2F;
    self.away_equalLab.textColor = COLOR_2F2F2F;
    self.away_loseLab.textColor = COLOR_2F2F2F;

    
    if (model.begin_odds.odds.count==3&&model.last_odds.odds.count==3) {
        NSString *homeWin = model.begin_odds.odds[0];
        NSString *homeEqual = model.begin_odds.odds[1];
        NSString *homeLose = model.begin_odds.odds[2];
        
        NSString *awayWin = model.last_odds.odds[0];
        NSString *awayEqual = model.last_odds.odds[1];
        NSString *awayLose = model.last_odds.odds[2];
        
        if ([awayWin floatValue]>[homeWin floatValue]) {
            self.away_winLab.textColor = COLOR_EF2F2F;
        }else if ([awayWin floatValue]==[homeWin floatValue]) {
            self.away_winLab.textColor = COLOR_2F2F2F;
        }else{
            self.away_winLab.textColor = COLOR_30B27A;
        }
        
        if ([awayEqual floatValue]>[homeEqual floatValue]) {
            self.away_equalLab.textColor = COLOR_EF2F2F;
        }else if ([awayEqual floatValue]==[homeEqual floatValue]) {
            self.away_equalLab.textColor = COLOR_2F2F2F;
        }else{
            self.away_equalLab.textColor = COLOR_30B27A;
        }

        if ([awayLose floatValue]>[homeLose floatValue]) {
            self.away_loseLab.textColor = COLOR_EF2F2F;
        }else if ([awayLose floatValue]==[homeLose floatValue]) {
            self.away_loseLab.textColor = COLOR_2F2F2F;
        }else{
            self.away_loseLab.textColor = COLOR_30B27A;
        }
        
    }
}


- (UILabel *)home_winLab {
    if (!_home_winLab) {
        _home_winLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_winLab;
}

- (UILabel *)home_equalLab {
    if (!_home_equalLab) {
        _home_equalLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_equalLab;
}

- (UILabel *)home_loseLab {
    if (!_home_loseLab) {
        _home_loseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_loseLab;
}




- (UILabel *)home_zs_WinLab {
    if (!_home_zs_WinLab) {
        _home_zs_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_zs_WinLab;
}
- (UILabel *)home_zs_EqualLab {
    if (!_home_zs_EqualLab) {
        _home_zs_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_zs_EqualLab;
}

- (UILabel *)home_zs_LoseLab {
    if (!_home_zs_LoseLab) {
        _home_zs_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_zs_LoseLab;
}


- (UILabel *)home_fc_WinLab {
    if (!_home_fc_WinLab) {
        _home_fc_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_fc_WinLab;
}

- (UILabel *)home_fc_EqualLab {
    if (!_home_fc_EqualLab) {
        _home_fc_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_fc_EqualLab;
}

- (UILabel *)home_fc_LoseLab {
    if (!_home_fc_LoseLab) {
        _home_fc_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_fc_LoseLab;
}


- (UILabel *)home_rateLab {
    if (!_home_rateLab) {
        _home_rateLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _home_rateLab;
}

//

- (UILabel *)away_winLab {
    if (!_away_winLab) {
        _away_winLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_winLab;
}

- (UILabel *)away_equalLab {
    if (!_away_equalLab) {
        _away_equalLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_equalLab;
}

- (UILabel *)away_loseLab {
    if (!_away_loseLab) {
        _away_loseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_loseLab;
}


- (UILabel *)away_zs_WinLab {
    if (!_away_zs_WinLab) {
        _away_zs_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_zs_WinLab;
}
- (UILabel *)away_zs_EqualLab {
    if (!_away_zs_EqualLab) {
        _away_zs_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_zs_EqualLab;
}

- (UILabel *)away_zs_LoseLab {
    if (!_away_zs_LoseLab) {
        _away_zs_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_zs_LoseLab;
}


- (UILabel *)away_fc_WinLab {
    if (!_away_fc_WinLab) {
        _away_fc_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_fc_WinLab;
}

- (UILabel *)away_fc_EqualLab {
    if (!_away_fc_EqualLab) {
        _away_fc_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_fc_EqualLab;
}

- (UILabel *)away_fc_LoseLab {
    if (!_away_fc_LoseLab) {
        _away_fc_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_fc_LoseLab;
}


- (UILabel *)away_rateLab {
    if (!_away_rateLab) {
        _away_rateLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _away_rateLab;
}

- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_606062 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}

@end
