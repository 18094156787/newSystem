//
//  JCPoissonDataModelLockedCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelLockedCell.h"

@implementation JCPoissonDataModelLockedCell

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
    

    [self.contentView addSubview:self.lockBtn];
    [self.lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(17));
        make.height.mas_equalTo(AUTO(36));
        make.bottom.offset(AUTO(-20));
        
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
//
//
//    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
//    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
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



- (UIButton *)lockBtn {
    if (!_lockBtn) {
        _lockBtn = [UIButton initWithText:@"开通[泊松分布]服务，解锁泊松预测详情" FontSize:AUTO(14) Weight:1 BackGroundColor:[JCBaseColor colorWithAlphaComponent:0.1] TextColors:JCBaseColor];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:0];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:UIControlStateHighlighted];
        [_lockBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_lockBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, AUTO(20))];
        _lockBtn.userInteractionEnabled = NO;
    }
    return _lockBtn;
}


@end
