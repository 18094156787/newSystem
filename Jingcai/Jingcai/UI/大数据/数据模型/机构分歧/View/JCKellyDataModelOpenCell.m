//
//  JCKellyDataModelOpenCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelOpenCell.h"

@implementation JCKellyDataModelOpenCell

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
    
    [self.contentView addSubview:self.zhishuView];
    [self.zhishuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(55));
    }];
    
    [self.contentView addSubview:self.fenqiView];
    [self.fenqiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.zhishuView.mas_bottom);
        make.height.mas_equalTo(AUTO(55));
    }];
    
    [self.contentView addSubview:self.fangchaView];
    [self.fangchaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.fenqiView.mas_bottom);
        make.height.mas_equalTo(AUTO(55));
    }];
    
    [self.contentView addSubview:self.homeRateLab];
    [self.homeRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.fangchaView.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.awayRateLab];
    [self.awayRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.left.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.fangchaView.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(20));
    }];


    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.left.offset(AUTO(24));
        make.top.equalTo(self.homeRateLab.mas_bottom).offset(AUTO(20));
        make.bottom.offset(AUTO(-15));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-12));
    }];
    

    
}

- (void)setModel:(JCKellyDataModelModel *)model {
    _model = model;
    self.matchNameLab.text = model.short_name_zh;
    self.matchNameLab.textColor = model.competition_color.length>0?[UIColor colorWithHexString:NonNil(model.competition_color)]:UIColorFromRGB(0x606062);
    self.matchTimeLab.text = model.match_time_str;
    self.matchStatusLab.text = model.status_cn;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text =  model.away_team_name;

    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    

    NSString *title = [NSString stringWithFormat:@"查询到%ld条机构数据；已完成机构分歧数据运算",model.company_num];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%ld",model.company_num]];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
    }
    self.historyLab.attributedText = attr;

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
    self.zhishuView.chuLab.text = @"初指";
    self.zhishuView.jiLab.text = @"即指";
    [model.odds_index.begin_odds.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.homeWinValue = obj;
            self.zhishuView.winLab.text = obj;
        }
        if (idx==1) {
            self.homeEqualValue = obj;
            self.zhishuView.equalLab.text = obj;
        }
        if (idx==2) {
            self.homeLoseValue = obj;
            self.zhishuView.loseLab.text = obj;
        }
    }];
    
    [model.odds_index.last_odds.odds enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.awayWinValue = obj;
            self.zhishuView.ji_winLab.text = obj;
        }
        if (idx==1) {
            self.awayEqualValue = obj;
            self.zhishuView.ji_equalLab.text = obj;
        }
        if (idx==2) {
            self.awayLoseValue = obj;
            self.zhishuView.ji_loseLab.text = obj;
        }
    }];
    
    if ([self.awayWinValue floatValue]>[self.homeWinValue floatValue]) {
        self.zhishuView.ji_winLab.textColor = COLOR_EF2F2F;
    }else if([self.awayWinValue floatValue]==[self.homeWinValue floatValue]){
        self.zhishuView.ji_winLab.textColor = COLOR_2F2F2F;
    }else{
        self.zhishuView.ji_winLab.textColor = COLOR_30B27A;
    }
    
    if ([self.awayEqualValue floatValue]>[self.homeEqualValue floatValue]) {
        self.zhishuView.ji_equalLab.textColor = COLOR_EF2F2F;
    }else if([self.awayEqualValue floatValue]==[self.homeEqualValue floatValue]){
        self.zhishuView.ji_equalLab.textColor = COLOR_2F2F2F;
    }else{
        self.zhishuView.ji_equalLab.textColor = COLOR_30B27A;
    }
    
    if ([self.awayLoseValue floatValue]>[self.homeLoseValue floatValue]) {
        self.zhishuView.ji_loseLab.textColor = COLOR_EF2F2F;
    }else if([self.awayLoseValue floatValue]==[self.homeLoseValue floatValue]){
        self.zhishuView.ji_loseLab.textColor = COLOR_2F2F2F;
    }else{
        self.zhishuView.ji_loseLab.textColor = COLOR_30B27A;
    }
    
    self.fenqiView.chuLab.text = @"机构分歧";
    self.fenqiView.jiLab.text = @"机构分歧";
    
    [model.odds_index.begin_odds.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.fenqiView.winLab.text = obj;
        }
        if (idx==1) {
            self.fenqiView.equalLab.text = obj;
        }
        if (idx==2) {
            self.fenqiView.loseLab.text = obj;
        }
    }];
    
    [model.odds_index.last_odds.kelly_index enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.fenqiView.ji_winLab.text = obj;
        }
        if (idx==1) {
            self.fenqiView.ji_equalLab.text = obj;
        }
        if (idx==2) {
            self.fenqiView.ji_loseLab.text = obj;
        }
    }];
    
    self.fangchaView.chuLab.text = @"方差";
    self.fangchaView.jiLab.text = @"方差";
    
    [model.odds_index.begin_odds.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.fangchaView.winLab.text = obj;
        }
        if (idx==1) {
            self.fangchaView.equalLab.text = obj;
        }
        if (idx==2) {
            self.fangchaView.loseLab.text = obj;
        }
    }];
    
    [model.odds_index.last_odds.kelly_variance enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            self.fangchaView.ji_winLab.text = obj;
        }
        if (idx==1) {
            self.fangchaView.ji_equalLab.text = obj;
        }
        if (idx==2) {
            self.fangchaView.ji_loseLab.text = obj;
        }
    }];
    
    
    self.homeRateLab.text = [NSString stringWithFormat:@"返还率 %@",NonNil(model.odds_index.begin_odds.loss_ratio)];
    self.awayRateLab.text = [NSString stringWithFormat:@"返还率 %@",NonNil(model.odds_index.last_odds.loss_ratio)];
}


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

- (UILabel *)homeRateLab {
    if (!_homeRateLab) {
        _homeRateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeRateLab;
}

- (UILabel *)awayRateLab {
    if (!_awayRateLab) {
        _awayRateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayRateLab;
}

- (UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        _homeTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
//        [_homeTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeTeamImgView;
}

- (UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        _awayTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
//        [_awayTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayTeamImgView;
}

- (JCKellyDataModelOpenView *)zhishuView {
    if (!_zhishuView) {
        _zhishuView = [JCKellyDataModelOpenView new];
    }
    return _zhishuView;
}

- (JCKellyDataModelOpenView *)fenqiView {
    if (!_fenqiView) {
        _fenqiView = [JCKellyDataModelOpenView new];
    }
    return _fenqiView;
}

- (JCKellyDataModelOpenView *)fangchaView {
    if (!_fangchaView) {
        _fangchaView = [JCKellyDataModelOpenView new];
    }
    return _fangchaView;
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

@end
