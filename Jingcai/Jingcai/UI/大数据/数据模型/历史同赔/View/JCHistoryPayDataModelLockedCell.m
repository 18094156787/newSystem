//
//  JCHistoryPayDataModelLockedCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelLockedCell.h"

@implementation JCHistoryPayDataModelLockedCell

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
    
    [self.contentView addSubview:self.lockBtn];
    [self.lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(AUTO(36));
        
    }];
    
    [self.contentView addSubview:self.homeWindLab];
    [self.homeWindLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lockBtn);
        make.top.equalTo(self.lockBtn.mas_bottom).offset(AUTO(8));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.homeEqualLab];
    [self.homeEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeWindLab.mas_right);
        make.top.equalTo(self.homeWindLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.homeLoseLab];
    [self.homeLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeEqualLab.mas_right);
        make.top.equalTo(self.homeWindLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.awayLoseLab];
    [self.awayLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lockBtn);
        make.top.equalTo(self.homeWindLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.awayEqualLab];
    [self.awayEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLoseLab.mas_left);
        make.top.equalTo(self.homeWindLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.awayWindLab];
    [self.awayWindLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayEqualLab.mas_left);
        make.top.equalTo(self.homeWindLab);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.left.offset(AUTO(24));
        make.top.equalTo(self.homeWindLab.mas_bottom).offset(AUTO(20));
        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
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
    self.chuLab.text = [NSString stringWithFormat:@"相同初指（%@）",model.similar.begin_count.total];
    self.jiLab.text = [NSString stringWithFormat:@"相同即指（%@）",model.similar.last_count.total];
    
    self.homeWindLab.text = model.similar.begin_odds.won;
    self.homeEqualLab.text = model.similar.begin_odds.draw;
    self.homeLoseLab.text = model.similar.begin_odds.loss;
    self.awayWindLab.text = model.similar.last_odds.won;
    self.awayEqualLab.text = model.similar.last_odds.draw;
    self.awayLoseLab.text = model.similar.last_odds.loss;
//    self.historyLab.text = [NSString stringWithFormat:@"查询历史数据，找到相同初指比赛%@场。",model.similar.begin_count.total];
    
    NSString *type = @"";
    if ([model.model_id integerValue] ==1) {
        type = @"鲸猜大数据";
    }
    if ([model.model_id integerValue] ==2) {
        type = @"指数异动";
    }
    if ([model.model_id integerValue] ==3) {
        type = @"同赔分析";
    }
    if ([model.model_id integerValue] ==4) {
        type = @"泊松分布";
    }
    if ([model.model_id integerValue] ==5) {
        type = @"机构分歧";
    }
    if ([model.model_id integerValue] ==6) {
        type = @"指数分歧";
    }

    
    [self.lockBtn setTitle:[NSString stringWithFormat:@"开通[%@]服务，解锁赛果详情",type] forState:0];
    
    NSString *title = [NSString stringWithFormat:@"查询历史数据，找到相同初指比赛%@场。",NonNil(model.similar.begin_count.total)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    if (model.similar.begin_count.total.length>0) {
        NSRange range = [title rangeOfString:model.similar.begin_count.total];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }

    self.historyLab.attributedText = attr;
    
    if ([model.similar.last_odds.won floatValue]>[model.similar.begin_odds.won floatValue]) {
        self.awayWindLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.won floatValue]==[model.similar.begin_odds.won floatValue]) {
        self.awayWindLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayWindLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.draw floatValue]>[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.draw floatValue]==[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayEqualLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.loss floatValue]>[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseLab.textColor = COLOR_EF2F2F;
    }else if ([model.similar.last_odds.loss floatValue]==[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayLoseLab.textColor = COLOR_30B27A;
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

- (UILabel *)homeWindLab {
    if (!_homeWindLab) {
        _homeWindLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeWindLab;
}

- (UILabel *)homeEqualLab {
    if (!_homeEqualLab) {
        _homeEqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeEqualLab;
}

- (UILabel *)homeLoseLab {
    if (!_homeLoseLab) {
        _homeLoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeLoseLab;
}

- (UILabel *)awayWindLab {
    if (!_awayWindLab) {
        _awayWindLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayWindLab;
}

- (UILabel *)awayEqualLab {
    if (!_awayEqualLab) {
        _awayEqualLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayEqualLab;
}

- (UILabel *)awayLoseLab {
    if (!_awayLoseLab) {
        _awayLoseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayLoseLab;
}

- (UIButton *)lockBtn {
    if (!_lockBtn) {
        _lockBtn = [UIButton initWithText:@"开通[同赔分析]服务，解锁赛果预测" FontSize:AUTO(14) Weight:1 BackGroundColor:[JCBaseColor colorWithAlphaComponent:0.1] TextColors:JCBaseColor];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:0];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:UIControlStateHighlighted];
        [_lockBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_lockBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, AUTO(10))];
        _lockBtn.userInteractionEnabled = NO;
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

@end
