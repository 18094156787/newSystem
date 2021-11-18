//
//  JCHistoryPayDataModelDetailTitleHeadCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailTitleHeadCell.h"

@implementation JCHistoryPayDataModelDetailTitleHeadCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(12));
        make.width.mas_equalTo(AUTO(80));
        make.bottom.offset(AUTO(-12));
    }];
    
    [self addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AUTO(40));
    }];
    
    [self addSubview:self.teamView];
    [self.teamView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLab.mas_right);
        make.centerY.equalTo(self);
        make.right.equalTo(self.resultLab.mas_left);
    }];
    
    [self.teamView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.teamView);
        make.centerY.equalTo(self.teamView);
        make.width.mas_equalTo(AUTO(25));
    }];
    
    [self.teamView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teamView);
        make.left.offset(AUTO(10));
        make.right.equalTo(self.scoreLab.mas_left);
    }];
    
    [self.teamView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teamView);
        make.right.offset(AUTO(-10));
        make.left.equalTo(self.scoreLab.mas_right);
    }];

    
}

- (void)setModel:(JCTipMatchInfoModel *)model {
    if (!model) {
        return;
    }
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@\n%@",NonNil(model.match_time),NonNil(model.competition_name)];
    self.scoreLab.text = [NSString stringWithFormat:@"%@:%@",NonNil(model.home_score),NonNil(model.away_score)];
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text = model.away_team_name;
    self.resultLab.text = model.wl;
    if ([model.wl isEqualToString:@"胜"]) {
        self.resultLab.textColor = COLOR_EF2F2F;
    }else if ([model.wl isEqualToString:@"平"]) {
        self.resultLab.textColor = COLOR_30B27A;
    }else if ([model.wl isEqualToString:@"负"]) {
        self.resultLab.textColor = COLOR_002868;
    }
}
// 
//- (void)data {
//    self.timeLab.text = @"2021-08-20\n赛事名称";
//    self.scoreLab.text = @"1:0";
//    self.homeTeamLab.text = @"主队名称主队名称";
//    self.awayTeamLab.text = @"主队名称主队名称";
//    self.resultLab.text = @"胜";
//    
//}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.numberOfLines = 2;
    }
    return _timeLab;
}

- (UIView *)teamView {
    if (!_teamView) {
        _teamView = [UIView new];
    }
    return _teamView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayTeamLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}
@end
