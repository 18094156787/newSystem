//
//  JCTransactionDataModelDetailMatchView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailMatchView.h"

@implementation JCTransactionDataModelDetailMatchView

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(20));
    }];
    
//    [self addSubview:self.resultImgView];
//    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-12));
//        make.top.offset(AUTO(12));
//        make.size.mas_equalTo(CGSizeMake(AUTO(36), AUTO(36)));
//    }];

    
    [self addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(60));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(32), AUTO(32)));
    }];
    
    [self addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-60));
        make.top.equalTo(self.homeImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(32), AUTO(32)));
    }];
    
    
    [self addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView).offset(AUTO(15));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    [self addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.scoreLab.mas_bottom).offset(AUTO(4));
        make.height.mas_equalTo(AUTO(20));
    }];
    

    

    
    [self addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(4));
        make.centerX.equalTo(self.homeImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    [self addSubview:self.homeRankLab];
    [self.homeRankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(4));
        make.centerX.equalTo(self.homeNameLab);
        make.left.right.equalTo(self.homeNameLab);
//        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    [self addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(4));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    [self addSubview:self.awayRankLab];
    [self.awayRankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(4));
        make.centerX.equalTo(self.awayNameLab);
        make.left.right.equalTo(self.awayNameLab);
//        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    
    WeakSelf;
    [self bk_whenTapped:^{
        if (weakSelf.match_id.length>0) {
            JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
            vc.model_id = self.model_id;
            vc.matchNum = weakSelf.match_id;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }
        
    }];

}

- (void)setMatch_id:(NSString *)match_id {
    _match_id = match_id;
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    _model = model;
    self.titleLab.text = [NSString stringWithFormat:@"%@  %@",model.competition_name,model.get_match_time];
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team.logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team.logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.statusLab.text = model.status_cn;
    self.homeNameLab.text = model.home_team.name_zh;
    self.awayNameLab.text = model.away_team.name_zh;
    self.homeRankLab.text = [NSString stringWithFormat:@"%@排名%ld",model.competition_name,model.home_team_position];
    self.awayRankLab.text = [NSString stringWithFormat:@"%@排名%ld",model.competition_name,model.away_team_position];
    if (model.competition_type!=1) {
        self.homeRankLab.text = @"";
        self.awayRankLab.text = @"";
    }

    if (model.status_id>1&&model.status_id<9) {
        self.scoreLab.text = [NSString stringWithFormat:@"%ld : %ld",model.home_all_score,model.away_all_score];
    }else{
        self.scoreLab.text = @"VS";
    }
    //进行中的比赛显示分钟数
     if (model.status_id>1&&model.status_id<8) {
        self.statusLab.textColor = COLOR_30B27A;
        self.scoreLab.textColor = COLOR_30B27A;

        if (model.status_id==2||model.status_id==4) {
//            self.ongoingTimeLab.text = model.status_cn;
            if (model.second_half_time>0) {
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.second_half_time longValue];

                self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.first_half_time longValue];
                if (distance<0) {
                    distance = 0;
                }
                self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
                
            }
        }else{
            self.statusLab.text = model.status_cn;
        }
    }else if(model.status_id==8){
        self.statusLab.text = model.status_cn;
        self.statusLab.textColor = JCBaseColor;
        self.scoreLab.textColor = JCBaseColor;
    }else{
        self.statusLab.text = model.status_cn;
        self.statusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
    }

}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];

    }
    return _resultImgView;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _homeImgView.layer.borderWidth = 0.5;
//        _homeImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
//        _homeImgView.layer.masksToBounds = YES;
//        _homeImgView.layer.cornerRadius = AUTO(20);
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _awayImgView.layer.borderWidth = 0.5;
//        _awayImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
//        _awayImgView.layer.masksToBounds = YES;
//        _awayImgView.layer.cornerRadius = AUTO(20);
    }
    return _awayImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayNameLab;
}

- (UILabel *)homeRankLab {
    if (!_homeRankLab) {
        _homeRankLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeRankLab;
}

- (UILabel *)awayRankLab {
    if (!_awayRankLab) {
        _awayRankLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayRankLab;
}



@end
