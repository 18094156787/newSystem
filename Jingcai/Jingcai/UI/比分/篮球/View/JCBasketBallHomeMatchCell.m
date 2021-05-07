//
//  JCBasketBallHomeMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallHomeMatchCell.h"

@implementation JCBasketBallHomeMatchCell

- (void)initViews {
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.size.mas_equalTo(CGSizeMake(AUTO(55), AUTO(15)));
    }];
    

    [self.contentView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.matchNameLab.mas_bottom).offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(135), AUTO(15)));
    }];
    
    [self.contentView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(12));
        make.size.mas_equalTo(CGSizeMake(AUTO(135), AUTO(15)));
    }];
    
    [self.contentView addSubview:self.weekLab];
    [self.weekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(12));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNameLab);
        make.bottom.equalTo(self.awayNameLab);
        make.left.equalTo(self.homeNameLab.mas_right).offset(AUTO(5));
        make.width.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab.mas_right);
        make.centerY.equalTo(self.matchNameLab);
        make.right.equalTo(lineView.mas_left);
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.sectionTimeLab];
    [self.sectionTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.matchNameLab);
    }];
    
    [self.contentView addSubview:self.planCountLab];
    [self.planCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.matchNameLab);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.homeScoreLab];
    [self.homeScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.homeSectionOneLab];
    [self.homeSectionOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeScoreLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.homeSectionTwoLab];
    [self.homeSectionTwoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeSectionOneLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.homeSectionThreeLab];
    [self.homeSectionThreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeSectionTwoLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.homeSectionFourLab];
    [self.homeSectionFourLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeSectionThreeLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.homeSectionOTLab];
    [self.homeSectionOTLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeSectionFourLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.homeSectionTotalLab];
    [self.homeSectionTotalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeSectionOTLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awayScoreLab];
    [self.awayScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.awaySectionOneLab];
    [self.awaySectionOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayScoreLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awaySectionTwoLab];
    [self.awaySectionTwoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awaySectionOneLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awaySectionThreeLab];
    [self.awaySectionThreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awaySectionTwoLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awaySectionFourLab];
    [self.awaySectionFourLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awaySectionThreeLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awaySectionOTLab];
    [self.awaySectionOTLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awaySectionFourLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.awaySectionTotalLab];
    [self.awaySectionTotalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awaySectionOTLab.mas_right);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(23));
    }];
    
    [self.contentView addSubview:self.collectionBtn];
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-5);
        make.centerY.equalTo(self.homeNameLab.mas_bottom);
        make.width.height.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.weekLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(0.001);
        make.bottom.offset(0);
    }];
    
    [self.homeScoreArray addObject:self.homeSectionOneLab];
    [self.homeScoreArray addObject:self.homeSectionTwoLab];
    [self.homeScoreArray addObject:self.homeSectionThreeLab];
    [self.homeScoreArray addObject:self.homeSectionFourLab];
    [self.homeScoreArray addObject:self.homeSectionOTLab];
    
    [self.awayScoreArray addObject:self.awaySectionOneLab];
    [self.awayScoreArray addObject:self.awaySectionTwoLab];
    [self.awayScoreArray addObject:self.awaySectionThreeLab];
    [self.awayScoreArray addObject:self.awaySectionFourLab];
    [self.awayScoreArray addObject:self.awaySectionOTLab];
}

- (void)setShowBottom:(BOOL)showBottom {
    _showBottom = showBottom;
//    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
//        if (showBottom) {
//            make.height.mas_equalTo(8);
//        }else{
//            make.height.mas_equalTo(0.001);
//        }
//    }];
    
    if (self.model.round_num.length>0) {
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.equalTo(self.weekLab.mas_bottom).offset(AUTO(12));
//            make.height.mas_equalTo(0.001);
            if (showBottom) {
                make.height.mas_equalTo(8);
            }else{
                make.height.mas_equalTo(0.001);
            }
            make.bottom.offset(0);
        }];
    }else {
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.equalTo(self.weekLab.mas_bottom).offset(0);
//            make.height.mas_equalTo(0.001);
            if (showBottom) {
                make.height.mas_equalTo(8);
            }else{
                make.height.mas_equalTo(0.001);
            }
            make.bottom.offset(0);
        }];

    }
}

