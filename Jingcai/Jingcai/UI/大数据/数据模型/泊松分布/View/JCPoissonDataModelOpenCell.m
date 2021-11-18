//
//  JCPoissonDataModelOpenCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelOpenCell.h"

@implementation JCPoissonDataModelOpenCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(8));
        make.bottom.offset(0);
//        make.bottom.offset(AUTO(-20));
//        make.height.mas_equalTo(100);
    }];
    
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchNameLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
//        make.bottom.offset(AUTO(-20));
        
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchTimeLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
       
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.matchNameLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(18));
        make.height.mas_equalTo(AUTO(25));
        make.width.mas_equalTo(AUTO(60));
        
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab);
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayTeamImgView.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
    }];
    
    [self.contentView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(20));
        make.size.mas_equalTo(CGSizeMake(AUTO(48), AUTO(24)));
    }];
    
    [self.contentView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeLab);
        make.top.equalTo(self.homeLab.mas_bottom).offset(AUTO(16));
        make.size.mas_equalTo(CGSizeMake(AUTO(48), AUTO(24)));
        make.bottom.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeLab);
        make.left.equalTo(self.homeLab.mas_right).offset(AUTO(12));
        make.height.mas_equalTo(AUTO(24));
        make.right.offset(AUTO(-24));
    }];
    
    [self.contentView addSubview:self.awaiView];
    [self.awaiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayLab);
        make.left.equalTo(self.awayLab.mas_right).offset(AUTO(12));
        make.height.mas_equalTo(AUTO(24));
        make.right.offset(AUTO(-24));
    }];
    
    [self.homeView addSubview:self.homeWinLab];
    [self.homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.homeView);
        make.width.mas_equalTo(AUTO(85));
    }];
    
    [self.homeView addSubview:self.homeLoseLab];
    [self.homeLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.homeView);
        make.width.mas_equalTo(AUTO(85));
    }];

    [self.homeView addSubview:self.homeEqualLab];
    [self.homeEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeLoseLab.mas_left);
        make.centerY.equalTo(self.homeView);
        make.left.equalTo(self.homeWinLab.mas_right);
    }];
    
    
    [self.awaiView addSubview:self.awayWinLab];
    [self.awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.awaiView);
        make.width.mas_equalTo(AUTO(85));
    }];
    
    [self.awaiView addSubview:self.awayLoseLab];
    [self.awayLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.awaiView);
        make.width.mas_equalTo(AUTO(85));
    }];

    [self.awaiView addSubview:self.awayEqualLab];
    [self.awayEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLoseLab.mas_left);
        make.centerY.equalTo(self.awaiView);
        make.left.equalTo(self.awayWinLab.mas_right);
    }];
    
}

- (void)setModel:(JCKellyDataModelModel *)model {
    _model = model;
        self.homeLab.text = @"比分";
        self.awayLab.text = @"进球数";
    
    self.matchNameLab.text = model.short_name_zh;
    self.matchNameLab.textColor = model.competition_color.length>0?[UIColor colorWithHexString:NonNil(model.competition_color)]:UIColorFromRGB(0x606062);
    self.matchTimeLab.text = model.match_time_str;
    self.matchStatusLab.text = model.status_cn;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text =  model.away_team_name;

    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    

    //半场比分,角球
    if (model.status_id>1&&model.status_id<9) {
        self.scoreLab.text = [NSString stringWithFormat:@"%ld : %ld",model.home_score,model.away_score];
    }else{
        self.scoreLab.text = @"VS";
    }
    
    //进行中的比赛显示分钟数
     if (model.status_id>1&&model.status_id<8) {
        self.matchStatusLab.textColor = COLOR_30B27A;
        self.scoreLab.textColor = COLOR_30B27A;

        if (model.status_id==2||model.status_id==4) {
//            self.ongoingTimeLab.text = model.status_cn;
            if (model.second_half_time>0) {
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-model.second_half_time;

                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-model.first_half_time;
                if (distance<0) {
                    distance = 0;
                }
                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
                
            }
        }else{
            self.matchStatusLab.text = model.status_cn;
        }
    }else if(model.status_id==8){
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = JCBaseColor;
        self.scoreLab.textColor = JCBaseColor;
    }else{
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
    }
    //比分
    for (int i=0; i<self.model.bi_fen.count; i++) {
        NSArray *array = self.model.bi_fen[i];
        NSString *score = @"";
        NSString *rate = @"";
        NSString * color = @"0";
        if (i==0) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = [NSString stringWithFormat:@"%@",array[j]];
                }
            }
            self.homeWinLab.text = [NSString stringWithFormat:@"%@ (%@)",score,rate];
            self.homeWinLab.textColor =[color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;

        }
        if (i==1) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = array[j];
                }
            }
            self.homeEqualLab.text = [NSString stringWithFormat:@"%@ (%@)",score,rate];
            
            self.homeEqualLab.textColor = [color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;

        }
        if (i==2) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = array[j];
                }
            }
            self.homeLoseLab.text = [NSString stringWithFormat:@"%@ (%@)",score,rate];
            self.homeLoseLab.textColor =[color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;

        }
    }
    
    //进球数
    for (int i=0; i<self.model.jin_qiu_shu.count; i++) {
        NSArray *array = self.model.jin_qiu_shu[i];
        NSString *score = @"";
        NSString *rate = @"";
        NSString * color = @"0";
        if (i==0) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = array[j];
                }
            }
            self.awayWinLab.text = [NSString stringWithFormat:@"%@球 (%@)",score,rate];
            self.awayWinLab.textColor =[color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;
        }
        if (i==1) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = array[j];
                }
            }
            self.awayEqualLab.text = [NSString stringWithFormat:@"%@球 (%@)",score,rate];
            self.awayEqualLab.textColor =[color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;

        }
        if (i==2) {
            for (int j=0; j<array.count; j++) {
                if (j==0) {
                    score = array[j];
                }
                if (j==1) {
                    rate = array[j];
                }
                if (j==2) {
                    color = array[j];
                }
            }
            self.awayLoseLab.text = [NSString stringWithFormat:@"%@球 (%@)",score,rate];
            self.awayLoseLab.textColor = [color integerValue]==1?COLOR_EF2F2F:COLOR_2F2F2F;

        }
    }
}



