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
        make.top.offset(AUTO(5));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(AUTO(24));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(18)));
    }];
    
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
        make.width.mas_lessThanOrEqualTo(AUTO(85));
    }];
    
    [self.contentView addSubview:self.home_red_Lab];
    [self.home_red_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeTeamLab);
        make.right.equalTo(self.homeTeamLab.mas_left).offset(-4);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.home_yellow_Lab];
    [self.home_yellow_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeTeamLab);
        make.right.equalTo(self.home_red_Lab.mas_left).offset(-2);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
    }];
    
    
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
        make.width.mas_lessThanOrEqualTo(AUTO(85));
    }];
    
    [self.contentView addSubview:self.away_red_Lab];
    [self.away_red_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayTeamLab);
        make.left.equalTo(self.awayTeamLab.mas_right).offset(4);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.away_yellow_Lab];
    [self.away_yellow_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.awayTeamLab);
        make.left.equalTo(self.away_red_Lab.mas_right).offset(2);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.zbImgView];
    [self.zbImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
//        make.centerY.equalTo(self.homeTeamLab);
        make.top.offset(AUTO(31));
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    


    
    [self.contentView addSubview:self.bigDataImgView];
    [self.bigDataImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(48));
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.contentView addSubview:self.collectionBtn];
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.centerY.equalTo(self.homeTeamLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeTeamLab.mas_right).offset(-8);
        make.centerY.equalTo(self.matchNameLab);
    }];

    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.matchNameLab);
    }];
    

    [self.contentView addSubview:self.planCountLab];
    [self.planCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.matchNameLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(44), AUTO(16)));
    }];
    

    [self.contentView addSubview:self.matchWeekLab];
    [self.matchWeekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-68));
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.halfScoreLab];
    [self.halfScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(48));
        make.height.mas_equalTo(AUTO(16));
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        
    }];
    
    [self.contentView addSubview:self.neutralLab];
    [self.neutralLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.halfScoreLab.mas_bottom).offset(AUTO(6));
        make.height.mas_equalTo(AUTO(18));
        make.bottom.offset(0);

    }];
    

}

