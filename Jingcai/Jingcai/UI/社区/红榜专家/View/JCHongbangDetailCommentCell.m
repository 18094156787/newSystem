//
//  JCHongbangDetailCommentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailCommentCell.h"

@implementation JCHongbangDetailCommentCell

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.bgView = bgView;
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-28));
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
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(40));
    }];
    
    [bgView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.topView.mas_bottom).offset(AUTO(3));
        make.height.mas_equalTo(AUTO(40));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.topView addSubview:self.norq_Lab];
    [self.norq_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.centerY.equalTo(self.topView);
        make.width.mas_equalTo(AUTO(28));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [self.topView addSubview:self.norq_loseLab];
    [self.norq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-28));
        make.centerY.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.topView addSubview:self.norq_EqualLab];
    [self.norq_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.norq_loseLab.mas_left).offset(-6);
        make.centerY.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.topView addSubview:self.norq_WinLab];
    [self.norq_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.norq_EqualLab.mas_left).offset(-6);
        make.centerY.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.bottomView addSubview:self.rq_Lab];
    [self.self.rq_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.centerY.equalTo(self.bottomView);
        make.width.mas_equalTo(AUTO(28));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [self.bottomView addSubview:self.self.rq_loseLab];
    [self.rq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-28));
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.bottomView addSubview:self.rq_EqualLab];
    [self.rq_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rq_loseLab.mas_left).offset(-6);
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.bottomView addSubview:self.rq_WinLab];
    [self.rq_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rq_EqualLab.mas_left).offset(-6);
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    
    [bgView addSubview:self.resImageView];
    [self.resImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.awayImgView).offset(AUTO(15));
        make.width.height.mas_equalTo(60);
    }];
    
}

- (void)setMatchModel:(JCHongbangDetail_MatchModel *)matchModel {
    _matchModel = matchModel;
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
    };
    
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
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }else{
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }
    
    
    
    if (self.isBuy) {
        self.topView.hidden = YES;
        self.bottomView.hidden = YES;
    }else{
        self.topView.hidden = NO;
        self.bottomView.hidden = NO;
    }
    if (self.hideMatchRate) {
        self.topView.hidden = YES;
        self.bottomView.hidden = YES;
    }else{
//        self.topView.hidden = NO;
//        self.bottomView.hidden = NO;
        
        self.topView.hidden = matchModel.home_rate.count==0?YES:NO;
        self.bottomView.hidden = matchModel.away_rate.count==0?YES:NO;
//        if (matchModel.home_rate.count==0) {
            [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (matchModel.home_rate.count==0) {
                    make.height.mas_equalTo(0);
                }else{
                    make.height.mas_equalTo(AUTO(40));
                }
            }];
        
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            if (matchModel.away_rate.count==0) {
                make.height.mas_equalTo(0);
            }else{
                make.height.mas_equalTo(AUTO(40));
            }
        }];