//- (void)data {
//    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
//    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
//
//    self.matchNameLab.text = @"赛事名称";
//    self.matchTimeLab.text = @"09-02 18:00";
//    self.matchStatusLab.text = @"未";
//    self.scoreLab.text = @"99 : 99";
//    self.homeTeamLab.text = @"皇家马德里";
//    self.awayTeamLab.text = @"皇家马德里";
//
//    self.homeLab.text = @"比分";
//    self.awayLab.text = @"进球数";
//
//    self.homeWinLab.text = @"1:0 (19.9%)";
//    self.homeEqualLab.text = @"1:0 (19.9%)";
//    self.homeLoseLab.text = @"1:0 (19.9%)";
//    self.awayWinLab.text = @"1:0 (19.9%)";
//    self.awayEqualLab.text = @"1:0 (19.9%)";
//    self.awayLoseLab.text = @"1:0 (19.9%)";
//
//}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:8];
    }
    return _bgView;
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)matchTimeLab {
    if (!_matchTimeLab) {
        _matchTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchTimeLab;
}

- (UILabel *)matchStatusLab {
    if (!_matchStatusLab) {
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchStatusLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];

    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayTeamLab;
}

- (UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        [_homeTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeTeamImgView;
}

- (UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        [_awayTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayTeamImgView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:UIColorFromRGB(0xFEEAEA) andTextAlignment:NSTextAlignmentCenter];
        _homeLab.layer.cornerRadius = 4;
        _homeLab.layer.borderColor = COLOR_EF2F2F.CGColor;
        _homeLab.layer.borderWidth = 1;
        _homeLab.layer.masksToBounds = YES;
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:UIColorFromRGB(0xEAF7F1) andTextAlignment:NSTextAlignmentCenter];
        _awayLab.layer.cornerRadius = 4;
        _awayLab.layer.borderColor = COLOR_30B27A.CGColor;
        _awayLab.layer.borderWidth = 1;
        _awayLab.layer.masksToBounds = YES;
    }
    return _awayLab;
}

- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [_homeView hg_setAllCornerWithCornerRadius:4];
    }
    return _homeView;
}

- (UIView *)awaiView {
    if (!_awaiView) {
        _awaiView = [UIView new];
        _awaiView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [_awaiView hg_setAllCornerWithCornerRadius:4];
    }
    return _awaiView;
}

- (UILabel *)homeWinLab {
    if (!_homeWinLab) {
        _homeWinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeWinLab;
}

- (UILabel *)homeEqualLab {
    if (!_homeEqualLab) {
        _homeEqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeEqualLab;
}

- (UILabel *)homeLoseLab {
    if (!_homeLoseLab) {
        _homeLoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeLoseLab;
}

- (UILabel *)awayWinLab {
    if (!_awayWinLab) {
        _awayWinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayWinLab;
}

- (UILabel *)awayEqualLab {
    if (!_awayEqualLab) {
        _awayEqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayEqualLab;
}

- (UILabel *)awayLoseLab {
    if (!_awayLoseLab) {
        _awayLoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayLoseLab;
}


@end
