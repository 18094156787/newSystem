//
//  JCHistoryPayDataModelOpenCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelOpenCell.h"

@implementation JCHistoryPayDataModelOpenCell

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
    
    [self.contentView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.bottom.equalTo(lineView).offset(AUTO(7));
        make.width.height.mas_equalTo(AUTO(36));
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
    
    [self.contentView addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(16));
        make.right.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.equalTo(self.awayTeamImgView.mas_bottom).offset(AUTO(16));
        make.left.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.homeWinView];
    [self.homeWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.homeEqualView];
    [self.homeEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeWinView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.homeLoseView];
    [self.homeLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeEqualView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.awayLoseView];
    [self.awayLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.awayEqualView];
    [self.awayEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLoseView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.awayWinView];
    [self.awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayEqualView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(56));
    }];
    
//    [self.contentView addSubview:self.lockBtn];
//    [self.lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(24));
//        make.right.offset(AUTO(-24));
//        make.top.equalTo(self.homeWinView.mas_bottom).offset(AUTO(12));
//        make.height.mas_equalTo(AUTO(36));
//        
//    }];
    
    [self.contentView addSubview:self.bottomView];

    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.homeWinView.mas_bottom).offset(AUTO(12));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    

    
    [self.contentView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.historyLab.mas_bottom).offset(AUTO(8));

    }];
    
    [self.contentView addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(8));
        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.historyLab).offset(AUTO(-4));
        make.bottom.equalTo(self.tipLab).offset(AUTO(4));
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
    self.resultImgView.hidden = model.wl==0?YES:NO;
    if (model.wl==1) {
        self.resultImgView.image = JCIMAGE(@"ic_dataModel_red");
    }
    if (model.wl==2) {
        self.resultImgView.image = JCIMAGE(@"ic_dataModel_black");
    }
    
    self.chuLab.text = [NSString stringWithFormat:@"相同初指（%@）",NonNil(model.similar.begin_count.total)];
    self.jiLab.text = [NSString stringWithFormat:@"相同即指（%@）",NonNil(model.similar.last_count.total)];
    
    self.homeWinView.topLab.text = model.similar.begin_count.won;
    self.homeWinView.bottomLab.text = model.similar.begin_odds.won;
    self.homeEqualView.topLab.text = model.similar.begin_count.draw;
    self.homeEqualView.bottomLab.text = model.similar.begin_odds.draw;
    self.homeLoseView.topLab.text = model.similar.begin_count.loss;
    self.homeLoseView.bottomLab.text = model.similar.begin_odds.loss;
    
    self.awayWinView.topLab.text =  model.similar.last_count.won;
    self.awayWinView.bottomLab.text = model.similar.last_odds.won;
    self.awayEqualView.topLab.text = model.similar.last_count.draw;
    self.awayEqualView.bottomLab.text = model.similar.last_odds.draw;
    self.awayLoseView.topLab.text = model.similar.last_count.loss;
    self.awayLoseView.bottomLab.text = model.similar.last_odds.loss;
    
    if ([model.similar.last_odds.won floatValue]>[model.similar.begin_odds.won floatValue]) {
        self.awayWinView.bottomLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.won floatValue]==[model.similar.begin_odds.won floatValue]) {
        self.awayWinView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayWinView.bottomLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.draw floatValue]>[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualView.bottomLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.draw floatValue]==[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayEqualView.bottomLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.loss floatValue]>[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseView.bottomLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.loss floatValue]==[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayLoseView.bottomLab.textColor = COLOR_30B27A;
    }
    
    NSString *title = [NSString stringWithFormat:@"查询历史数据，找到相同初指比赛%@场，%@%%比赛结果指向客胜；",NonNil(model.similar.begin_count.total),NonNil(model.similar.begin_big_rate.rate)];
    if ([model.similar.last_count.total integerValue]>0) {
        title = [NSString stringWithFormat:@"%@相同即指比赛%@场，%@%%比赛指向客胜。",title,NonNil(model.similar.last_count.total),NonNil(model.similar.last_big_rate.rate)];
    }
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    if (model.similar.begin_count.total.length>0) {
        NSRange range = [title rangeOfString:model.similar.begin_count.total];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.begin_big_rate.rate.length>0) {
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%@%%",model.similar.begin_big_rate.rate]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.last_count.total.length>0) {
        NSRange range = [title rangeOfString:model.similar.last_count.total];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.last_big_rate.rate.length>0) {
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%@%%",model.similar.last_big_rate.rate]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    self.historyLab.attributedText = attr;
    
        NSString *result = [NSString stringWithFormat:@"本场推荐：%@",NonNil(model.similar.begin_big_rate.spf_desc)];
    if (model.similar.begin_big_rate.spf_desc.length>0) {
            NSRange range = [result rangeOfString:model.similar.begin_big_rate.spf_desc];
        NSMutableAttributedString *result_attr = [[NSMutableAttributedString alloc] initWithString:result];
        [result_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        self.resultLab.attributedText = result_attr;
    }else{
        self.resultLab.text = @"";
    }

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
}

//- (void)data {
////    self.bgView.backgroundColor = JCBaseColor;
////    self.matchNameLab.backgroundColor = JCBaseColor;
//    self.matchNameLab.text = @"赛事名称";
//    self.matchTimeLab.text = @"09-02 18:00";
//    self.matchStatusLab.text = @"未";
//    self.scoreLab.text = @"99 : 99";
//    self.homeTeamLab.text = @"皇家马德里";
//    self.awayTeamLab.text = @"皇家马德里";
//    self.homeTeamImgView.backgroundColor = JCBaseColor;
//    self.awayTeamImgView.backgroundColor = JCBaseColor;
//    self.chuLab.text = @"相同初指（100）";
//    self.jiLab.text = @"相同即指（90）";
//
//    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
//    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
//    self.resultImgView.image = JCIMAGE(@"ic_dataModel_black");
//
//    self.homeWinView.topLab.text = @"22";
//    self.homeWinView.bottomLab.text = @"22";
//    self.homeEqualView.topLab.text = @"23";
//    self.homeEqualView.bottomLab.text = @"23";
//    self.homeLoseView.topLab.text = @"24";
//    self.homeLoseView.bottomLab.text = @"24";
//
//    self.awayWinView.topLab.text = @"32";
//    self.awayWinView.bottomLab.text = @"32";
//    self.awayEqualView.topLab.text = @"33";
//    self.awayEqualView.bottomLab.text = @"33";
//    self.awayLoseView.topLab.text = @"34";
//    self.awayLoseView.bottomLab.text = @"34";
//
//    self.historyLab.text = @"查询历史数据，找到相同初指比赛100场，相同即指比赛90场";
//
//    NSString *result = [NSString stringWithFormat:@"本场推荐：%@",@"客胜"];
//    NSRange range = [result rangeOfString:@"客胜"];
//    NSMutableAttributedString *result_attr = [[NSMutableAttributedString alloc] initWithString:result];
//    [result_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
//    self.resultLab.attributedText = result_attr;
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

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
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

- (JCHistoryPayDataModelRateView *)homeWinView {
    if (!_homeWinView) {
        _homeWinView =  [JCHistoryPayDataModelRateView new];
        _homeWinView.nameLab.text = @"主胜";
        _homeWinView.topLab.textColor = COLOR_EF2F2F;
    }
    return _homeWinView;
}

- (JCHistoryPayDataModelRateView *)homeEqualView {
    if (!_homeEqualView) {
        _homeEqualView =  [JCHistoryPayDataModelRateView new];
        _homeEqualView.nameLab.text = @"平";
        _homeEqualView.topLab.textColor = COLOR_30B27A;
    }
    return _homeEqualView;
}

- (JCHistoryPayDataModelRateView *)homeLoseView {
    if (!_homeLoseView) {
        _homeLoseView =  [JCHistoryPayDataModelRateView new];
        _homeLoseView.nameLab.text = @"客胜";
        _homeLoseView.topLab.textColor = COLOR_002868;
    }
    return _homeLoseView;
}

- (JCHistoryPayDataModelRateView *)awayWinView {
    if (!_awayWinView) {
        _awayWinView =  [JCHistoryPayDataModelRateView new];
        _awayWinView.nameLab.text = @"主胜";
        _awayWinView.topLab.textColor = COLOR_EF2F2F;
    }
    return _awayWinView;
}

- (JCHistoryPayDataModelRateView *)awayEqualView {
    if (!_awayEqualView) {
        _awayEqualView =  [JCHistoryPayDataModelRateView new];
        _awayEqualView.nameLab.text = @"平";
        _awayEqualView.topLab.textColor = COLOR_30B27A;
    }
    return _awayEqualView;
}

- (JCHistoryPayDataModelRateView *)awayLoseView {
    if (!_awayLoseView) {
        _awayLoseView =  [JCHistoryPayDataModelRateView new];
        _awayLoseView.nameLab.text = @"客胜";
        _awayLoseView.topLab.textColor = COLOR_002868;
    }
    return _awayLoseView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [_bottomView hg_setAllCornerWithCornerRadius:4];
    }
    return _bottomView;
}

- (UILabel *)historyLab {
    if (!_historyLab) {
        _historyLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
        _historyLab.numberOfLines = 0;
    }
    return _historyLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab =[UILabel initWithTitle:@"" andFont:AUTO(12  ) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [UILabel initWithTitle:@"数据模型运算结果仅供参考" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _tipLab;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
    }
    return _resultImgView;
}

@end
