//
//  JCHongbangDetailOtherCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailOtherCell.h"

@implementation JCHongbangDetailOtherCell

- (void)initViews {
    self.backgroundColor= COLOR_F4F6F9;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [bgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(70));
        make.top.offset(AUTO(37));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [bgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-70));
        make.top.offset(AUTO(37));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeImgView);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    [bgView addSubview:self.vsImgView];
    [self.vsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.centerX.equalTo(self.scoreLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(13)));
    }];
    
    [bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.scoreLab.mas_bottom);
    }];
    
    [bgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.homeImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    [bgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_greaterThanOrEqualTo(AUTO(21));
    }];
    
    [bgView addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(40));
    }];

    
    [self.topView addSubview:self.norq_Lab];
    [self.norq_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(35));
        make.centerY.equalTo(self.topView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.topView addSubview:self.norq_loseLab];
    [self.norq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-20));
        make.centerY.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(125), AUTO(40)));
    }];

    
    [self.topView addSubview:self.norq_WinLab];
    [self.norq_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.norq_loseLab.mas_left).offset(-6);
        make.centerY.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(125), AUTO(40)));
        
    }];
    
    [bgView addSubview:self.priceInfoView];
    [self.priceInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.mas_equalTo(0);
        make.bottom.offset(AUTO(-10));
    }];
    
    [bgView addSubview:self.resImageView];
    [self.resImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.awayImgView).offset(AUTO(15));
        make.width.height.mas_equalTo(60);
    }];
//
//    [self.priceInfoView addSubview:self.hongbiImgView];
//    [self.hongbiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.centerY.equalTo(self.priceInfoView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(20)));
//    }];
//
//    [self.priceInfoView addSubview:self.priceLab];
//    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.hongbiImgView.mas_right).offset(2);
//        make.centerY.equalTo(self.priceInfoView);
//    }];
//
//    [self.priceInfoView addSubview:self.refundLab];
//    [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.priceLab.mas_right).offset(3);
//        make.centerY.equalTo(self.priceInfoView);
//    }];
//
//    [self.priceInfoView addSubview:self.payStatusLab];
//    [self.payStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-15));
//        make.centerY.equalTo(self.priceInfoView);
//    }];
    
}


