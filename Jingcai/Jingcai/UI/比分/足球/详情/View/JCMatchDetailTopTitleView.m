//
//  JCMatchDetailTopTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchDetailTopTitleView.h"

@implementation JCMatchDetailTopTitleView

- (void)initViews {
    self.infoView.alpha= 1;
    self.matchView.alpha = 0;
    self.infoView.frame = CGRectMake(0, 0, SCREEN_WIDTH-88, 64);
    [self addSubview:self.infoView];
//    self.infoView.backgroundColor = JCBaseColor;
//    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];r

    [self.infoView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(2);
        make.centerX.equalTo(self.infoView);
    }];

    [self.infoView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(0);
        make.centerX.equalTo(self.infoView);
    }];
    
    self.matchView.frame = CGRectMake(0, 0, SCREEN_WIDTH-88, 44);
    [self addSubview:self.matchView];
//    [self.matchView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    
    [self.matchView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.matchView);
        make.width.mas_equalTo(80);
    }];
    
    
    [self.matchView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.scoreLab.mas_left);
        make.centerY.equalTo(self.matchView);
        make.width.height.mas_equalTo(30);
    }];
    

    [self.matchView addSubview:self.awayImgView];
     [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.scoreLab.mas_right);
         make.centerY.equalTo(self.matchView);
         make.width.height.mas_equalTo(30);
     }];
    
    [self.matchView addSubview:self.homeNameLab];
     [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.equalTo(self.homeImgView.mas_left).offset(-5);
         make.centerY.equalTo(self.matchView);
         make.left.offset(0);
     }];

    [self.matchView addSubview:self.awayNameLab];
     [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.awayImgView.mas_right).offset(5);
         make.centerY.equalTo(self.matchView);
         make.right.offset(0);
     }];



    [self.matchView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.matchView);
        make.bottom.equalTo(self.scoreLab.mas_top).offset(3);
    }];
}

- (void)setMatchBall:(JCMatchBall *)matchBall {
    _matchBall = matchBall;
    NSString *title = [NSString stringWithFormat:@"%@ |",matchBall.competition.short_name_zh];
    if (matchBall.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" %@",matchBall.group_num_new];
    }
    if (matchBall.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@",matchBall.round_num_two];
    }
    if (matchBall.round_num_one.length>0) {
        title = [title stringByAppendingFormat:@" %@",matchBall.round_num_one];
    }
    if (matchBall.group_num_new.length==0&&matchBall.round_num_two.length==0&&matchBall.round_num_one.length==0) {
        title = [NSString stringWithFormat:@"%@",matchBall.competition.short_name_zh];
    }
    self.titleLab.text = title;
    self.infoLab.text = matchBall.get_match_time;
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.home_team.logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.away_team.logo] placeholderImage:JCIMAGE(@"away_placeholder")];

    
    self.homeNameLab.text = matchBall.home_team.name_zh;
    self.awayNameLab.text = matchBall.away_team.name_zh;

    self.statusLab.text = matchBall.status_cn;
    
    if (matchBall.status_id>1&&matchBall.status_id<8) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@:%@",matchBall.home_all_score,matchBall.away_all_score];

//        self.ongoingTimeLab.text = model.match_competition;
        if ([matchBall.second_half_time floatValue]>0) {
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[matchBall.second_half_time floatValue];

            self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
//            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
        }else{
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[matchBall.first_half_time floatValue];
            if (distance<0) {
                distance = 0;
            }
            self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
            
        }
        if (matchBall.status_id==3) {
            self.statusLab.text = @"中场";
        }

    }else{
        self.scoreLab.text = @"VS";


    }


}


- (void)setBasketBallMatch:(JCBasketBallMatchBall *)basketBallMatch {
    _basketBallMatch = basketBallMatch;
    self.titleLab.text = [NSString stringWithFormat:@"%@",NonNil(basketBallMatch.competition_name)];
    if (basketBallMatch.round_num.length>0) {
        self.titleLab.text =  [NSString stringWithFormat:@"%@ | %@",NonNil(basketBallMatch.competition_name),basketBallMatch.round_num];
    }    self.infoLab.text = basketBallMatch.match_time;
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:basketBallMatch.away_team_logo] placeholderImage:JCIMAGE(@"ic_match_basketball")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:basketBallMatch.home_team_logo] placeholderImage:JCIMAGE(@"ic_match_basketball")];

    
    self.homeNameLab.text = basketBallMatch.away_team_name;
    self.awayNameLab.text = basketBallMatch.home_team_name;
    self.statusLab.text = basketBallMatch.status_cn;
    if ([basketBallMatch.status_id intValue]>1&&[basketBallMatch.status_id intValue]<11) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@ - %@",basketBallMatch.away_scores_sum,basketBallMatch.home_scores_sum];
    }else
    {
        self.scoreLab.text = @"VS";
    }
}

- (UIView *)infoView {
    if (!_infoView) {
        _infoView = [UIView new];
    }
    return _infoView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:11 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIView *)matchView {
    if (!_matchView) {
        _matchView = [UIView new];
    }
    return _matchView;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
         _homeImgView.backgroundColor = JCWhiteColor;
        [_homeImgView hg_setAllCornerWithCornerRadius:15];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.backgroundColor = JCWhiteColor;
        [_awayImgView hg_setAllCornerWithCornerRadius:15];
    }
    return _awayImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:14 andWeight:3 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}


- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:14 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:14 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (UILabel *)statusLab {
    if (!_statusLab ) {
        _statusLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:[JCWhiteColor colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

@end
