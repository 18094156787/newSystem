//
//  JCJingCaiAIBigDataMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataMatchCell.h"

@implementation JCJingCaiAIBigDataMatchCell

- (void)initViews {
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(3));
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(28));
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(18)));
    }];
    

    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
        make.width.height.mas_equalTo(AUTO(20));
        make.bottom.offset(AUTO(-8));
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
        make.width.height.mas_equalTo(AUTO(20));
    }];
    

    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeTeamImgView);
        make.right.equalTo(self.homeTeamImgView.mas_left).offset(-3);
        make.left.offset(AUTO(15));
    }];
    
    
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayTeamImgView);
        make.left.equalTo(self.awayTeamImgView.mas_right).offset(3);
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeTeamImgView.mas_right).offset(-4);
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.height.mas_equalTo(AUTO(15));
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.planCountLab];
    [self.planCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(44), AUTO(16)));
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.matchWeekLab];
    [self.matchWeekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.planCountLab);
        make.right.offset(AUTO(-68));
    }];
    

    


}

- (void)setModel:(JCMatchInfoModel *)model {
    _model = model;
    self.matchNameLab.text = model.competition_name.length>0?model.competition_name:model.short_name_zh;
    self.matchTimeLab.text = model.begin_time.length>0?model.begin_time:model.match_time;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text = model.away_team_name;
    
    self.matchWeekLab.text = NonNil(model.round_num);
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if ([model.plan_num integerValue]>0) {
        self.planCountLab.hidden = NO;
        self.planCountLab.text = [NSString stringWithFormat:@"%@方案",model.plan_num];
        
        [self.matchWeekLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(AUTO(-68));
        }];
    }else{
        self.planCountLab.text = @"";
        self.planCountLab.hidden = YES;
        
        [self.matchWeekLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(AUTO(-15));
        }];
    }

    if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {
        self.scoreLab.text = model.score;

    }else
    {
        self.scoreLab.text = @"VS";
    }

    self.matchStatusLab.text = [NSString stringWithFormat:@"  %@  ",model.status_cn];
    
    //进行中的比赛显示分钟数
    if ([model.status_id intValue]==1) {
        self.matchStatusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
    }else if ([model.status_id intValue]>1&&[model.status_id intValue]<8) {
        self.matchStatusLab.textColor = COLOR_30B27A;
        self.scoreLab.textColor = COLOR_30B27A;
        if ([model.second_half_time floatValue]>0) {
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[model.second_half_time floatValue];

            self.matchStatusLab.text = [NSString stringWithFormat:@"  %.0f'  ",distance/60+45];

        }else{
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[model.first_half_time floatValue];
            if (distance<0) {
                distance = 0;
            }
            self.matchStatusLab.text = [NSString stringWithFormat:@"  %.0f'  ",distance/60];
            
        }
        if ([model.status_id intValue]==3) {
            self.matchStatusLab.text = @"  中场  ";
        }
    }else if ([model.status_id intValue]==8) {
        self.matchStatusLab.textColor = JCBaseColor;
        self.scoreLab.textColor = JCBaseColor;
    }else{
        self.matchStatusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
    }
    

}



- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchStatusLab;
}



- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];

    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _matchWeekLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchWeekLab;
}


- (UILabel *)planCountLab {
    if (!_planCountLab) {
        _planCountLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _planCountLab.layer.borderColor = JCBaseColor.CGColor;
        _planCountLab.layer.borderWidth = 1;
        _planCountLab.layer.cornerRadius = AUTO(8);
        _planCountLab.layer.masksToBounds = YES;
    }
    return _planCountLab;
}


-(UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        _homeTeamImgView.image = JCIMAGE(@"home_placeholder");
        _homeTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _homeTeamImgView;
}

-(UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        _awayTeamImgView.image = JCIMAGE(@"away_placeholder");
        _awayTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _awayTeamImgView;
}

@end
