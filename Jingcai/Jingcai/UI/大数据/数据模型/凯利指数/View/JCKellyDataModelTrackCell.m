//
//  JCKellyDataModelTrackCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelTrackCell.h"

@implementation JCKellyDataModelTrackCell

- (void)initViews {
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.winLab.mas_right);
        make.width.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.equalLab.mas_right);
        make.width.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.zs_WinLab];
    [self.zs_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.loseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [self addSubview:self.zs_EqualLab];
    [self.zs_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [self addSubview:self.zs_LoseLab];
    [self.zs_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [self addSubview:self.fc_WinLab];
    [self.fc_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_WinLab);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    
    [self addSubview:self.fc_EqualLab];
    [self.fc_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.fc_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [self addSubview:self.fc_LoseLab];
    [self.fc_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.fc_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(43));
    }];
    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.fc_LoseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.rateLab.mas_right);
        make.right.offset(AUTO(-15));
    }];
    
}

- (void)setModel:(JCKellyDataDetailSampleModel *)model {
    _model = model;

    self.rateLab.text = model.last_odds.loss_ratio;
    [model.kelly.last_odds.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
    
    [model.kelly.last_odds.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
    
    [model.kelly.last_odds.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
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

    if (self.row==self.dataArray.count-1) {
        self.timeLab.text = @"初赔";
    }else {
        if (model.type==2) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前48小时"];
        }
        if (model.type==3) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前24小时"];
        }
        if (model.type==4) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前12小时"];
        }
        if (model.type==5) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前6小时"];
        }
        if (model.type==6) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前3小时"];
        }
        if (model.type==7) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前1小时"];
        }
        if (model.type==8) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前30分钟"];
        }
        if (model.type==9) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前20分钟"];
        }
        if (model.type==10) {
            self.timeLab.text = [NSString stringWithFormat:@"赛前10分钟"];
        }
        
    }
    
    self.winLab.textColor = COLOR_2F2F2F;
    self.equalLab.textColor = COLOR_2F2F2F;
    self.loseLab.textColor = COLOR_2F2F2F;
    
    if (self.row<self.dataArray.count) {
        JCKellyDataDetailSampleModel *lastModel = self.dataArray[self.row+1];
        
        if (model.kelly.last_odds.odds.count==3&&lastModel.kelly.last_odds.odds.count==3) {
            NSString *homeWin = model.kelly.last_odds.odds[0];
            NSString *homeEqual = model.kelly.last_odds.odds[1];
            NSString *homeLose = model.kelly.last_odds.odds[2];
            
            NSString *awayWin = lastModel.kelly.last_odds.odds[0];
            NSString *awayEqual = lastModel.kelly.last_odds.odds[1];
            NSString *awayLose = lastModel.kelly.last_odds.odds[2];
            
            if ([awayWin floatValue]<[homeWin floatValue]) {
                self.winLab.textColor = COLOR_EF2F2F;
            }else if ([awayWin floatValue]==[homeWin floatValue]) {
                self.winLab.textColor = COLOR_2F2F2F;
            }else{
                self.winLab.textColor = COLOR_30B27A;
            }
            
            if ([awayEqual floatValue]<[homeEqual floatValue]) {
                self.equalLab.textColor = COLOR_EF2F2F;
            }else if ([awayEqual floatValue]==[homeEqual floatValue]) {
                self.equalLab.textColor = COLOR_2F2F2F;
            }else{
                self.equalLab.textColor = COLOR_30B27A;
            }

            if ([awayLose floatValue]<[homeLose floatValue]) {
                self.loseLab.textColor = COLOR_EF2F2F;
            }else if ([awayLose floatValue]==[homeLose floatValue]) {
                self.loseLab.textColor = COLOR_2F2F2F;
            }else{
                self.loseLab.textColor = COLOR_30B27A;
            }
            
        }
    }
    
    


    


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


- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

@end
