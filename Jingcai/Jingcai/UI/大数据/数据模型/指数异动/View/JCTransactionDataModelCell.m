//
//  JCTransactionDataModelCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelCell.h"

@implementation JCTransactionDataModelCell

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
        make.width.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.matchNameLab);
        
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.matchNameLab);
        make.right.equalTo(self.matchStatusLab.mas_left).offset(AUTO(-8));
    }];
    
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.matchNameLab);
        make.right.offset(AUTO(-24));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.matchNameLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(8));
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.homeTeamImgView);
        make.width.mas_equalTo(AUTO(105));
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(12));
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayTeamImgView);
        make.centerY.equalTo(self.awayTeamImgView);
        make.width.mas_equalTo(AUTO(105));
        
    }];
    
    [self.contentView addSubview:self.homeScoreLab];
    [self.homeScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeTeamImgView);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.awayScoreLab];
    [self.awayScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayTeamImgView);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.awayRateLab];
    [self.awayRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(20));
        make.right.offset(AUTO(-37));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self.contentView addSubview:self.zhishuImgView];
    [self.zhishuImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayRateLab.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.awayRateLab);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.homeRateLab];
    [self.homeRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayRateLab);
        make.right.equalTo(self.zhishuImgView.mas_left).offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    UIView *rateChangeView = [UIView new];
    rateChangeView.backgroundColor = COLOR_F0F0F0;
    [rateChangeView hg_setAllCornerWithCornerRadius:2];
    [self.contentView addSubview:rateChangeView];
    [rateChangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView);
        make.top.equalTo(self.awayTeamImgView.mas_bottom).offset(AUTO(16));
        make.size.mas_equalTo(CGSizeMake(AUTO(150), AUTO(26)));
        
    }];
    
    UILabel *jiLab = [UILabel initWithTitle:@"即" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [rateChangeView addSubview:jiLab];
    [jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(5));
        make.centerY.equalTo(rateChangeView);
    }];
    
    
    [rateChangeView addSubview:self.windRateLab];
    [self.windRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(jiLab.mas_right);
        make.centerY.equalTo(rateChangeView);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.upImgView];
    [self.upImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windRateLab.mas_right);
        make.centerY.equalTo(rateChangeView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [rateChangeView addSubview:self.equalRateLab];
    [self.equalRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upImgView.mas_right);
        make.centerY.equalTo(rateChangeView);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalRateLab.mas_right);
        make.centerY.equalTo(rateChangeView);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.downImgView];
    [self.downImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loseRateLab.mas_right);
        make.centerY.equalTo(rateChangeView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.contentView addSubview:self.rateChangeLab];
    [self.rateChangeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-25));
        make.centerY.equalTo(rateChangeView);
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(rateChangeView.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(1);
    }];
    
    UILabel *changeLab = [UILabel initWithTitle:@"相似变动" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F0F0F0 andTextAlignment:NSTextAlignmentCenter];
    [changeLab hg_setAllCornerWithCornerRadius:2];
    [self.contentView addSubview:changeLab];
    [changeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView);
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(65), AUTO(22)));
        make.bottom.offset(-AUTO(20));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(changeLab.mas_right).offset(AUTO(15));
        make.centerY.equalTo(changeLab);
    }];
}

- (void)setModel:(JCTransactionDataModel *)model {
    _model = model;
    self.matchNameLab.text = model.competition_name;
    self.matchNameLab.textColor = model.competition_color.length>0?[UIColor colorWithHexString:NonNil(model.competition_color)]:UIColorFromRGB(0x606062);
    self.matchTimeLab.text = model.match_time_str;
    self.matchStatusLab.text = model.status_cn;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text =  model.away_team_name;
    self.typeLab.text = model.type_name;
    
    self.homeScoreLab.text = model.home_score;
    self.awayScoreLab.text = model.away_score;

    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.rateChangeLab.text = model.odds_change_name;
}

