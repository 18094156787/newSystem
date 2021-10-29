//
//  JNMatchSJAgainstBF_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstBF_Cell.h"

@implementation JNMatchSJAgainstBF_Cell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
    }];
    

    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(AUTO(17));
        make.centerX.equalTo(self);
    }];

    
    [self addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
        make.right.equalTo(self.mas_centerX).offset(AUTO(-30)-SCREEN_WIDTH/8);
        make.width.height.mas_equalTo(AUTO(48));
    }];
    
    [self addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeImgView);
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(5));
        make.width.mas_lessThanOrEqualTo(AUTO(110));
    }];
    
    
    [self addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView);
        make.left.equalTo(self.mas_centerX).offset(AUTO(30)+SCREEN_WIDTH/8);
        make.width.height.mas_equalTo(AUTO(48));
    }];
    
    [self addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayImgView);
        make.top.equalTo(self.awayImgView.mas_bottom).offset(AUTO(5));
        make.width.mas_lessThanOrEqualTo(AUTO(110));
    }];
    
    [self addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.homeImgView).offset(5);
        make.centerX.equalTo(self);
    }];
}

- (void)setModel:(JCBigDataMonthProduceModel *)model {
    _model = model;
    self.titleLab.text = @"  比分结果";
    self.timeLab.text = model.match_time;
    self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",model.home_score,model.away_score];
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text = model.away_team_name;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:[COLOR_002868 colorWithAlphaComponent:0.06] andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
//        _homeImgView.layer.cornerRadius = AUTO(20);
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _homeImgView.layer.masksToBounds = YES;
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _awayImgView.layer.cornerRadius = AUTO(20);
//        _awayImgView.layer.masksToBounds = YES;
    }
    return _awayImgView;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayTeamLab;
}

@end
