//
//  JCDiscreteDataModelDetailInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDiscreteDataModelDetailInfoCell.h"

@implementation JCDiscreteDataModelDetailInfoCell


- (void)initViews {
//    self.backgroundColor = JCClearColor;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.right.offset(AUTO(-16));
        make.top.offset(AUTO(10));
        make.bottom.offset(AUTO(-8));
//        make.bottom.offset(AUTO(-20));
//        make.height.mas_equalTo(100);
    }];
    
    self.bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.shadowColor = [UIColor colorWithRed:78/255.0 green:83/255.0 blue:99/255.0 alpha:0.16].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,8);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 16;
    

    
    [self.bgView addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(AUTO(16));
        make.right.equalTo(self.contentView.mas_centerX).offset(AUTO(16));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.equalTo(self.chuLab);
        make.left.equalTo(self.contentView.mas_centerX).offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.homeWinView];
    [self.homeWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.homeEqualView];
    [self.homeEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeWinView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.homeLoseView];
    [self.homeLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeEqualView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.awayLoseView];
    [self.awayLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.awayEqualView];
    [self.awayEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLoseView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.awayWinView];
    [self.awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayEqualView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    [self.bgView addSubview:self.homeDiscreteLab];
    [self.homeDiscreteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeEqualView);
        make.top.equalTo(self.homeWinView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.awayDiscreteLab];
    [self.awayDiscreteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayEqualView);
        make.top.equalTo(self.awayEqualView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.homeWinLab];
    [self.homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeWinView);
        make.top.equalTo(self.homeDiscreteLab.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.homeEqualLab];
    [self.homeEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeEqualView);
        make.top.equalTo(self.homeWinLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.homeLoseLab];
    [self.homeLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeWinView);
        make.top.equalTo(self.homeWinLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.awayWinLab];
    [self.awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayWinView);
        make.top.equalTo(self.homeWinLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.awayEqualLab];
    [self.awayEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayEqualView);
        make.top.equalTo(self.homeWinLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.awayLoseLab];
    [self.awayLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayWinView);
        make.top.equalTo(self.homeWinLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];

    
    [self.bgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.left.offset(AUTO(24));
        make.top.equalTo(self.homeWinLab.mas_bottom).offset(AUTO(12));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-12));
    }];
    float width = (SCREEN_WIDTH-AUTO(48))/3.0f;
    
    [self.bgView addSubview:self.equalRateLab];
    [self.equalRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(20));
        make.top.equalTo(self.historyLab.mas_bottom).offset(AUTO(20));
    }];
    
    [self.bgView addSubview:self.winRateLab];
    [self.winRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equalRateLab);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(20));
        make.right.equalTo(self.equalRateLab.mas_left);
    }];
    
    [self.bgView addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equalRateLab);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(20));
        make.left.equalTo(self.equalRateLab.mas_right);
        make.bottom.offset(AUTO(-15));
    }];
    

}


- (void)data {
//    self.bgView.backgroundColor = JCBaseColor;
//    self.matchNameLab.backgroundColor = JCBaseColor;
    self.matchNameLab.text = @"赛事名称";
    self.matchTimeLab.text = @"09-02 18:00";
    self.matchStatusLab.text = @"未";
    self.scoreLab.text = @"99 : 99";
    self.homeTeamLab.text = @"皇家马德里";
    self.awayTeamLab.text = @"皇家马德里";
    self.homeTeamImgView.backgroundColor = JCBaseColor;
    self.awayTeamImgView.backgroundColor = JCBaseColor;
    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
    
 
    self.homeWinView.bottomLab.text = @"22";
    self.homeEqualView.bottomLab.text = @"23";
    self.homeLoseView.bottomLab.text = @"24";
    
    self.awayWinView.bottomLab.text = @"32";
    self.awayEqualView.bottomLab.text = @"33";
    self.awayLoseView.bottomLab.text = @"34";

    self.historyLab.text = @"查询历史数据，找到相同初赔比赛100场，相同即赔比赛90场";
    
    self.homeWinLab.text = @"3.74";
    self.homeEqualLab.text = @"3.74";
    self.homeLoseLab.text = @"3.74";
    self.awayWinLab.text = @"3.74";
    self.awayEqualLab.text = @"3.74";
    self.awayLoseLab.text = @"3.74";
    
    self.winRateLab.text = @"主胜：53%";
    self.equalRateLab.text = @"平：27%";
    self.loseRateLab.text = @"客胜：20%";

}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
//        [_bgView hg_setAllCornerWithCornerRadius:8];
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

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"初赔" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"即赔" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
}