- (void)setModel:(JCMatchInfoModel *)model {
    _model = model;
//    if (!model) {
//        return;
//    }
//    self.matchNameLab.text = model.competition_name.length>0?model.competition_name:model.short_name_zh;
//    NSString *title = @"";
//    if (model.competition_name.length>0) {
//        title = model.competition_name;
//    }
//    if (model.group_num_new.length>0) {
//        title = [title stringByAppendingFormat:@" %@",model.group_num_new];
//    }
//    if (model.round_num_two.length>0) {
//        title = [title stringByAppendingFormat:@" %@",model.round_num_two];
//    }
//    if (model.begin_time.length>0) {
//        title = [title stringByAppendingFormat:@" %@",model.begin_time];
//    }
//    NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:title];
//    if (model.competition_name.length>0) {
//        NSRange range = [title rangeOfString:model.competition_name];
//        if (range.location!=NSNotFound) {
//            [titleAttr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
//            self.matchNameLab.attributedText = titleAttr;
//        }
//    }else {
//        self.matchNameLab.text = title;
//    }
    self.matchNameLab.text = model.competition_name;
    self.matchTimeLab.text = model.begin_time;

    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text = model.away_team_name;
    
    self.matchWeekLab.text = NonNil(model.round_num_one);

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
            make.right.offset(AUTO(-16));
        }];
    }



    

    

    

    //半场比分,角球
    if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {
        self.scoreLab.text = model.score;
        self.halfScoreLab.text = @"";
        if ([model.status_id intValue]>=3) {
            self.halfScoreLab.text = [NSString stringWithFormat:@"半场 %@",model.half_score];
        }
    }else
    {
        self.scoreLab.text = @"VS";

       
    }



    self.matchStatusLab.text = model.status_cn;
    
    //进行中的比赛显示分钟数
     if ([model.status_id intValue]>1&&[model.status_id intValue]<8) {
        self.matchStatusLab.textColor = COLOR_30B27A;
        self.scoreLab.textColor = COLOR_30B27A;

        if ([model.status_id intValue]==2||[model.status_id intValue]==4) {
//            self.ongoingTimeLab.text = model.status_cn;
            if ([model.second_half_time floatValue]>0) {
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.second_half_time floatValue];

                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-[model.first_half_time floatValue];
                if (distance<0) {
                    distance = 0;
                }
                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
                
            }
        }else{
            self.matchStatusLab.text = model.status_cn;
        }
    }else if([model.status_id intValue]==8){
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = JCBaseColor;
        self.scoreLab.textColor = JCBaseColor;
    }else{
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
    }
    

    self.collectionBtn.selected = [model.is_subscribe integerValue]==1?YES:NO;
    self.zbImgView.hidden = [model.is_live integerValue]==1?NO:YES;
    self.bigDataImgView.hidden = model.is_have_big_data==1?NO:YES;
    
    if ([model.is_live integerValue]==0) {
        [self.bigDataImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(31));
        }];
    }else{
        [self.bigDataImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(48));
        }];
    }
    
    if ([model.neutral integerValue]==1&&model.note.length>0) {
        self.neutralLab.text = [NSString stringWithFormat:@"中立场: %@",model.note];
        [self.neutralLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(18));
        }];
    }else{
        self.neutralLab.text = @"";
        [self.neutralLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    
    
    self.home_red_Lab.text = model.home_red_card;
    self.away_red_Lab.text = model.away_red_card;
    self.home_yellow_Lab.text = model.home_yellow_card;
    self.away_yellow_Lab.text = model.away_yellow_card;
    [self.home_red_Lab mas_updateConstraints:^(MASConstraintMaker *make) {
        if ([model.home_red_card integerValue]>0) {
            make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
        }else{
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }
    }];
    [self.away_red_Lab mas_updateConstraints:^(MASConstraintMaker *make) {
        if ([model.away_red_card integerValue]>0) {
            make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
        }else{
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }
    }];
    [self.home_yellow_Lab mas_updateConstraints:^(MASConstraintMaker *make) {
        if ([model.home_yellow_card integerValue]>0) {
            make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
        }else{
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }
    }];
    [self.away_yellow_Lab mas_updateConstraints:^(MASConstraintMaker *make) {
        if ([model.away_yellow_card integerValue]>0) {
            make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
        }else{
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }
    }];

    
    {
        //半场比分,角球
        if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {

            NSMutableAttributedString *all_attr = [[NSMutableAttributedString alloc] init];

            if ([model.status_id integerValue]==8) {
                if ([model.is_have_overtime integerValue]==1||[model.is_have_overtime integerValue]==1) {
                    if (model.winning_team.length>0) {
                        NSString *win_team = model.winning_team;
                        if (win_team.length>5) {
                            win_team = [win_team substringToIndex:5];
                            win_team = [NSString stringWithFormat:@"%@...",win_team];
                        }
                        
                        NSString *team_str = [NSString stringWithFormat:@"%@胜出",win_team];
                        NSMutableAttributedString *team_attr = [[NSMutableAttributedString alloc] initWithString:team_str];
                        NSRange team_range = [team_str rangeOfString:win_team];
                        if (team_range.location!=NSNotFound) {
                            
                            [team_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:team_range];
                        }
                        [all_attr appendAttributedString:team_attr];
                    }
                }
            }

            
            
            NSString *score_str = @"";
//            @"  半(1:0)  角(4:1)";
            
            if (model.corner_score.length>0) {
                score_str =  [NSString stringWithFormat:@"  角(%@)",model.corner_score];
            }

            if ([model.status_id intValue]>=3) {
                score_str =  [NSString stringWithFormat:@"  半(%@)",model.half_score];
                if (model.corner_score.length>0) {
                    score_str =  [NSString stringWithFormat:@"  半(%@)  角(%@)",model.half_score,model.corner_score];
                }
               
            }
            [all_attr appendString:score_str];
            
            NSString *time_str = @"";
            if (model.overtime_score.length>0&&[model.is_have_overtime integerValue]==1) {
                time_str = [NSString stringWithFormat:@"  120分钟(%@) ",model.overtime_score];
                NSMutableAttributedString *time_attr = [[NSMutableAttributedString alloc] initWithString:time_str];
                NSRange time_range = [time_str rangeOfString:model.overtime_score];
                if (time_range.location != NSNotFound) {
                    [time_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:time_range];
                }
                [all_attr appendAttributedString:time_attr];
            }

            
            
            NSString *dian_str = @"";
            if (model.penalty_score.length>0&&[model.is_have_penalty integerValue]==1) {
                dian_str = [NSString stringWithFormat:@"  点(%@)",model.penalty_score];
                NSMutableAttributedString *dian_attr = [[NSMutableAttributedString alloc] initWithString:dian_str];
                NSRange dian_range = [dian_str rangeOfString:model.penalty_score];
                if (dian_range.location != NSNotFound) {
                    [dian_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:dian_range];
                }
                [all_attr appendAttributedString:dian_attr];
            }

            
            
            
          
           
            
            
            self.halfScoreLab.attributedText = all_attr;
        }else
        {
            self.halfScoreLab.text = @"";
           
        }
        
        

        
        //    self.halfScoreLab.text = @"约森独立队约森独... 胜出  半(1:0)  角(4:1)  120分钟(2:2)  点(2:2)";
    }
    
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
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)matchTimeLab {
    if (!_matchTimeLab) {
        _matchTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchTimeLab;
}

- (UILabel *)matchStatusLab {
    if (!_matchStatusLab) {
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _halfScoreLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _halfScoreLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)];
    }
    return _halfScoreLab;
}