- (void)setModel:(JCBasketBallMatchBall *)model {
    _model = model;
    self.matchNameLab.text = NonNil(model.competition_name);
    self.timeLab.text = [NSDate timeStringWithIntervalWithFormat:@"MM-dd HH:mm" time:[model.match_time doubleValue]];
//    NSString *round_num = model.round_num.length==0?model.kindType:model.round_num;
    self.typeLab.text = model.kindType;
    self.weekLab.text = NonNil(model.round_num);

    
    self.collectionBtn.selected = [model.is_subscribe intValue]==1?YES:NO;
//    if (round_num.length==0) {
//        [self.sectionTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.typeLab);
//            make.centerY.equalTo(self.matchNameLab);
//        }];
//    }else{
//        [self.sectionTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.typeLab.mas_right).offset(AUTO(15));
//            make.centerY.equalTo(self.matchNameLab);
//        }];
//    }
    if([model.status_id intValue]>1&&[model.status_id intValue]<10){
        self.sectionTimeLab.textColor = JCBaseColor;
        if ([model.surplus_seconds integerValue]>0) {
            NSInteger minite = [model.surplus_seconds integerValue]/60;
            NSInteger second = [model.surplus_seconds integerValue]%60;
            self.sectionTimeLab.text = [NSString stringWithFormat:@"%@ %02ld:%02ld",model.status_cn,minite,second];
        }else{
            self.sectionTimeLab.text = model.status_cn;
        }
        
        
    }else{
        self.sectionTimeLab.text = model.status_cn;
        self.sectionTimeLab.textColor = COLOR_666666;
    }
    
    
    self.homeScoreLab.text = model.away_odds;
    self.awayScoreLab.text = model.home_odds;
    
    self.planCountLab.text = [NSString stringWithFormat:@"%@个方案",model.plan_num];
    self.planCountLab.hidden = [model.plan_num intValue]==0?YES:NO;
    self.homeNameLab.text = model.away_team_name;
    self.awayNameLab.text = model.home_team_name;
    
    if ([model.home_scores_sum isEqual:@"0"]) {
        model.home_scores_sum = @"";
    }
    
    if ([model.away_scores_sum isEqual:@"0"]) {
        model.away_scores_sum = @"";
    }


    
    if ([model.status_id integerValue]<10) {
        //进行中的比赛
        self.homeScoreLab.textColor = COLOR_FF924B;
        self.awayScoreLab.textColor = COLOR_FF924B;
    }else{
        self.homeScoreLab.textColor = COLOR_2F2F2F;
        self.awayScoreLab.textColor = COLOR_2F2F2F;
    }
    
    if ([model.status_id integerValue]>1&&[model.status_id integerValue]<10) {
        //进行中的比赛
        self.sectionTimeLab.textColor = JCBaseColor;
        self.homeSectionTotalLab.text = model.home_scores_sum.length>0?model.home_scores_sum:@"0";
        self.awaySectionTotalLab.text = model.home_scores_sum.length>0?model.home_scores_sum:@"0";;
    }else{
        self.sectionTimeLab.textColor = [COLOR_000000 colorWithAlphaComponent:0.6];
        self.homeSectionTotalLab.text = model.away_scores_sum;
        self.awaySectionTotalLab.text = model.home_scores_sum;

    }
    
    if (model.away_scores.count<=self.homeScoreArray.count) {
        for (int i=0; i<model.away_scores.count; i++) {
            UILabel *label = self.homeScoreArray[i];
            NSString *text  = model.away_scores[i];
//            if ([text intValue]==0) {
//                text = @"";
//            }
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
    
    if (model.home_scores.count<=self.awayScoreArray.count) {
        for (int i=0; i<model.home_scores.count; i++) {
            UILabel *label = self.awayScoreArray[i];
            NSString *text  = model.home_scores[i];
//            if ([text intValue]==0) {
//                text = @"";
//            }
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
    if ([model.status_id intValue]==0||[model.status_id intValue]==1) {
        self.homeSectionOneLab.text = @"";
        self.homeSectionTwoLab.text = @"";
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionOneLab.text = @"";
        self.awaySectionTwoLab.text = @"";
        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";

    }
    if ([model.status_id intValue]==2||[model.status_id intValue]==3) {
        self.homeSectionTwoLab.text = @"";
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionTwoLab.text = @"";
        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";
        

    }
    if ([model.status_id intValue]==4||[model.status_id intValue]==5) {
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        

        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";

    }

    if ([model.status_id intValue]==6||[model.status_id intValue]==7) {
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";


    }
    
    if ([model.status_id intValue]==8) {

        self.homeSectionOTLab.text = @"";
        
        self.awaySectionOTLab.text = @"";

    }
    if ([model.status_id intValue]==9) {

        NSString *homeOT = model.away_scores.lastObject;
        NSString *awayOT = model.home_scores.lastObject;
        
        self.homeSectionOTLab.text = [NSString stringWithFormat:@"%@",awayOT];
        self.awaySectionOTLab.text = [NSString stringWithFormat:@"%@",homeOT];

    }

    if ([model.status_id intValue]>9) {
        //已完场
        //正常情况下,加时赛一定会有得分,所以没有得分,就是没有进行加时赛,不显示
        NSString *homeOT = model.away_scores.lastObject;
        NSString *awayOT = model.home_scores.lastObject;
        if ([homeOT integerValue]==0&&[awayOT integerValue]==0) {
            self.homeSectionOTLab.text = @"";
            self.awaySectionOTLab.text = @"";
        }
        if ([model.period_count intValue]==1) {
            self.homeSectionTwoLab.text = @"";
            self.homeSectionThreeLab.text = @"";
            self.homeSectionFourLab.text = @"";

            self.awaySectionTwoLab.text = @"";
            self.awaySectionThreeLab.text = @"";
            self.awaySectionFourLab.text = @"";
        }
        if ([model.period_count intValue]==2) {
            self.homeSectionThreeLab.text = @"";
            self.homeSectionFourLab.text = @"";

            
            self.awaySectionThreeLab.text = @"";
            self.awaySectionFourLab.text = @"";

        }
        if ([model.period_count intValue]==3) {

            self.homeSectionFourLab.text = @"";
            self.awaySectionFourLab.text = @"";

        }

    }
    

    



}

- (void)setConcernModel:(JCBasketBallMatchBall *)concernModel {
    _concernModel = concernModel;
    self.matchNameLab.text = NonNil(concernModel.basketball_short_name_zh);
    self.timeLab.text = NonNil(concernModel.match_time);
//    NSString *round_num = concernModel.round_num.length==0?concernModel.kindType:concernModel.round_num;


//    NSString *round_num = model.round_num.length==0?model.kindType:model.round_num;
    self.typeLab.text = concernModel.kindType;
    self.weekLab.text = NonNil(concernModel.round_num);
    
    
    self.sectionTimeLab.text = [NSString stringWithFormat:@"%@ %@",concernModel.status_cn,concernModel.use_seconds_gm_date];
    self.collectionBtn.selected = [concernModel.is_subscribe intValue]==1?YES:NO;
//    if (round_num.length==0) {
//        [self.sectionTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.typeLab);
//            make.centerY.equalTo(self.matchNameLab);
//        }];
//    }else{
//        [self.sectionTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.typeLab.mas_right).offset(AUTO(15));
//            make.centerY.equalTo(self.matchNameLab);
//        }];
//    }
    if([concernModel.status_id intValue]>1&&[concernModel.status_id intValue]>10){
        self.sectionTimeLab.textColor = JCBaseColor;
    }else{
        self.sectionTimeLab.textColor = COLOR_666666;
    }


    self.homeScoreLab.text = concernModel.away_odds;
    self.awayScoreLab.text = concernModel.home_odds;
    
    self.planCountLab.text = [NSString stringWithFormat:@"%@个方案",concernModel.count];
    self.planCountLab.hidden = [concernModel.count intValue]==0?YES:NO;
    self.homeNameLab.text = concernModel.away_team_name;
    self.awayNameLab.text = concernModel.home_team_name;
    
 
    
    if ([concernModel.home_scores_sum isEqual:@"0"]) {
        concernModel.home_scores_sum = @"";
    }
    
    if ([concernModel.away_scores_sum isEqual:@"0"]) {
        concernModel.away_scores_sum = @"";
    }


    
    if ([concernModel.status_id integerValue]<10) {
        //进行中的比赛
        self.homeScoreLab.textColor = COLOR_FF924B;
        self.awayScoreLab.textColor = COLOR_FF924B;
    }else{
        self.homeScoreLab.textColor = COLOR_2F2F2F;
        self.awayScoreLab.textColor = COLOR_2F2F2F;
    }
    
    if ([concernModel.status_id integerValue]>1&&[concernModel.status_id integerValue]<10) {
        //进行中的比赛
        self.sectionTimeLab.textColor = JCBaseColor;
        self.homeSectionTotalLab.text = concernModel.away_scores_sum.length>0?concernModel.away_scores_sum:@"0";
        self.awaySectionTotalLab.text = concernModel.home_scores_sum.length>0?concernModel.home_scores_sum:@"0";;
    }else{
        self.sectionTimeLab.textColor = [COLOR_000000 colorWithAlphaComponent:0.6];
        self.homeSectionTotalLab.text = concernModel.away_scores_sum;
        self.awaySectionTotalLab.text = concernModel.home_scores_sum;

    }
    
    if (concernModel.away_scores_array.count<=self.homeScoreArray.count) {
        for (int i=0; i<concernModel.away_scores_array.count; i++) {
            UILabel *label = self.homeScoreArray[i];
            NSString *text  = concernModel.away_scores_array[i];
//            if ([text intValue]==0) {
//                text = @"";
//            }
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
    
    if (concernModel.home_scores_array.count<=self.awayScoreArray.count) {
        for (int i=0; i<concernModel.home_scores_array.count; i++) {
            UILabel *label = self.awayScoreArray[i];
            NSString *text  = concernModel.home_scores_array[i];
//            if ([text intValue]==0) {
//                text = @"";
//            }
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
    if ([concernModel.status_id intValue]==0||[concernModel.status_id intValue]==1) {
        self.homeSectionOneLab.text = @"";
        self.homeSectionTwoLab.text = @"";
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionOneLab.text = @"";
        self.awaySectionTwoLab.text = @"";
        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";

    }
    if ([concernModel.status_id intValue]==2||[concernModel.status_id intValue]==3) {
        self.homeSectionTwoLab.text = @"";
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionTwoLab.text = @"";
        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";
        

    }
    if ([concernModel.status_id intValue]==4||[concernModel.status_id intValue]==5) {
        self.homeSectionThreeLab.text = @"";
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        

        self.awaySectionThreeLab.text = @"";
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";

    }

    if ([concernModel.status_id intValue]==6||[concernModel.status_id intValue]==7) {
        self.homeSectionFourLab.text = @"";
        self.homeSectionOTLab.text = @"";
        
        self.awaySectionFourLab.text = @"";
        self.awaySectionOTLab.text = @"";


    }
    
    if ([concernModel.status_id intValue]==8) {

        self.homeSectionOTLab.text = @"";
        
        self.awaySectionOTLab.text = @"";

    }
    if ([concernModel.status_id intValue]==9) {

        NSString *homeOT = concernModel.away_scores.lastObject;
        NSString *awayOT = concernModel.home_scores.lastObject;
        
        self.homeSectionOTLab.text = [NSString stringWithFormat:@"%@",awayOT];
        self.awaySectionOTLab.text = [NSString stringWithFormat:@"%@",homeOT];

    }

    if ([concernModel.status_id intValue]>9) {
        //已完场
        //正常情况下,加时赛一定会有得分,所以没有得分,就是没有进行加时赛,不显示
        NSString *homeOT = concernModel.away_scores.lastObject;
        NSString *awayOT = concernModel.home_scores.lastObject;
        if ([homeOT integerValue]==0&&[awayOT integerValue]==0) {
            self.homeSectionOTLab.text = @"";
            self.awaySectionOTLab.text = @"";
        }
        if ([concernModel.trend_count intValue]==1) {
            self.homeSectionTwoLab.text = @"";
            self.homeSectionThreeLab.text = @"";
            self.homeSectionFourLab.text = @"";

            self.awaySectionTwoLab.text = @"";
            self.awaySectionThreeLab.text = @"";
            self.awaySectionFourLab.text = @"";
        }
        if ([concernModel.trend_count intValue]==2) {
            self.homeSectionThreeLab.text = @"";
            self.homeSectionFourLab.text = @"";

            
            self.awaySectionThreeLab.text = @"";
            self.awaySectionFourLab.text = @"";

        }
        if ([concernModel.trend_count intValue]==3) {

            self.homeSectionFourLab.text = @"";
            self.awaySectionFourLab.text = @"";

        }


    }
}




- (void)collectionBtnClick {
    if (self.JCConcernBlock) {
        self.JCConcernBlock();
    }
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _typeLab;
}

- (UILabel *)sectionTimeLab {
    if (!_sectionTimeLab) {
        _sectionTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _sectionTimeLab;
}

- (KKPaddingLabel *)planCountLab {
    if (!_planCountLab) {
        _planCountLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _planCountLab.layer.borderColor = JCBaseColor.CGColor;
        _planCountLab.layer.borderWidth = 1;
        _planCountLab.layer.cornerRadius = AUTO(10);
        _planCountLab.layer.masksToBounds = YES;
        _planCountLab.padding = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return _planCountLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (UILabel *)homeScoreLab {
    if (!_homeScoreLab) {
        _homeScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_FF924B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeScoreLab;
}

- (UILabel *)homeSectionOneLab {
    if (!_homeSectionOneLab) {
        _homeSectionOneLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionOneLab;
}

- (UILabel *)homeSectionTwoLab {
    if (!_homeSectionTwoLab) {
        _homeSectionTwoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionTwoLab;
}

- (UILabel *)homeSectionThreeLab {
    if (!_homeSectionThreeLab) {
        _homeSectionThreeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionThreeLab;
}

- (UILabel *)homeSectionFourLab {
    if (!_homeSectionFourLab) {
        _homeSectionFourLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionFourLab;
}

- (UILabel *)homeSectionOTLab {
    if (!_homeSectionOTLab) {
        _homeSectionOTLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionOTLab;
}

- (UILabel *)homeSectionTotalLab{
    if (!_homeSectionTotalLab) {
        _homeSectionTotalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeSectionTotalLab;
}

- (UILabel *)awayScoreLab {
    if (!_awayScoreLab) {
        _awayScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_FF924B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayScoreLab;
}

- (UILabel *)awaySectionOneLab {
    if (!_awaySectionOneLab) {
        _awaySectionOneLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionOneLab;
}

- (UILabel *)awaySectionTwoLab {
    if (!_awaySectionTwoLab) {
        _awaySectionTwoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionTwoLab;
}

- (UILabel *)awaySectionThreeLab {
    if (!_awaySectionThreeLab) {
        _awaySectionThreeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionThreeLab;
}

- (UILabel *)awaySectionFourLab {
    if (!_awaySectionFourLab) {
        _awaySectionFourLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionFourLab;
}

- (UILabel *)awaySectionOTLab {
    if (!_awaySectionOTLab) {
        _awaySectionOTLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionOTLab;
}

- (UILabel *)awaySectionTotalLab{
    if (!_awaySectionTotalLab) {
        _awaySectionTotalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awaySectionTotalLab;
}

- (UILabel *)weekLab {
    if (!_weekLab) {
        _weekLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _weekLab;
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

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_F0F0F0;
    }
    return _bottomView;
}
- (NSMutableArray *)homeScoreArray {
    if (!_homeScoreArray) {
        _homeScoreArray = [NSMutableArray array];
    }
    return _homeScoreArray;
}

- (NSMutableArray *)awayScoreArray {
    if (!_awayScoreArray) {
        _awayScoreArray = [NSMutableArray array];
    }
    return _awayScoreArray;
}
@end