- (JCDiscreteDataModelLockedRateView *)homeWinView {
    if (!_homeWinView) {
        _homeWinView =  [JCDiscreteDataModelLockedRateView new];
        _homeWinView.nameLab.text = @"主胜";
    }
    return _homeWinView;
}

- (JCDiscreteDataModelLockedRateView *)homeEqualView {
    if (!_homeEqualView) {
        _homeEqualView =  [JCDiscreteDataModelLockedRateView new];
        _homeEqualView.nameLab.text = @"平";
    }
    return _homeEqualView;
}

- (JCDiscreteDataModelLockedRateView *)homeLoseView {
    if (!_homeLoseView) {
        _homeLoseView =  [JCDiscreteDataModelLockedRateView new];
        _homeLoseView.nameLab.text = @"客胜";
    }
    return _homeLoseView;
}

- (JCDiscreteDataModelLockedRateView *)awayWinView {
    if (!_awayWinView) {
        _awayWinView =  [JCDiscreteDataModelLockedRateView new];
        _awayWinView.nameLab.text = @"主胜";
    }
    return _awayWinView;
}

- (JCDiscreteDataModelLockedRateView *)awayEqualView {
    if (!_awayEqualView) {
        _awayEqualView =  [JCDiscreteDataModelLockedRateView new];
        _awayEqualView.nameLab.text = @"平";
    }
    return _awayEqualView;
}

- (JCDiscreteDataModelLockedRateView *)awayLoseView {
    if (!_awayLoseView) {
        _awayLoseView =  [JCDiscreteDataModelLockedRateView new];
        _awayLoseView.nameLab.text = @"客胜";
    }
    return _awayLoseView;
}

- (UIButton *)lockBtn {
    if (!_lockBtn) {
        _lockBtn = [UIButton initWithText:@"开通[同赔分析]服务，解锁赛果预测" FontSize:AUTO(14) Weight:1 BackGroundColor:[JCBaseColor colorWithAlphaComponent:0.1] TextColors:JCBaseColor];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:0];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:UIControlStateHighlighted];
        [_lockBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_lockBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, AUTO(10))];
    }
    return _lockBtn;
}


- (KKPaddingLabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:UIColorFromRGB(0xF5F5F5) andTextAlignment:0];
        _historyLab.numberOfLines = 0;
        _historyLab.layer.cornerRadius = 4;
        _historyLab.layer.masksToBounds = YES;
        _historyLab.padding = UIEdgeInsetsMake(4, 8, 4, 8);
    }
    return _historyLab;
}

- (UILabel *)homeDiscreteLab {
    if (!_homeDiscreteLab) {
        _homeDiscreteLab =[UILabel initWithTitle:@"离散值" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeDiscreteLab;
}

- (UILabel *)awayDiscreteLab {
    if (!_awayDiscreteLab) {
        _awayDiscreteLab =[UILabel initWithTitle:@"离散值" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayDiscreteLab;
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

- (UILabel *)winRateLab {
    if (!_winRateLab) {
        _winRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _winRateLab;
}

- (UILabel *)equalRateLab {
    if (!_equalRateLab) {
        _equalRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalRateLab;
}

- (UILabel *)loseRateLab {
    if (!_loseRateLab) {
        _loseRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseRateLab;
}

@end