- (void)setMatchModel:(JCHongbangDetail_MatchModel *)matchModel {
    _matchModel = matchModel;
//    matchModel.matches.is_reverse = 1;

    NSString *title = NonNil(matchModel.matches.competition_name);
    if (matchModel.matches.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" %@",NonNil(matchModel.matches.group_num_new)];
    }
    if (matchModel.matches.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@",NonNil(matchModel.matches.round_num_two)];
    }


    if (matchModel.matches.match_long_time.length>0) {
        title = [title stringByAppendingFormat:@" %@",NonNil(matchModel.matches.match_long_time)];
    }
    if (matchModel.matches.round_num_one.length>0) {
        title = [title stringByAppendingFormat:@" | %@",NonNil(matchModel.matches.round_num_one)];
    }
    
    
    if (matchModel.matches.competition_name.length>0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:matchModel.matches.competition_name];
        [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        [attrTitle addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = title;
    }

    
    if ([matchModel.classfly integerValue]==2) {
        self.tagLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = COLOR_002868.CGColor;
        self.tagLab.textColor = COLOR_002868;
        self.tagLab.text = [NSString stringWithFormat:@"  让球  "];
    }else if([matchModel.classfly integerValue]==3){
        self.tagLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.tagLab.textColor = COLOR_30B27A;
        self.tagLab.text = [NSString stringWithFormat:@"  进球数  "];
    }else{
        self.tagLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = JCBaseColor.CGColor;
        self.tagLab.textColor = JCBaseColor;
        self.tagLab.text = [NSString stringWithFormat:@"  竞足  "];
    }
    

    
    self.resImageView.hidden = YES;
        if (self.matchModel.isResultWin) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
            [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.width.height.mas_equalTo(60);
             }];

        }
        if (self.matchModel.isResultLose) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
            [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.width.height.mas_equalTo(60);
             }];
        }
        if (self.matchModel.isResultWater) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];
            [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.width.height.mas_equalTo(60);
             }];
 
        }
        if (self.matchModel.isYanqi) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_yq"];
            [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.width.height.mas_equalTo(110);
             }];

        }
        if (self.matchModel.isQuXiao) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_qc"];
            [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.width.height.mas_equalTo(110);
             }];

        }
    
    

    self.statusLab.text = matchModel.matches.match_status_desc;
    if (matchModel.matches.match_status>1&&matchModel.matches.match_status<10) {
        NSNumber *full_home_score = @(0);
        NSNumber *full_away_score = @(0);
        if (matchModel.matches.home_scores.count>0) {
            full_home_score = matchModel.matches.home_scores.firstObject;
        }
        if (matchModel.matches.away_scores.count>0) {
            full_away_score = matchModel.matches.away_scores.firstObject;
        }

        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",full_home_score,full_away_score];
    }else{

        self.scoreLab.text = @"VS";
    }
    
    
    
    
    self.homeNameLab.text = matchModel.matches.home_team_name;
    self.awayNameLab.text = matchModel.matches.away_team_name;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.matches.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.matches.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    
    if (matchModel.matches.home_team_name.length>matchModel.matches.away_team_name.length) {
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }else {
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }
    
    if (self.isBuy) {
        self.topView.hidden = YES;
    }else{
        self.topView.hidden = NO;
    }
    if (self.hideMatchRate) {
        self.topView.hidden = YES;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        self.topView.hidden = NO;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(40));
        }];
    }
    
    NSString *no_rq_win = @"-";
    NSString *no_rq_eqal = @"-";
    NSString *no_rq_lose = @"-";
    
    
    
    
    
    if (matchModel.home_rate.count>=3) {
        no_rq_eqal = matchModel.home_rate[0];
        no_rq_win = matchModel.home_rate[1];
        no_rq_lose = matchModel.home_rate[2];
    }


    
    if ([matchModel.classfly integerValue]==3) {
            self.norq_WinLab.text = [NSString stringWithFormat:@"大球 %@",no_rq_win];
        //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
        self.norq_Lab.text = no_rq_eqal;
            self.norq_loseLab.text = [NSString stringWithFormat:@"小球 %@",no_rq_lose];
    }else{
            self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",no_rq_win];
        //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
        self.norq_Lab.text = no_rq_eqal;
            self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",no_rq_lose];
    }
        switch ([matchModel.spf integerValue]) {
            case 1:
            {
                self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 2:
            {
                self.norq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 3:
            {
                self.norq_loseLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;



            default:
                break;
        }

        
        
//        //开奖结果  根据 is_rq来区分
        switch ([matchModel.spf_result integerValue]) {
            case 1:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_WinLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 2:
            {

                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_EqualLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_loseLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;


            default:
                break;
        }
    
#pragma mark//相反
    if (matchModel.matches.is_reverse==1) {
        if (matchModel.matches.match_status>1&&matchModel.matches.match_status<10) {
            NSNumber *full_home_score = @(0);
            NSNumber *full_away_score = @(0);
            if (matchModel.matches.home_scores.count>0) {
                full_home_score = matchModel.matches.away_scores.firstObject;
            }
            if (matchModel.matches.home_scores.count>0) {
                full_away_score = matchModel.matches.home_scores.firstObject;
            }

            self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",full_home_score,full_away_score];
        }else{

            self.scoreLab.text = @"VS";
        }
        
        self.homeNameLab.text = matchModel.matches.away_team_name;
        self.awayNameLab.text = matchModel.matches.home_team_name;//
        [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.matches.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
        [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.matches.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];//home_team_name
        
        if (matchModel.matches.away_team_name.length>matchModel.matches.home_team_name.length) {
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.contentView);
                make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
                make.height.mas_equalTo(AUTO(40));
            }];
        }else {
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.contentView);
                make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
                make.height.mas_equalTo(AUTO(40));
            }];
        }
        
        if ([matchModel.classfly integerValue]==3) {//
                self.norq_WinLab.text = [NSString stringWithFormat:@"大球 %@",no_rq_lose];
            //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
            self.norq_Lab.text = no_rq_eqal;
                self.norq_loseLab.text = [NSString stringWithFormat:@"小球 %@",no_rq_win];
        }else{
                self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",no_rq_lose];
            //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
            self.norq_Lab.text = no_rq_eqal;
                self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",no_rq_win];
        }
        
        
        // 用户选择
        self.norq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.norq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.norq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        
        
            switch ([matchModel.spf integerValue]) {
                case 3:
                {
                    self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
                }

                break;
                case 2:
                {
                    self.norq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
                }

                break;
                case 1:
                {
                    self.norq_loseLab.layer.borderColor = JCBaseColor.CGColor;
                }

                break;



                default:
                    break;
            }
        
        //        //开奖结果  红色勾选
                switch ([matchModel.spf_result integerValue]) {
                    case 3:
                    {

                        
                        [self.topView addSubview:self.tuijianImgView];
                         [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.left.equalTo(self.norq_WinLab).offset(AUTO(15));
                             make.centerY.equalTo(self.norq_WinLab);
                             make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                         }];

                    }

                    break;
                    case 2:
                    {

                        [self.topView addSubview:self.tuijianImgView];
                         [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.left.equalTo(self.norq_EqualLab).offset(AUTO(15));
                             make.centerY.equalTo(self.norq_EqualLab);
                             make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                         }];

                    }

                    break;
                    case 1:
                    {

                        
                        [self.topView addSubview:self.tuijianImgView];
                         [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.left.equalTo(self.norq_loseLab).offset(AUTO(15));
                             make.centerY.equalTo(self.norq_loseLab);
                             make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                         }];
                    }

                    break;


                    default:
                        break;
                }


    }
    

    
   
}