- (UILabel *)matchWeekLab {
    if (!_matchWeekLab) {
        _matchWeekLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchWeekLab;
}

//- (UILabel *)ongoingTimeLab {
//    if (!_ongoingTimeLab) {
//        _ongoingTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
//        [_ongoingTimeLab hg_setAllCornerWithCornerRadius:AUTO(3)];
//    }
//    return _ongoingTimeLab;
//}

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

- (UILabel *)neutralLab {
    if (!_neutralLab) {
        _neutralLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.06] andTextAlignment:NSTextAlignmentCenter];
        _neutralLab.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(10)];
    }
    return _neutralLab;
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

- (UILabel *)home_red_Lab {
    if (!_home_red_Lab) {
        _home_red_Lab = [UILabel initWithTitle:@"" andFont:10 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
        [_home_red_Lab hg_setAllCornerWithCornerRadius:2];
    }
    return _home_red_Lab;
}

- (UILabel *)home_yellow_Lab {
    if (!_home_yellow_Lab) {
        _home_yellow_Lab = [UILabel initWithTitle:@"" andFont:10 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:UIColorFromRGB(0xFEEF2F) andTextAlignment:NSTextAlignmentCenter];
        [_home_yellow_Lab hg_setAllCornerWithCornerRadius:2];
    }
    return _home_yellow_Lab;
}

- (UILabel *)away_red_Lab {
    if (!_away_red_Lab) {
        _away_red_Lab = [UILabel initWithTitle:@"" andFont:10 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
        [_away_red_Lab hg_setAllCornerWithCornerRadius:2];
    }
    return _away_red_Lab;
}

- (UILabel *)away_yellow_Lab {
    if (!_away_yellow_Lab) {
        _away_yellow_Lab = [UILabel initWithTitle:@"" andFont:10 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:UIColorFromRGB(0xFEEF2F) andTextAlignment:NSTextAlignmentCenter];
        [_away_yellow_Lab hg_setAllCornerWithCornerRadius:2];
    }
    return _away_yellow_Lab;
}

//-(UIImageView *)homeTeamImgView {
//    if (!_homeTeamImgView) {
//        _homeTeamImgView = [UIImageView new];
//        _homeTeamImgView.image = JCIMAGE(@"home_placeholder");
//        _homeTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    return _homeTeamImgView;
//}
//
//-(UIImageView *)awayTeamImgView {
//    if (!_awayTeamImgView) {
//        _awayTeamImgView = [UIImageView new];
//        _awayTeamImgView.image = JCIMAGE(@"away_placeholder");
//        _awayTeamImgView.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    return _awayTeamImgView;
//}



@end