- (void)data {
//    self.bgView.backgroundColor = JCBaseColor;
//    self.matchNameLab.backgroundColor = JCBaseColor;
    self.matchNameLab.text = @"赛事名称";
    self.matchTimeLab.text = @"09-02 18:00";
    self.matchStatusLab.text = @"未";
//    self.scoreLab.text = @"99 : 99";
    self.homeTeamLab.text = @"皇家马德里";
    self.awayTeamLab.text = @"皇家马德里";
    self.homeTeamImgView.backgroundColor = JCBaseColor;
    self.awayTeamImgView.backgroundColor = JCBaseColor;
    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
    
    self.homeScoreLab.text = @"1";
    self.awayScoreLab.text = @"0";
    self.homeRateLab.text = @"5";
    self.awayRateLab.text = @"6";
    self.zhishuImgView.image = JCIMAGE(@"ic_dataModel_zhishu_up");
    
    self.upImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
    self.downImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
    self.windRateLab.text = @"3.99";
    self.equalRateLab.text = @"3.99";
    self.loseRateLab.text = @"3.99";
    
    self.rateChangeLab.text = @"让球主胜指数升";
    self.infoLab.text = @"主胜:55% 平局:55%  客胜:55% ";
    
    self.typeLab.text = @"胜平负";
    
//    if (matchModel.classfly==1) {
//         self.typeLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
//         self.typeLab.layer.borderColor = COLOR_1B1B1B.CGColor;
//         self.typeLab.textColor = COLOR_1B1B1B;
//     }else if(matchModel.classfly==2){
//
//         self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
//         self.typeLab.layer.borderColor = COLOR_002868.CGColor;
//         self.typeLab.textColor = COLOR_002868;
//     }else if(matchModel.classfly==3){
//         self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
//         self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
//         self.typeLab.textColor = COLOR_30B27A;
//     }
//     else if(matchModel.classfly==4){
//         self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
//         self.typeLab.layer.borderColor = JCBaseColor.CGColor;
//         self.typeLab.textColor = JCBaseColor;
//     }
//     else{
//         self.typeLab.text = [NSString stringWithFormat:@"  %@  ",matchModel.name];
//         self.typeLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
//         self.typeLab.layer.borderColor = COLOR_1B1B1B.CGColor;
//         self.typeLab.textColor = COLOR_1B1B1B;
//     }
 

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
        [_homeTeamImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _homeTeamImgView;
}

- (UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        [_awayTeamImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _awayTeamImgView;
}

- (UILabel *)homeScoreLab {
    if (!_homeScoreLab) {
        _homeScoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeScoreLab;
}

- (UILabel *)awayScoreLab {
    if (!_awayScoreLab) {
        _awayScoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayScoreLab;
}

- (UILabel *)homeRateLab {
    if (!_homeRateLab) {
        _homeRateLab =[UILabel initWithTitle:@"" andFont:AUTO(24) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeRateLab;
}

- (UILabel *)awayRateLab {
    if (!_awayRateLab) {
        _awayRateLab =[UILabel initWithTitle:@"" andFont:AUTO(24) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayRateLab;
}

- (UIImageView *)zhishuImgView {
    if (!_zhishuImgView) {
        _zhishuImgView = [UIImageView new];
    }
    return _zhishuImgView;
}

- (UILabel *)windRateLab {
    if (!_windRateLab) {
        _windRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windRateLab;
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

- (UIImageView *)upImgView {
    if (!_upImgView) {
        _upImgView = [UIImageView new];
    }
    return _upImgView;
}

- (UIImageView *)downImgView {
    if (!_downImgView) {
        _downImgView = [UIImageView new];
    }
    return _downImgView;
}

- (UILabel *)rateChangeLab {
    if (!_rateChangeLab) {
        _rateChangeLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateChangeLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (KKPaddingLabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:NSTextAlignmentCenter];
        _typeLab.layer.borderColor = JCBaseColor.CGColor;
        _typeLab.layer.borderWidth = 1;
        _typeLab.layer.cornerRadius = AUTO(10);
        _typeLab.layer.masksToBounds = YES;
        _typeLab.padding = UIEdgeInsetsMake(4, 8, 4, 8);
    }
    return _typeLab;
}
@end