//        }
        
        
    }
    

   
   
    
    NSString *no_rq_win = @"-";
    NSString *no_rq_eqal = @"-";
    NSString *no_rq_lose = @"-";
    
    NSString *rq_rq = @"-";
    NSString *rq_win = @"-";
    NSString *rq_eqal = @"-";
    NSString *rq_lose = @"-";
    
    self.norq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.norq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.norq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.rq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.rq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    
    
    
    if (matchModel.home_rate.count>=3) {
        no_rq_win = matchModel.home_rate[0];
        no_rq_eqal = matchModel.home_rate[1];
        no_rq_lose = matchModel.home_rate[2];
    }
    if (matchModel.away_rate.count>=3) {
        rq_rq = matchModel.away_rate[0];
        rq_win = matchModel.away_rate[1];
        rq_eqal = matchModel.away_rate[2];
        rq_lose = matchModel.away_rate[3];
    }
    
    self.norq_Lab.text = @"0";
    
    self.rq_Lab.text = rq_rq;
    self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",no_rq_win];
    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",no_rq_eqal];
    self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",no_rq_lose];
    self.rq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",rq_win];
    self.rq_EqualLab.text = [NSString stringWithFormat:@"平 %@",rq_eqal];
    self.rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",rq_lose];
    
    NSInteger spf1 = 0;
    NSInteger spf2 = 0;
    NSArray *spfArray = [matchModel.spf componentsSeparatedByString:@","];
    if (spfArray.count==1) {
        NSString *value1 = [NSString stringWithFormat:@"%@",spfArray.firstObject];
        spf1 = [value1 intValue];
    }
    if (spfArray.count==2) {
        NSString *value1 = [NSString stringWithFormat:@"%@",spfArray.firstObject];
        spf1 = [value1 intValue];
        NSString *value2 = [NSString stringWithFormat:@"%@",spfArray.lastObject];
        spf2 = [value2 intValue];
    }
        switch (spf1) {
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
            case 4:
            {
                self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 5:
            {
                self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;
            case 6:
            {
                self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;

            }


            break;

            default:
                break;
        }
    //    专家推荐
        switch (spf2) {
            case 1:
            {
                self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
//                self.norq_WinLab.textColor= JCWhiteColor;
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
            case 4:
            {
                self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 5:
            {
                self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;
            case 6:
            {
                self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;

            default:
                break;
        }
    NSInteger result1 = 0;
    NSInteger result2 = 0;
    NSArray *resultArray = [matchModel.spf_result componentsSeparatedByString:@","];
    if (resultArray.count==1) {
        NSString *value1 = [NSString stringWithFormat:@"%@",resultArray.firstObject];
        result1 = [value1 intValue];
    }
    if (resultArray.count==2) {
        NSString *value1 = [NSString stringWithFormat:@"%@",resultArray.firstObject];
        result1 = [value1 intValue];
        NSString *value2 = [NSString stringWithFormat:@"%@",resultArray.lastObject];
        result2 = [value2 intValue];
    }
        //开奖结果  根据 is_rq来区分
        switch (result1) {
            case 1:
            {
                [self.topView addSubview:self.tuijianImgView];
                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_WinLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];

            }

            break;
            case 2:
            {

                [self.topView addSubview:self.tuijianImgView];
                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.norq_EqualLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_EqualLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];

            }

            break;
            case 3:
            {

                [self.topView addSubview:self.tuijianImgView];
                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_loseLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];
            }

            break;
            case 4:
            {
                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 5:
            {

                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 6:
            {

                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
                
                

            }

            break;

            default:
                break;
        }
//        开奖结果
        switch (result2) {
            case 1:
            {

                
                [self.topView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 2:
            {

                
                [self.topView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                
                [self.topView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 4:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 5:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 6:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;

            default:
                break;
        }
    
    if (matchModel.matches.is_reverse==1) {
    #pragma mark //相反
        if (matchModel.matches.match_status>1&&matchModel.matches.match_status<10) {
            NSNumber *full_home_score = @(0);
            NSNumber *full_away_score = @(0);
            if (matchModel.matches.away_scores.count>0) {
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
        [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.matches.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];//
        if (matchModel.matches.away_team_logo.length>matchModel.matches.home_team_logo.length) {
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.bgView);
                make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
                make.height.mas_equalTo(AUTO(40));
            }];
        }else{
            [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.bgView);
                make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
                make.height.mas_equalTo(AUTO(40));
            }];
        }
        //赔率展示
        self.norq_Lab.text = @"0";
        
        if ([rq_rq integerValue]!=0) {
            rq_rq = [NSString stringWithFormat:@"%ld",[rq_rq integerValue]*-1];
            if ([rq_rq integerValue]>0) {
                rq_rq = [NSString stringWithFormat:@"+%@",rq_rq];
            }
            self.rq_Lab.text = rq_rq;
        }

        self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",no_rq_lose];

        self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",no_rq_win];
        self.rq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",rq_lose];        self.rq_EqualLab.text = [NSString stringWithFormat:@"平 %@",rq_eqal];
        self.rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",rq_win];
        
//        self.norq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        self.norq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        self.rq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        self.rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        
        //用户选中
//            switch (spf1) {
//                case 1:
//                {
//                    self.norq_loseLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 2:
//                {
//                    self.norq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 3:
//                {
//                    self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;//
//                }
//
//                break;
//                case 4:
//                {
//                    self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 5:
//                {
//                    self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
//
//                }
//
//                break;
//                case 6:
//                {
//                    self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;
//
//                }
//
//
//                break;
//
//                default:
//                    break;
//            }
//        //    专家推荐
//            switch (spf2) {
//                case 1:
//                {
//                    self.norq_loseLab.layer.borderColor = JCBaseColor.CGColor;//
//    //                self.norq_WinLab.textColor= JCWhiteColor;
//                }
//
//                break;
//                case 2:
//                {
//                    self.norq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 3:
//                {
//                    self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 4:
//                {
//                    self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
//                }
//
//                break;
//                case 5:
//                {
//                    self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;
//
//                }
//
//                break;
//                case 6:
//                {
//                    self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;//
//
//                }
//
//                break;
//
//                default:
//                    break;
//            }
//        //开奖结果 红勾
//        //开奖结果  根据 is_rq来区分
//        switch (result1) {
//            case 3:
//            {
//                [self.topView addSubview:self.tuijianImgView];
//                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                    make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
//                    make.centerY.equalTo(self.norq_WinLab);
//                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                }];
//
//            }
//
//            break;
//
//            case 1:
//            {
//
//                [self.topView addSubview:self.tuijianImgView];
//                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                    make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
//                    make.centerY.equalTo(self.norq_loseLab);
//                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                }];
//            }
//
//            break;
//            case 6:
//            {
//
//                [self.bottomView addSubview:self.tuijianImgView];
//                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.rq_WinLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//            }
//
//            break;
//            case 4:
//            {
//
//
//                [self.bottomView addSubview:self.tuijianImgView];
//                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.rq_loseLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//
//
//
//            }
//
//            break;
//
//            default:
//                break;
//        }
////        开奖结果
//        switch (result2) {
//            case 3:
//            {
//
//
//                [self.topView addSubview:self.tuijianImgView2];
//                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.norq_WinLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//
//            }
//
//
//
//            break;
//            case 1:
//            {
//
//
//                [self.topView addSubview:self.tuijianImgView2];
//                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.norq_loseLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//            }
//
//            break;
//            case 6:
//            {
//
//
//                [self.bottomView addSubview:self.tuijianImgView2];
//                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.rq_WinLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//            }
//
//
//            break;
//            case 4:
//            {
//
//
//                [self.bottomView addSubview:self.tuijianImgView2];
//                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
//                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
//                     make.centerY.equalTo(self.rq_loseLab);
//                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//                 }];
//
//            }
//
//            break;
//
//            default:
//                break;
//        }
    }
    

}

- (void)setModel:(JCWVerTjInfoMatchBall *)model {
    _model = model;
    NSString *title = [NSString stringWithFormat:@"%@  %@  %@",NonNil(model.leagueName),NonNil(model.matchInfo),NonNil(model.matchTime)];
    
    if (model.leagueName.length>0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.leagueName];
        [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        [attrTitle addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = title;
    }
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",model.classfly_desc];
    
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
    
    
    self.norq_Lab.text = NonNil(model.old_plBall.equal);
    
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
    
    

    
    self.homeNameLab.text = model.homeName;
    self.awayNameLab.text = model.awayName;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.homeLogo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.awayLogo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if (model.homeName.length>model.awayName.length) {
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }else{
        [self.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(8));
            make.height.mas_equalTo(AUTO(40));
        }];
    }
    
    
    
    if (self.isBuy) {
        self.topView.hidden = YES;
        self.bottomView.hidden = YES;
    }else{
        self.topView.hidden = NO;
        self.bottomView.hidden = NO;
    }
    if (self.hideMatchRate) {
        self.topView.hidden = YES;
        self.bottomView.hidden = YES;
    }else{
        self.topView.hidden = NO;
        self.bottomView.hidden = NO;
    }
    

    self.norq_Lab.text = @"0";
    self.rq_Lab.text = model.rold_plBall.rq;
//    self.homeLab.text = model.homeName;
//    self.awayLab.text = model.awayName;
    self.norq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",NonNil(model.old_plBall.win)];
    self.norq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
    self.norq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",NonNil(model.old_plBall.lose)];
    self.rq_WinLab.text = [NSString stringWithFormat:@"主胜 %@",NonNil(model.rold_plBall.win)];
    self.rq_EqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.rold_plBall.equal)];
    self.rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",NonNil(model.rold_plBall.lose)];
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
            case 4:
            {
                self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 5:
            {
                self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;
            case 6:
            {
                self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;

            default:
                break;
        }
    //    专家推荐
        switch ([model.spf_new2 integerValue]) {
            case 1:
            {
                self.norq_WinLab.layer.borderColor = JCBaseColor.CGColor;
//                self.norq_WinLab.textColor= JCWhiteColor;
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
            case 4:
            {
                self.rq_WinLab.layer.borderColor = JCBaseColor.CGColor;
            }

            break;
            case 5:
            {
                self.rq_EqualLab.layer.borderColor = JCBaseColor.CGColor;

            }

            break;
            case 6:
            {
                self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;

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
                    make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_WinLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];

            }

            break;
            case 2:
            {

                [self.topView addSubview:self.tuijianImgView];
                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.norq_EqualLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_EqualLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];

            }

            break;
            case 3:
            {

                [self.topView addSubview:self.tuijianImgView];
                [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
                    make.centerY.equalTo(self.norq_loseLab);
                    make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                }];
            }

            break;
            case 4:
            {
                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 5:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 6:
            {

                
                [self.topView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
                
                

            }

            break;

            default:
                break;
        }
//        开奖结果
        switch ([model.spf_result2 integerValue]) {
            case 1:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 2:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.norq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.norq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 4:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 5:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 6:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;

            default:
                break;
        }
    
    //注:当model.is_rq==2的时候,model.spf_result只会返回1,2.3 但这时候表示的是让球的1,2,3 .也就是说,1,2,3判断的是底部那排让球的数据
    if ([model.is_rq integerValue]==2) {
            //开奖结果
        switch ([model.spf_result integerValue]) {

            case 1:
            {

                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 2:
            {

                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                
                [self.bottomView addSubview:self.tuijianImgView];
                 [self.tuijianImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;

            default:
                break;
        }

        switch ([model.spf_result2 integerValue]) {

            case 1:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_WinLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_WinLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];
            }

            break;
            case 2:
            {

                
                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_EqualLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_EqualLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;
            case 3:
            {

                [self.bottomView addSubview:self.tuijianImgView2];
                 [self.tuijianImgView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(self.rq_loseLab).offset(AUTO(5));
                     make.centerY.equalTo(self.rq_loseLab);
                     make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
                 }];

            }

            break;

            default:
                break;
        }
    }
    

}

- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",tjInfoDetailBall.classfly_desc];
    if (self.hideMatchRate) {
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }

}




//- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
//    _tjInfoDetailBall = tjInfoDetailBall;
//    if (tjInfoDetailBall.wl==0) {
//        self.scoreLab.text = @"VS";
//        self.statusLab.text = @"未开始";
//    };
//    if (tjInfoDetailBall.wl==1) {
//                self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",self.model.full_home_score,self.model.full_away_score];
//        self.statusLab.text = @"进行中";
//    };
//    if (tjInfoDetailBall.wl==2) {
//        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",self.model.full_home_score,self.model.full_away_score];
//        self.statusLab.text = @"已结束";
//    };
//
//
//}



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
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeNameLab.numberOfLines = 2;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}

- (UILabel *)norq_Lab {
    if (!_norq_Lab) {
        _norq_Lab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        [_norq_Lab hg_setAllCornerWithCornerRadius:AUTO(14)];
        _norq_Lab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_Lab.layer.borderWidth = 1;
        _norq_Lab.layer.masksToBounds = YES;
        _norq_Lab.layer.cornerRadius = AUTO(14);
    }
    return _norq_Lab;
}

- (UILabel *)norq_WinLab {
    if (!_norq_WinLab) {
        _norq_WinLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_WinLab.layer.borderWidth = 1;
        _norq_WinLab.layer.masksToBounds = YES;
        _norq_WinLab.layer.cornerRadius = AUTO(14);
    }
    return _norq_WinLab;
}

- (UILabel *)norq_EqualLab {
    if (!_norq_EqualLab) {
        _norq_EqualLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_EqualLab.layer.borderWidth = 1;
        _norq_EqualLab.layer.masksToBounds = YES;
        _norq_EqualLab.layer.cornerRadius = AUTO(14);
    }
    return _norq_EqualLab;
}

- (UILabel *)norq_loseLab {
    if (!_norq_loseLab) {
        _norq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _norq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _norq_loseLab.layer.borderWidth = 1;
        _norq_loseLab.layer.masksToBounds = YES;
        _norq_loseLab.layer.cornerRadius = AUTO(14);
    }
    return _norq_loseLab;
}

- (UILabel *)rq_Lab {
    if (!_rq_Lab) {
        _rq_Lab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_Lab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _rq_Lab.layer.borderWidth = 1;
        _rq_Lab.layer.masksToBounds = YES;
        _rq_Lab.layer.cornerRadius = AUTO(14);
    }
    return _rq_Lab;
}

- (UILabel *)rq_WinLab {
    if (!_rq_WinLab) {
        _rq_WinLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_WinLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _rq_WinLab.layer.borderWidth = 1;
        _rq_WinLab.layer.masksToBounds = YES;
        _rq_WinLab.layer.cornerRadius = AUTO(14);
    }
    return _rq_WinLab;
}

- (UILabel *)rq_EqualLab {
    if (!_rq_EqualLab) {
        _rq_EqualLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_EqualLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _rq_EqualLab.layer.borderWidth = 1;
        _rq_EqualLab.layer.masksToBounds = YES;
        _rq_EqualLab.layer.cornerRadius = AUTO(14);
    }
    return _rq_EqualLab;
}

- (UILabel *)rq_loseLab {
    if (!_rq_loseLab) {
        _rq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _rq_loseLab.layer.borderWidth = 1;
        _rq_loseLab.layer.masksToBounds = YES;
        _rq_loseLab.layer.cornerRadius = AUTO(14);
    }
    return _rq_loseLab;
}

- (UIImageView *)tuijianImgView {
    if (!_tuijianImgView) {
        _tuijianImgView = [UIImageView new];
        _tuijianImgView.image = JCIMAGE(@"yuce_select_selected");
    }
    return _tuijianImgView;
}

- (UIImageView *)tuijianImgView2 {
    if (!_tuijianImgView2) {
        _tuijianImgView2 = [UIImageView new];
        _tuijianImgView2.image = JCIMAGE(@"yuce_select_selected");//
    }
    return _tuijianImgView2;
}

- (UIImageView *)resImageView {
    if (!_resImageView) {
        _resImageView = [UIImageView new];
        _resImageView.hidden = YES;
    }
    return _resImageView;
}

@end
