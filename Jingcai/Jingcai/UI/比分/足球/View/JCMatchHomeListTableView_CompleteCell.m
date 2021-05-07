//
//  JCMatchHomeListTableView_CompleteCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchHomeListTableView_CompleteCell.h"

@implementation JCMatchHomeListTableView_CompleteCell

- (void)initViews {
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab.mas_right).offset(4);
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(12));
    }];
    
    [self.contentView addSubview:self.ongoingTimeLab];
    [self.ongoingTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(12));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];
    

    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(42));
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(18)));
    }];
    
    [self.contentView addSubview:self.collectionBtn];
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.top.offset(AUTO(5));
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.contentView.mas_centerX).offset(-SCREEN_WIDTH/4.0f+AUTO(28));
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
//        make.left.equalTo(self.scoreLab.mas_right);
        make.left.equalTo(self.contentView.mas_centerX).offset(SCREEN_WIDTH/4.0f-AUTO(28));
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    
    [self.contentView addSubview:self.zbImgView];
    [self.zbImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeTeamImgView);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(4);
        make.width.mas_equalTo(AUTO(115));
    }];
    
    
    
    
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayTeamImgView);
        make.top.equalTo(self.awayTeamImgView.mas_bottom).offset(4);
        make.width.mas_equalTo(AUTO(115));
    }];
    
    [self.contentView addSubview:self.matchWeekLab];
    [self.matchWeekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab);
//        make.bottom.offset(AUTO(-14));
        make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self.contentView addSubview:self.halfScoreLab];
    [self.halfScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.matchWeekLab);
    }];
    
    [self.contentView addSubview:self.planCountLab];
    [self.planCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
//        make.bottom.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(20)));
        make.centerY.equalTo(self.matchWeekLab);
    }];
    
    [self.contentView addSubview:self.colorView];
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchWeekLab.mas_bottom).offset(AUTO(14));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(8));
        make.bottom.offset(0);
    }];
    

}

- (void)setModel:(JCMatchInfoModel *)model {
    _model = model;
    self.matchNameLab.text = model.leagueName;
    self.matchTimeLab.text = model.hi;
    self.homeTeamLab.text = model.homeName;
    self.awayTeamLab.text = model.awayName;
    self.halfScoreLab.text = model.halfScore;
    self.matchWeekLab.text = NonNil(model.matchName);
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.homeLogo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.awayLogo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if ([model.matchCount integerValue]>0) {
        self.planCountLab.hidden = NO;
        self.planCountLab.text = [NSString stringWithFormat:@"%@个方案",model.matchCount];
    }else{
        self.planCountLab.text = @"";
        self.planCountLab.hidden = YES;
    }
    

    if ([model.matchStatus intValue]==1) {
        //比赛未开始
        self.scoreLab.text = @"VS";
    }else{
        NSString *score =  [NSString stringWithFormat:@"%@ : %@",model.homeScore,model.awayScore];
        self.scoreLab.text = score;
    }
    if ([model.matchStatus intValue]==1) {
        self.matchStatusLab.text = @"未开赛";
    }
    if ([model.matchStatus intValue]==2) {
        self.matchStatusLab.text = @"进行中";
    }
    if ([model.matchStatus intValue]==3) {
        self.matchStatusLab.text = @"已结束";
    }
    if ([model.matchStatus intValue]==4) {
        self.matchStatusLab.text = @"推迟";
        self.scoreLab.text= @"VS";
    }
    if ([model.matchStatus intValue]==5) {
        self.matchStatusLab.text = @"取消";
        self.scoreLab.text= @"VS";
    }
    if ([model.matchStatus intValue]==2) {
        self.ongoingTimeLab.text = model.match_competition;
        self.ongoingTimeLab.hidden = NO;
        self.matchStatusLab.text = @"";
    }else{
        self.ongoingTimeLab.hidden = YES;
    }

    self.collectionBtn.selected = [model.is_subscribe integerValue]==1?YES:NO;
    self.zbImgView.image = [model.animation integerValue]==1?JCIMAGE(@"ic_dhzb"):JCIMAGE(@"ic_dh_nozb");
    
    if (model.homeName.length>model.awayName.length) {
        [self.matchWeekLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.matchNameLab);
//            make.bottom.offset(AUTO(-14));
            make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(15));
        }];
    }else{
        [self.matchWeekLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.matchNameLab);
//            make.bottom.offset(AUTO(-14));
            make.top.equalTo(self.awayTeamLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(15));
        }];
    }

    
}

- (void)collectionBtnClick {
    if (self.JCConcernBlock) {
        self.JCConcernBlock();
    }
}




- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)matchTimeLab {
    if (!_matchTimeLab) {
        _matchTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchTimeLab;
}

- (UILabel *)matchStatusLab {
    if (!_matchStatusLab) {
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchStatusLab;
}

- (UIButton *)collectionBtn {
    if (!_collectionBtn) {
        _collectionBtn = [UIButton new];
        [_collectionBtn setImage:JCIMAGE(@"match_icon_collection_un") forState:0];
        [_collectionBtn setImage:JCIMAGE(@"match_icon_collection") forState:UIControlStateSelected];
        [_collectionBtn addTarget:self action:@selector(collectionBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectionBtn;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];

    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeTeamLab.numberOfLines = 2;
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayTeamLab.numberOfLines = 2;
    }
    return _awayTeamLab;
}

- (UIImageView *)vsImgView {
    if (!_vsImgView) {
        _vsImgView = [UIImageView new];
        _vsImgView.image = JCIMAGE(@"icon_vs");
        _vsImgView.hidden = YES;
    }
    return _vsImgView;
}

- (UILabel *)halfScoreLab {
    if (!_halfScoreLab) {
        _halfScoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:0 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _halfScoreLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _halfScoreLab;
}

- (UILabel *)matchWeekLab {
    if (!_matchWeekLab) {
        _matchWeekLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchWeekLab;
}

- (UILabel *)ongoingTimeLab {
    if (!_ongoingTimeLab) {
        _ongoingTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
        [_ongoingTimeLab hg_setAllCornerWithCornerRadius:AUTO(3)];
    }
    return _ongoingTimeLab;
}

- (UILabel *)planCountLab {
    if (!_planCountLab) {
        _planCountLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _planCountLab.layer.borderColor = JCBaseColor.CGColor;
        _planCountLab.layer.borderWidth = 1;
        _planCountLab.layer.cornerRadius = AUTO(10);
        _planCountLab.layer.masksToBounds = YES;
    }
    return _planCountLab;
}

- (UIImageView *)zbImgView {
    if (!_zbImgView) {
        _zbImgView = [UIImageView new];
        _zbImgView.image = JCIMAGE(@"ic_dhzb");
    }
    return _zbImgView;
}

-(UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        _homeTeamImgView.image = JCIMAGE(@"home_placeholder");
    }
    return _homeTeamImgView;
}

-(UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        _awayTeamImgView.image = JCIMAGE(@"away_placeholder");
    }
    return _awayTeamImgView;
}

- (UIView *)colorView {
    if (!_colorView) {
        _colorView = [UIView new];
        _colorView.backgroundColor = COLOR_F0F0F0;
    }
    return _colorView;
}

@end
