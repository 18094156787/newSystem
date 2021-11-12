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
    self.chuLab.text = @"相同初赔（100）";
    self.jiLab.text = @"相同即赔（90）";
    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.resultImgView.image = JCIMAGE(@"ic_dataModel_black");
    
    self.homeWinView.topLab.text = @"22";
    self.homeWinView.bottomLab.text = @"22";
    self.homeEqualView.topLab.text = @"23";
    self.homeEqualView.bottomLab.text = @"23";
    self.homeLoseView.topLab.text = @"24";
    self.homeLoseView.bottomLab.text = @"24";
    
    self.awayWinView.topLab.text = @"32";
    self.awayWinView.bottomLab.text = @"32";
    self.awayEqualView.topLab.text = @"33";
    self.awayEqualView.bottomLab.text = @"33";
    self.awayLoseView.topLab.text = @"34";
    self.awayLoseView.bottomLab.text = @"34";
    
    self.historyLab.text = @"查询历史数据，找到相同初赔比赛100场，相同即赔比赛90场";
    
    NSString *result = [NSString stringWithFormat:@"本场推荐：%@",@"客胜"];
    NSRange range = [result rangeOfString:@"客胜"];
    NSMutableAttributedString *result_attr = [[NSMutableAttributedString alloc] initWithString:result];
    [result_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
    self.resultLab.attributedText = result_attr;
    
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
    }
    return _homeWinView;
}

- (JCHistoryPayDataModelRateView *)homeEqualView {
    if (!_homeEqualView) {
        _homeEqualView =  [JCHistoryPayDataModelRateView new];
        _homeEqualView.nameLab.text = @"平";
    }
    return _homeEqualView;
}

- (JCHistoryPayDataModelRateView *)homeLoseView {
    if (!_homeLoseView) {
        _homeLoseView =  [JCHistoryPayDataModelRateView new];
        _homeLoseView.nameLab.text = @"客胜";
    }
    return _homeLoseView;
}

- (JCHistoryPayDataModelRateView *)awayWinView {
    if (!_awayWinView) {
        _awayWinView =  [JCHistoryPayDataModelRateView new];
        _awayWinView.nameLab.text = @"主胜";
    }
    return _awayWinView;
}

- (JCHistoryPayDataModelRateView *)awayEqualView {
    if (!_awayEqualView) {
        _awayEqualView =  [JCHistoryPayDataModelRateView new];
        _awayEqualView.nameLab.text = @"平";
    }
    return _awayEqualView;
}

- (JCHistoryPayDataModelRateView *)awayLoseView {
    if (!_awayLoseView) {
        _awayLoseView =  [JCHistoryPayDataModelRateView new];
        _awayLoseView.nameLab.text = @"客胜";
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
