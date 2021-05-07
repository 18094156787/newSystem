//
//  JCMatchHomeListTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchHomeListTableViewCell.h"

@implementation JCMatchHomeListTableViewCell

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

    [self.contentView addSubview:self.collectionBtn];
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.top.offset(AUTO(5));
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(42));
        make.right.equalTo(self.contentView.mas_centerX).offset(-SCREEN_WIDTH/4.0f+AUTO(28));
        make.height.mas_equalTo(AUTO(28));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(42));
//        make.left.equalTo(self.scoreLab.mas_right);
        make.left.equalTo(self.contentView.mas_centerX).offset(SCREEN_WIDTH/4.0f-AUTO(28));
        make.height.mas_equalTo(AUTO(28));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.homeTeamImgView);
    }];
    
    [self.contentView addSubview:self.ongoingTimeLab];
    [self.ongoingTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.homeTeamImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];

    
    
    [self.contentView addSubview:self.zbImgView];
    [self.zbImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.homeTeamImgView);
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(14)));
    }];
    

    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeTeamImgView);
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(4));
        make.width.mas_equalTo(AUTO(115));
//        make.height.mas_equalTo(AUTO(40));
    }];
    
    
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayTeamImgView);
        make.top.equalTo(self.awayTeamImgView.mas_bottom).offset(AUTO(4));
        make.width.mas_equalTo(AUTO(115));
//        make.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.bigDataImgView];
    [self.bigDataImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeTeamLab);
        make.centerX.equalTo(self.zbImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(14), AUTO(16)));
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.homeTeamLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(18)));
    }];
    
    [self.contentView addSubview:self.matchWeekLab];
    [self.matchWeekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab);
        make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(15));
        make.bottom.offset(AUTO(-14));
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
    
    

}

- (void)setModel:(JCMatchInfoModel *)model {
    _model = model;
//    self.matchNameLab.text = model.competition_name.length>0?model.competition_name:model.short_name_zh;
    NSString *title = @"";
    if (model.competition_name.length>0) {
        title = model.competition_name;
    }
    if (model.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" %@",model.group_num_new];
    }
    if (model.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@",model.round_num_two];
    }
    if (model.begin_time.length>0) {
        title = [title stringByAppendingFormat:@" %@",model.begin_time];
    }
    NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:title];
    if (model.competition_name.length>0) {
        NSRange range = [title rangeOfString:model.competition_name];
        if (range.location!=NSNotFound) {
            [titleAttr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
            self.matchNameLab.attributedText = titleAttr;
        }
    }else {
        self.matchNameLab.text = title;
    }
//    CGSize homeSize = [self returnTextWidth:NonNil(model.home_team_name) size:CGSizeMake(AUTO(115), 60) font:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]];
//    CGSize awaySize = [self returnTextWidth:NonNil(model.away_team_name) size:CGSizeMake(AUTO(115), 60) font:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]];

//    
//    NSLog(@"%@--%.0f",model.away_team_name,awaySize.height);
    
    
//    self.matchTimeLab.text = model.begin_time.length>0?model.begin_time:model.match_time;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text = model.away_team_name;
    
    self.matchWeekLab.text = NonNil(model.round_num_one);
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if ([model.plan_num integerValue]>0) {
        self.planCountLab.hidden = NO;
        self.planCountLab.text = [NSString stringWithFormat:@"%@个方案",model.plan_num];
    }else{
        self.planCountLab.text = @"";
        self.planCountLab.hidden = YES;
    }



    

    

    

    
    if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {
        self.scoreLab.text = model.score;
        self.halfScoreLab.text = @"";
        if ([model.status_id intValue]>=3) {
            self.halfScoreLab.text = [NSString stringWithFormat:@"半场 %@",model.half_score];
        }
    }else
    {
//        self.scoreLab.textColor = JCBaseColor
        self.scoreLab.text = @"VS";
        self.halfScoreLab.text = @"";
       
    }

    self.matchStatusLab.text = model.status_cn;
    
    //进行中的比赛显示分钟数
    if ([model.status_id intValue]>1&&[model.status_id intValue]<8) {
//        self.scoreLab.text = model.score;
//        self.halfScoreLab.text = [NSString stringWithFormat:@"半场 %@",model.half_score];
        
        
        self.ongoingTimeLab.hidden = NO;
        self.matchStatusLab.text = @"";
        self.ongoingTimeLab.text = model.match_competition;

        if ([model.status_id intValue]==2||[model.status_id intValue]==4) {
//            self.ongoingTimeLab.text = model.status_cn;
            if ([model.second_half_time floatValue]>0) {
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.second_half_time floatValue];

                self.ongoingTimeLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.first_half_time floatValue];
                if (distance<0) {
                    distance = 0;
                }
                self.ongoingTimeLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
                
            }
        }else{
            self.ongoingTimeLab.text = model.status_cn;
        }
    }else
    {
        self.ongoingTimeLab.hidden = YES;
    }
    

    self.collectionBtn.selected = [model.is_subscribe integerValue]==1?YES:NO;
    self.zbImgView.hidden = [model.is_live integerValue]==1?NO:YES;
    self.bigDataImgView.hidden = model.is_have_big_data==1?NO:YES;
    
    if (model.home_team_name.length>model.away_team_name.length) {
        [self.matchWeekLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.matchNameLab);
            make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
            if (model.round_num_one.length>0||[model.plan_num integerValue]>0||[model.status_id intValue]>=3){
                make.height.mas_equalTo(AUTO(15));
            }else {
                make.height.mas_equalTo(0);
            }
            
            make.bottom.offset(AUTO(-14));
        }];
        
    }else{

        
        [self.matchWeekLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.matchNameLab);
            make.top.equalTo(self.awayTeamLab.mas_bottom).offset(AUTO(8));
            if (model.round_num_one.length>0||[model.plan_num integerValue]>0||[model.status_id intValue]>=3){
                make.height.mas_equalTo(AUTO(15));
            }else {
                make.height.mas_equalTo(0);
            }
            make.bottom.offset(AUTO(-14));
        }];
        

    }

//    if (model.round_num_one.length==0&&[model.plan_num integerValue]==0) {
//        [self.matchWeekLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.matchNameLab);
//            make.bottom.offset(AUTO(-14));
//            make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
//            make.height.mas_equalTo(0);
//        }];
//    }else {
//        [self.matchWeekLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.matchNameLab);
//            make.bottom.offset(AUTO(-14));
//            make.top.equalTo(self.homeTeamLab.mas_bottom).offset(AUTO(8));
//            make.height.mas_equalTo(AUTO(15));
//        }];
//    }


    
}

- (void)collectionBtnClick {
    if (self.JCConcernBlock) {
        self.JCConcernBlock();
    }
}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
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

- (UIImageView *)bigDataImgView {
    if (!_bigDataImgView) {
        _bigDataImgView = [UIImageView new];
        _bigDataImgView.image = JCIMAGE(@"ic_jingcai");
    }
    return _bigDataImgView;
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