- (void)setModel:(JCWVerTjInfoMatchBall *)model {
    _model = model;

    NSString *title = @"";
    if (model.matchInfo.length>0) {
        title = [NSString stringWithFormat:@"%@ %@ %@",NonNil(model.leagueName),NonNil(model.matchInfo),NonNil(model.matchTime)];
    }else{
        title = [NSString stringWithFormat:@"%@ %@",NonNil(model.leagueName),NonNil(model.matchTime)];
    }
    
    if (model.leagueName.length>0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.leagueName];
        [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        [attrTitle addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = title;
    }
    
    
    self.norq_Lab.text = NonNil(model.old_plBall.equal);
    self.tagLab.text = [NSString stringWithFormat:@" %@ ",model.classfly_desc];
    if (model.classfly==2) {
        self.tagLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = COLOR_002868.CGColor;
        self.tagLab.textColor = COLOR_002868;
    }else if(model.classfly==3){
        self.tagLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.tagLab.textColor = COLOR_30B27A;
    }else{
        self.tagLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.tagLab.layer.borderColor = JCBaseColor.CGColor;
        self.tagLab.textColor = JCBaseColor;
    }
    if (model.homeName.length<model.awayName.length) {
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }


    
    self.statusLab.text = model.matchStatus_desc;
        if (model.matchStatus==2||model.matchStatus==3) {
    //        self.scoreLab.hidden = NO;
    //        self.vsImgView.hidden = YES;
            self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",self.model.full_home_score,self.model.full_away_score];
        }else{
    //        self.scoreLab.hidden = YES;
    //        self.vsImgView.hidden = NO;
            self.scoreLab.text = @"VS";
        }
    
    
       self.resImageView.hidden = YES;
           if (self.model.isResultWin) {
               self.resImageView.hidden = NO;
               self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
               [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(60);
                }];

           }
           if (self.model.isResultLose) {
               self.resImageView.hidden = NO;
               self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
               [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(60);
                }];

           }
           if (self.model.isResultWater) {
               self.resImageView.hidden = NO;
               self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];
               [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(60);
                }];
    
           }
           if (self.model.isYanqi) {
               self.resImageView.hidden = NO;
               self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_yq"];
               [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(110);
                }];

           }
           if (self.model.isQuXiao) {
               self.resImageView.hidden = NO;
               self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_qc"];
               [self.resImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.height.mas_equalTo(110);
                }];

           }
    
    
    
    
    self.homeNameLab.text = model.homeName;
    self.awayNameLab.text = model.awayName;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.homeLogo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.awayLogo] placeholderImage:JCIMAGE(@"away_placeholder")];


    if (self.isBuy) {
        self.topView.hidden = YES;
    }else{
        self.topView.hidden = NO;
    }
    if (self.hideMatchRate) {
        self.topView.hidden = YES;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        self.topView.hidden = NO;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(40));
        }];
    }


    
    if (model.classfly==3) {
            self.norq_WinLab.text = [NSString stringWithFormat:@"大球 %@",NonNil(model.old_plBall.win)];
        //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
            self.norq_loseLab.text = [NSString stringWithFormat:@"小球 %@",NonNil(model.old_plBall.lose)];
    }else{
            self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",NonNil(model.old_plBall.win)];
        //    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
            self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",NonNil(model.old_plBall.lose)];
    }
        switch ([model.spf_new integerValue]) {
            case 1:
            {
                self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 2:
            {
                self.norq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 3:
            {
                self.norq_loseLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;



            default:
                break;
        }

        
        
        //开奖结果  根据 is_rq来区分
        switch ([model.spf_result integerValue]) {
            case 1:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_WinLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 2:
            {

                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_EqualLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_loseLab).offset(AUTO(15));
                     make.centerY.equalTo(self.norq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;


            default:
                break;
        }


}
- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    self.priceLab.text = tjInfoDetailBall.sf;
    self.refundLab.hidden = tjInfoDetailBall.refund==0?YES:NO;
//    self.tagLab.text = [NSString stringWithFormat:@" %@ ",tjInfoDetailBall.classfly_desc];
//    if (tjInfoDetailBall.classfly==2) {
//        self.tagLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
//        self.tagLab.layer.borderColor = COLOR_002868.CGColor;
//        self.tagLab.textColor = COLOR_002868;
//    }else if(tjInfoDetailBall.classfly==3){
//        self.tagLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
//        self.tagLab.layer.borderColor = COLOR_30B27A.CGColor;
//        self.tagLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
//        self.tagLab.layer.borderColor = JCBaseColor.CGColor;
//        self.tagLab.textColor = JCBaseColor;
//    }
//
////    if (tjInfoDetailBall.is_ai&&tjInfoDetailBall.is_pay!=1) {
////        self.priceInfoView.hidden = NO;
////        [self.priceInfoView mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.height.mas_equalTo(AUTO(40));
////            make.bottom.offset(0);
////        }];
////        self.priceLab.text = tjInfoDetailBall.sf;
////        self.refundLab.text = tjInfoDetailBall.out_info.length>0?@"不中返还":@"";
////
////    }else {
////        self.priceInfoView.hidden = YES;
////    }
////    if (tjInfoDetailBall.refund_desc.length>0) {
////        self.payStatusLab.text = tjInfoDetailBall.refund_desc;
////        self.payStatusLab.textColor = COLOR_13AE13;;
////    }else {
////        if (tjInfoDetailBall.is_pay==2) {
////            self.payStatusLab.textColor = JCBaseColor;
////            NSString *price = [NSString stringWithFormat:@"实付：%@红币",tjInfoDetailBall.deal_total];
////            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
////            NSRange range = [price rangeOfString:@"实付："];
////            NSRange range1 = [price rangeOfString:@"红币"];
////            if (range.location!=NSNotFound) {
////                [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_999999} range:range];
////                [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)]} range:range1];
////            }
////            self.payStatusLab.attributedText = attr;
////        }else{
////            self.payStatusLab.text = @"";
////        }
////
////    }
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.borderColor = JCBaseColor.CGColor;
        _tagLab.layer.cornerRadius = AUTO(8);
        _tagLab.layer.masksToBounds = YES;
    }
    return _tagLab;
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
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

-(UIImageView *)vsImgView {
    if (!_vsImgView) {
        _vsImgView = [UIImageView new];
        _vsImgView.image = JCIMAGE(@"icon_vs");
        _vsImgView.hidden = YES;
    }
    return _vsImgView;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeNameLab.numberOfLines = 2;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayNameLab.numberOfLines = 2;
    }
    return _awayNameLab;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}

- (UILabel *)norq_Lab {
    if (!_norq_Lab) {
        _norq_Lab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_Lab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_Lab.layer.borderWidth = 1;
        _norq_Lab.layer.masksToBounds = YES;
        _norq_Lab.layer.cornerRadius = AUTO(19);

    }
    return _norq_Lab;
}

- (UILabel *)norq_WinLab {
    if (!_norq_WinLab) {
        _norq_WinLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        [_norq_WinLab hg_setAllCornerWithCornerRadius:AUTO(4)];
        _norq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_WinLab.layer.borderWidth = 1;
        _norq_WinLab.layer.masksToBounds = YES;
        _norq_WinLab.layer.cornerRadius = AUTO(19);
    }
    return _norq_WinLab;
}

- (UILabel *)norq_EqualLab {
    if (!_norq_EqualLab) {
        _norq_EqualLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_EqualLab.layer.borderWidth = 1;
        _norq_EqualLab.layer.masksToBounds = YES;
        _norq_EqualLab.layer.cornerRadius = AUTO(19);
    }
    return _norq_EqualLab;
}

- (UILabel *)norq_loseLab {
    if (!_norq_loseLab) {
        _norq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_loseLab.layer.borderWidth = 1;
        _norq_loseLab.layer.masksToBounds = YES;
        _norq_loseLab.layer.cornerRadius = AUTO(19);
    }
    return _norq_loseLab;
}


- (UIImageView *)tuijianImgView {
    if (!_tuijianImgView) {
        _tuijianImgView = [UIImageView new];
        _tuijianImgView.image = JCIMAGE(@"yuce_select_selected");
    }
    return _tuijianImgView;
}

- (UIView *)priceInfoView {
    if (!_priceInfoView) {
        _priceInfoView = [UIView new];
    }
    return _priceInfoView;
}

- (UIImageView *)hongbiImgView {
    if (!_hongbiImgView) {
        _hongbiImgView = [UIImageView new];
        _hongbiImgView.image = JCIMAGE(@"icon_hongbi");
    }
    return _hongbiImgView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)refundLab {
    if (!_refundLab) {
        _refundLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _refundLab;
}

- (UILabel *)payStatusLab {
    if (!_payStatusLab) {
        _payStatusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _payStatusLab;
}

- (UIImageView *)resImageView {
    if (!_resImageView) {
        _resImageView = [UIImageView new];
        _resImageView.hidden = YES;
    }
    return _resImageView;
}

@end
