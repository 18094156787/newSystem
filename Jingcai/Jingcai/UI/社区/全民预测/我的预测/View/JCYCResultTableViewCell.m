//
//  JCYCResultTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCResultTableViewCell.h"

@implementation JCYCResultTableViewCell
- (void)initViews {
    self.contentView.backgroundColor = JCClearColor;
    self.backgroundColor = JCClearColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(10), 0));
    }];
    
    [bgView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(52), AUTO(52)));
    }];
    
    [bgView addSubview:self.statusImgView];
    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(114), AUTO(86)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(12));
        make.centerX.equalTo(bgView);
        make.width.mas_equalTo(AUTO(50));
//        make.height.mas_equalTo(AUTO(18));
    }];
    
    [bgView addSubview:self.masterNameLab];
    [self.masterNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.right.equalTo(self.infoLab.mas_left);
        make.width.mas_equalTo(AUTO(100));
        make.left.offset(15);
    }];
    
    [bgView addSubview:self.customerNameLab];
    [self.customerNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.left.equalTo(self.infoLab.mas_right);
        make.right.offset(-15);
    }];

        [bgView addSubview:self.masterView];
        [self.masterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.height.mas_equalTo(AUTO(30));
            make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(12));
    //        make.bottom.offset(0);
        }];
        
        [self.masterView addSubview:self.masterWin_normalBtn];
        [self.masterWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.right.equalTo(self.mas_centerX).offset(AUTO(-35));
            make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
        }];

        [self.masterView addSubview:self.normalInfoLab];
        [self.normalInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.masterWin_normalBtn);
            make.right.equalTo(self.masterWin_normalBtn.mas_left).offset(AUTO(-5));
            make.size.mas_equalTo(CGSizeMake(AUTO(28), AUTO(28)));
        }];

        
        [self.masterView addSubview:self.equal_normalBtn];
        [self.equal_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.masterWin_normalBtn);
            make.left.equalTo(self.masterWin_normalBtn.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
        }];
        
        [self.masterView addSubview:self.customerWin_normalBtn];
        [self.customerWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.masterWin_normalBtn);
            make.left.equalTo(self.equal_normalBtn.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
        }];
    

        [bgView addSubview:self.anotherView];
        [self.anotherView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.height.mas_equalTo(AUTO(30));
            make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
            make.bottom.offset(AUTO(-10));
        }];
        
        [self.anotherView addSubview:self.anotherInfoLab];
        [self.anotherInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.normalInfoLab);
            make.top.offset(0);
            make.size.mas_equalTo(CGSizeMake(AUTO(28), AUTO(28)));
        }];

        
        [self.anotherView addSubview:self.masterWin_anotherBtn];
        [self.masterWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.masterWin_normalBtn);
            make.top.offset(0);
            make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
        }];
        
        [self.anotherView addSubview:self.equal_anotherBtn];
         [self.equal_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.equal_normalBtn);
             make.top.offset(0);
             make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
         }];
        
        [self.anotherView addSubview:self.customerWin_anotherBtn];
         [self.customerWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.customerWin_normalBtn);
             make.top.offset(0);
             make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    //         make.bottom.offset(AUTO(-15));
         }];

//
//    [bgView addSubview:self.haveJingCaiView];
//    [self.haveJingCaiView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleLab);
//        make.right.offset(AUTO(-10));
//        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(72)));
//    }];
//
//    UIImageView *haveJCview = [UIImageView new];
//    [self.haveJingCaiView addSubview:haveJCview];
//    haveJCview.image = JCIMAGE(@"yuce_yjc");
//    [haveJCview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//
//    }];
    
//    [self data];
}



- (void)setModel:(JCJingCaiResultMatchModel *)model {
    _model = model;
//        JCJingCaiResultInfoMatchModel *resultModel = model.match_info;
        JCJingCaiResultInfoMatchModel *matchInfoModel = model.match_info;
        
        NSString *title = [NSString stringWithFormat:@"%@ | %@ ",matchInfoModel.competition_name,matchInfoModel.match_long_time];
        if (matchInfoModel.issue_num.length>0) {
         title = [NSString stringWithFormat:@"%@ | %@ | %@ ",matchInfoModel.competition_name,NonNil(matchInfoModel.issue_num),matchInfoModel.match_long_time];
        }
        if (matchInfoModel.competition_name.length>0) {
                NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
            NSRange eventRange = [title rangeOfString:matchInfoModel.competition_name];
            [attrTitle addAttribute:NSForegroundColorAttributeName value:COLOR_4A90E2 range:eventRange];
            self.titleLab.attributedText = attrTitle;
            
        }else{
            self.titleLab.text = title;
        }
        
        if (model.wl>0&&model.wl<5) {
            if (matchInfoModel.home_scores.count>0&&matchInfoModel.away_scores.count>0) {
                NSString *home = [NSString stringWithFormat:@"%@",matchInfoModel.home_scores.firstObject];
                NSString *away = [NSString stringWithFormat:@"%@",matchInfoModel.away_scores.firstObject];
                self.infoLab.text = [NSString stringWithFormat:@"%@ : %@",home,away];
                self.infoLab.textColor = JCBaseColor;
            }else {
                self.infoLab.text = @"VS";
                self.infoLab.textColor = COLOR_333333;
            }
           
        }else{
            self.infoLab.text = @"VS";
            self.infoLab.textColor = COLOR_333333;
        }
        
        
        self.masterNameLab.text = matchInfoModel.home_team_name;
        self.customerNameLab.text = matchInfoModel.away_team_name;
        
        //主赔
        NSString *noRq_rq = @"";
        NSString *noRq_win = @"";
        NSString *noRq_eqal = @"";
        NSString *noRq_lose = @"";
        //让球赔率
        NSString *rq_rq = @"";
        NSString *rq_win = @"";
        NSString *rq_eqal = @"";
        NSString *rq_lose = @"";
    
//    //self.is_result yes用的地方是每日开奖
//    if (self.is_result) {
//        model.home_rate = [model.odds_spf componentsSeparatedByString:@","];
//        model.away_rate = [model.odds_rq componentsSeparatedByString:@","];
//    }
    
    if (model.home_rate.count==3) {
        //如果只有3个,则旧数据少了个非让球
        NSMutableArray *array = [NSMutableArray arrayWithArray:model.home_rate];
        [array insertObject:@"0" atIndex:0];
        model.home_rate = [NSArray arrayWithArray:array];
    }
    if (model.away_rate.count==3) {
        //如果只有3个,则旧数据少了个让球
        NSMutableArray *array = [NSMutableArray arrayWithArray:model.away_rate];
        [array insertObject:@"0" atIndex:0];
        model.away_rate = [NSArray arrayWithArray:array];
    }
    
        if (model.home_rate.count>=4) {
            noRq_rq = model.home_rate.firstObject;
            noRq_win = model.home_rate[1];
            noRq_eqal = model.home_rate[2];
            noRq_lose = model.home_rate[3];
        }
        if (model.away_rate.count>=4) {
            rq_rq = model.away_rate.firstObject;
            rq_win = model.away_rate[1];
            rq_eqal = model.away_rate[2];
            rq_lose = model.away_rate[3];
        }
        
        
        
        
        self.normalInfoLab.text = noRq_rq;
        
        if ([rq_rq intValue]>0) {
            NSString *title = [NSString stringWithFormat:@"%@",rq_rq];
            self.anotherInfoLab.textColor = JCBaseColor;
            self.anotherInfoLab.text = title;
        }else{
            self.anotherInfoLab.textColor = COLOR_666666;
            self.anotherInfoLab.text = rq_rq;
        }

            if (noRq_win.length==0) {
                [self.masterWin_normalBtn setTitle:@"-" forState:0];
            }else{
                [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜 %@",noRq_win] forState:0];
            }
            if (noRq_eqal.length==0) {
                [self.equal_normalBtn setTitle:@"-" forState:0];
            }else{
                [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"平 %@",noRq_eqal] forState:0];

            }
            if (noRq_lose.length==0) {
                [self.customerWin_normalBtn setTitle:@"-" forState:0];
            }else{
                [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜 %@",noRq_lose] forState:0];
            }
            if (rq_win.length==0) {
                [self.masterWin_anotherBtn setTitle:@"-" forState:0];
            }else{
                [self.masterWin_anotherBtn setTitle:[NSString stringWithFormat:@"主胜 %@",rq_win] forState:0];
            }
            if (rq_eqal.length==0) {
                [self.equal_anotherBtn setTitle:@"-" forState:0];
            }else{
                [self.equal_anotherBtn setTitle:[NSString stringWithFormat:@"平 %@",rq_eqal] forState:0];
            }
            if (rq_lose.length==0) {
                [self.customerWin_anotherBtn setTitle:@"-" forState:0];
            }else{
                [self.customerWin_anotherBtn setTitle:[NSString stringWithFormat:@"客胜 %@",rq_lose] forState:0];
            }
        

        
        self.resultImgView.hidden = YES;
        self.statusImgView.hidden = YES;
        if (model.wl==1||model.wl==3) {
            self.resultImgView.hidden = NO;
            self.resultImgView.image = JCIMAGE(@"yc_list_hong");

        }
        if (model.wl==2||model.wl==4) {
            self.resultImgView.hidden = NO;
            self.resultImgView.image = JCIMAGE(@"yc_list_hei");

        }
        if (model.wl==6) {
            self.resultImgView.hidden = NO;
            self.resultImgView.image = JCIMAGE(@"yc_list_yq");

        }
        if (model.wl==7) {
            self.resultImgView.hidden = NO;
            self.resultImgView.image = JCIMAGE(@"yc_list_qx");

        }
        
        /*重置按钮的选中状态，避免复用问题*/
        self.masterWin_normalBtn.selected = NO;
        self.equal_normalBtn.selected = NO;
        self.customerWin_normalBtn.selected = NO;
    
        self.masterWin_anotherBtn.selected = NO;
        self.equal_anotherBtn.selected = NO;
        self.customerWin_anotherBtn.selected = NO;
        
        self.masterWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.equal_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.customerWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.masterWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.equal_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.customerWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        
        
    
            //用户选择的
            NSArray *userSelectArray = model.spf;
            [userSelectArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSInteger value = [obj integerValue];
                if (value==1) {
                   self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                }
                if (value==2) {
                   self.equal_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                }
                if (value==3) {
                   self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                }
                if (value==4) {
                   self.masterWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                }
                if (value==5) {
                   self.equal_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                }
                if (value==6) {
                   self.customerWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                }
            }];

        //开奖结果
    NSArray *spf_result = (NSArray *)model.spf_result;
        if (spf_result.count==1) {
            
            NSString *obj = spf_result.firstObject;
            
            NSInteger value = [obj integerValue];
             if (value==1) {
                 self.masterWin_normalBtn.selected = YES;
             }
             if (value==2) {
                self.equal_normalBtn.selected = YES;
             }
             if (value==3) {
                self.customerWin_normalBtn.selected = YES;
             }
             if (value==4) {
                self.masterWin_anotherBtn.selected = YES;
             }
             if (value==5) {
                self.equal_anotherBtn.selected = YES;
             }
             if (value==6) {
                self.customerWin_anotherBtn.selected = YES;
             }
            NSLog(@"111=%@",obj);
        }
        if (spf_result.count==2) {
            NSString *obj1 = spf_result.firstObject;
            NSString *obj2 = spf_result.lastObject;
            NSInteger value1 = [obj1 integerValue];
            NSInteger value2 = [obj2 integerValue];
             if (value1==1||value2==1) {
                self.masterWin_normalBtn.selected = YES;
             }
             if (value1==2||value2==2) {
                self.equal_normalBtn.selected = YES;
             }
             if (value1==3||value2==3) {
                self.customerWin_normalBtn.selected = YES;
             }
             if (value1==4||value2==4) {
                self.masterWin_anotherBtn.selected = YES;
             }
             if (value1==5||value2==5) {
                self.equal_anotherBtn.selected = YES;
             }
             if (value1==6||value2==6) {
                self.customerWin_anotherBtn.selected = YES;
             }
        }
        
        self.masterView.hidden = model.home_rate.count==0?YES:NO;
        self.anotherView.hidden = model.away_rate.count==0?YES:NO;
        
        if (model.home_rate.count>0&&model.away_rate.count>0) {
            [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(AUTO(30));
            }];
            [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
                make.height.mas_equalTo(AUTO(30));
                make.bottom.offset(AUTO(-10));
            }];
        }
        
        if (model.home_rate.count>0&&model.away_rate.count==0) {
            [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
                make.height.mas_equalTo(AUTO(30));
                
            }];
            [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
                make.bottom.offset(0);
            }];
        }
        if (model.home_rate.count==0&&model.away_rate.count>0) {
            [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.masterView.mas_bottom).offset(0);
                make.height.mas_equalTo(0);
            }];
            [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.masterView.mas_bottom).offset(0);
                make.height.mas_equalTo(AUTO(30));
                make.bottom.offset(AUTO(-10));
                
            }];
        }
    
}


- (void)setTipModel:(JCJingCaiResultMatchModel *)tipModel {
    _tipModel = tipModel;
    
    NSString *title = [NSString stringWithFormat:@"%@ | %@ ",tipModel.competition_name,tipModel.match_future_time];
    if (tipModel.issue_num.length>0) {
     title = [NSString stringWithFormat:@"%@ | %@ | %@ ",tipModel.competition_name,NonNil(tipModel.issue_num),tipModel.match_future_time];
    }
    if (tipModel.competition_name.length>0) {
            NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange eventRange = [title rangeOfString:tipModel.competition_name];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:COLOR_4A90E2 range:eventRange];
        self.titleLab.attributedText = attrTitle;
        
    }else{
        self.titleLab.text = title;
    }
    
    self.infoLab.text = @"VS";
//    if (tipModel.wl>0&&tipModel.wl<5) {
//        if (tipModel.match_info.home_scores.count>0&&tipModel.match_info.away_scores.count>0) {
//            NSString *home = [NSString stringWithFormat:@"%@",tipModel.match_info.home_scores.firstObject];
//            NSString *away = [NSString stringWithFormat:@"%@",tipModel.match_info.away_scores.firstObject];
//            self.infoLab.text = [NSString stringWithFormat:@"%@ : %@",home,away];
//            self.infoLab.textColor = JCBaseColor;
//        }else {
//            self.infoLab.text = @"VS";
//            self.infoLab.textColor = COLOR_333333;
//        }
//       
//    }else{
//        self.infoLab.text = @"VS";
//        self.infoLab.textColor = COLOR_333333;
//    }
    
    
    self.masterNameLab.text = tipModel.home_team_name;
    self.customerNameLab.text = tipModel.away_team_name;
    
    //主赔
    NSString *noRq_rq = @"";
    NSString *noRq_win = @"";
    NSString *noRq_eqal = @"";
    NSString *noRq_lose = @"";
    //让球赔率
    NSString *rq_rq = @"";
    NSString *rq_win = @"";
    NSString *rq_eqal = @"";
    NSString *rq_lose = @"";

    
    tipModel.home_rate = [tipModel.odds_spf componentsSeparatedByString:@","];
    tipModel.away_rate = [tipModel.odds_rq componentsSeparatedByString:@","];
    
    if (tipModel.home_rate.count==3) {
        //如果只有3个,则旧数据少了个非让球
        NSMutableArray *array = [NSMutableArray arrayWithArray:tipModel.home_rate];
        [array insertObject:@"0" atIndex:0];
        tipModel.home_rate = [NSArray arrayWithArray:array];
    }
    if (tipModel.away_rate.count==3) {
        //如果只有3个,则旧数据少了个让球
        NSMutableArray *array = [NSMutableArray arrayWithArray:tipModel.away_rate];
        [array insertObject:@"0" atIndex:0];
        tipModel.away_rate = [NSArray arrayWithArray:array];
    }


    if (tipModel.home_rate.count>=4) {
        noRq_rq = tipModel.home_rate.firstObject;
        noRq_win = tipModel.home_rate[1];
        noRq_eqal = tipModel.home_rate[2];
        noRq_lose = tipModel.home_rate[3];
    }
    if (tipModel.away_rate.count>=4) {
        rq_rq = tipModel.away_rate.firstObject;
        rq_win = tipModel.away_rate[1];
        rq_eqal = tipModel.away_rate[2];
        rq_lose = tipModel.away_rate[3];
    }
    
    
    
    
    self.normalInfoLab.text = noRq_rq;
    
    if ([rq_rq intValue]>0) {
        NSString *title = [NSString stringWithFormat:@"%@",rq_rq];
        self.anotherInfoLab.textColor = JCBaseColor;
        self.anotherInfoLab.text = title;
    }else{
        self.anotherInfoLab.textColor = COLOR_666666;
        self.anotherInfoLab.text = rq_rq;
    }

        if (noRq_win.length==0) {
            [self.masterWin_normalBtn setTitle:@"-" forState:0];
        }else{
            [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜 %@",noRq_win] forState:0];
        }
        if (noRq_eqal.length==0) {
            [self.equal_normalBtn setTitle:@"-" forState:0];
        }else{
            [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"平 %@",noRq_eqal] forState:0];

        }
        if (noRq_lose.length==0) {
            [self.customerWin_normalBtn setTitle:@"-" forState:0];
        }else{
            [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜 %@",noRq_lose] forState:0];
        }
        if (rq_win.length==0) {
            [self.masterWin_anotherBtn setTitle:@"-" forState:0];
        }else{
            [self.masterWin_anotherBtn setTitle:[NSString stringWithFormat:@"主胜 %@",rq_win] forState:0];
        }
        if (rq_eqal.length==0) {
            [self.equal_anotherBtn setTitle:@"-" forState:0];
        }else{
            [self.equal_anotherBtn setTitle:[NSString stringWithFormat:@"平 %@",rq_eqal] forState:0];
        }
        if (rq_lose.length==0) {
            [self.customerWin_anotherBtn setTitle:@"-" forState:0];
        }else{
            [self.customerWin_anotherBtn setTitle:[NSString stringWithFormat:@"客胜 %@",rq_lose] forState:0];
        }
    

    
    self.resultImgView.hidden = YES;
    self.statusImgView.hidden = YES;
    if (tipModel.wl==1||tipModel.wl==3) {
        self.resultImgView.hidden = NO;
        self.resultImgView.image = JCIMAGE(@"yc_list_hong");

    }
    if (tipModel.wl==2||tipModel.wl==4) {
        self.resultImgView.hidden = NO;
        self.resultImgView.image = JCIMAGE(@"yc_list_hei");

    }
    if (tipModel.wl==6) {
        self.resultImgView.hidden = NO;
        self.resultImgView.image = JCIMAGE(@"yc_list_yq");

    }
    if (tipModel.wl==7) {
        self.resultImgView.hidden = NO;
        self.resultImgView.image = JCIMAGE(@"yc_list_qx");

    }
    
    /*重置按钮的选中状态，避免复用问题*/
    self.masterWin_normalBtn.selected = NO;
    self.equal_normalBtn.selected = NO;
    self.customerWin_normalBtn.selected = NO;

    self.masterWin_anotherBtn.selected = NO;
    self.equal_anotherBtn.selected = NO;
    self.customerWin_anotherBtn.selected = NO;
    
    self.masterWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.equal_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.customerWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.masterWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.equal_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.customerWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    
    

        //用户选择的
    NSString *spf = (NSString *)tipModel.spf;
        NSArray *userSelectArray = [spf componentsSeparatedByString:@","];
        [userSelectArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSInteger value = [obj integerValue];
            if (value==1) {
               self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            }
            if (value==2) {
               self.equal_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            }
            if (value==3) {
               self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            }
            if (value==4) {
               self.masterWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
            }
            if (value==5) {
               self.equal_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
            }
            if (value==6) {
               self.customerWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
            }
        }];
    NSString *result = (NSString *)tipModel.spf_result;
    NSArray *spf_result_array = [result componentsSeparatedByString:@","];
//    [result componentsJoinedByString:@","];
    //开奖结果
    if (spf_result_array.count==1) {
        
        NSString *obj = spf_result_array.firstObject;
        
        NSInteger value = [obj integerValue];
         if (value==1) {
             self.masterWin_normalBtn.selected = YES;
         }
         if (value==2) {
            self.equal_normalBtn.selected = YES;
         }
         if (value==3) {
            self.customerWin_normalBtn.selected = YES;
         }
         if (value==4) {
            self.masterWin_anotherBtn.selected = YES;
         }
         if (value==5) {
            self.equal_anotherBtn.selected = YES;
         }
         if (value==6) {
            self.customerWin_anotherBtn.selected = YES;
         }
        NSLog(@"111=%@",obj);
    }
    if (spf_result_array.count==2) {
        NSString *obj1 = spf_result_array.firstObject;
        NSString *obj2 = spf_result_array.lastObject;
        NSInteger value1 = [obj1 integerValue];
        NSInteger value2 = [obj2 integerValue];
         if (value1==1||value2==1) {
            self.masterWin_normalBtn.selected = YES;
         }
         if (value1==2||value2==2) {
            self.equal_normalBtn.selected = YES;
         }
         if (value1==3||value2==3) {
            self.customerWin_normalBtn.selected = YES;
         }
         if (value1==4||value2==4) {
            self.masterWin_anotherBtn.selected = YES;
         }
         if (value1==5||value2==5) {
            self.equal_anotherBtn.selected = YES;
         }
         if (value1==6||value2==6) {
            self.customerWin_anotherBtn.selected = YES;
         }
    }

    
    self.masterView.hidden = tipModel.home_rate.count==0?YES:NO;
    self.anotherView.hidden = tipModel.away_rate.count==0?YES:NO;
    
    if (tipModel.home_rate.count>0&&tipModel.away_rate.count>0) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(AUTO(30));
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(30));
            make.bottom.offset(AUTO(-10));
        }];
    }
    
    if (tipModel.home_rate.count>0&&tipModel.away_rate.count==0) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(30));
            
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
            make.bottom.offset(0);
        }];
    }
    if (tipModel.home_rate.count==0&&tipModel.away_rate.count>0) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(0);
            make.height.mas_equalTo(0);
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(0);
            make.height.mas_equalTo(AUTO(30));
            make.bottom.offset(AUTO(-10));
            
        }];
    }
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"VS" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _infoLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
        
    }
    return _infoLab;
}


-  (UIImageView *)masterImgView {
    if (!_masterImgView) {
        _masterImgView = [UIImageView new];
        _masterImgView.backgroundColor = COLOR_F6F6F6;
        _masterImgView.contentMode = UIViewContentModeScaleAspectFill;
        _masterImgView.clipsToBounds = YES;
    }
    return _masterImgView;
}

-  (UIImageView *)customerImgView {
    if (!_customerImgView) {
        _customerImgView = [UIImageView new];
         _customerImgView.backgroundColor = COLOR_F6F6F6;
        _customerImgView.contentMode = UIViewContentModeScaleAspectFill;
        _customerImgView.clipsToBounds = YES;
    }
    return _customerImgView;
}

- (UILabel *)masterNameLab {
    if (!_masterNameLab) {
//        COLOR_333333
        _masterNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        _masterNameLab.numberOfLines = 2;
        _masterNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
    }
    return _masterNameLab;
}

- (UILabel *)customerNameLab {
    if (!_customerNameLab) {
        _customerNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentLeft];
        _customerNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
        _customerNameLab.numberOfLines = 2;
    }
    return _customerNameLab;
}

- (UILabel *)normalInfoLab {
    if (!_normalInfoLab) {
        _normalInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _normalInfoLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _normalInfoLab.layer.borderWidth = 1;
        _normalInfoLab.layer.cornerRadius = AUTO(14);
        _normalInfoLab.layer.masksToBounds= YES;
    }
    return _normalInfoLab;
}

- (JCJingCaiBtn *)masterWin_normalBtn {
    if (!_masterWin_normalBtn) {
        _masterWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _masterWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _masterWin_normalBtn.layer.borderWidth = 1;
        _masterWin_normalBtn.layer.cornerRadius = AUTO(14);
        _masterWin_normalBtn.layer.masksToBounds= YES;
//        [_masterWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_masterWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_masterWin_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_masterWin_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_masterWin_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _masterWin_normalBtn.spf = @"1";
        _masterWin_normalBtn.userInteractionEnabled = NO;
        
    }
    return _masterWin_normalBtn;
}



- (JCJingCaiBtn *)equal_normalBtn {
    if (!_equal_normalBtn) {
        _equal_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _equal_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _equal_normalBtn.layer.borderWidth = 1;
        _equal_normalBtn.layer.cornerRadius = AUTO(14);
        _equal_normalBtn.layer.masksToBounds= YES;
//        [_equal_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_equal_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_equal_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_equal_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_equal_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _equal_normalBtn.spf = @"2";
        _equal_normalBtn.userInteractionEnabled = NO;
    }
    return _equal_normalBtn;
}

- (JCJingCaiBtn *)customerWin_normalBtn {
    if (!_customerWin_normalBtn) {
        _customerWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _customerWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _customerWin_normalBtn.layer.borderWidth = 1;
        _customerWin_normalBtn.layer.cornerRadius = AUTO(14);
        _customerWin_normalBtn.layer.masksToBounds= YES;
//        [_customerWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_customerWin_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_customerWin_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_customerWin_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _customerWin_normalBtn.spf = @"3";
        _customerWin_normalBtn.userInteractionEnabled = NO;
    }
    return _customerWin_normalBtn;
}

- (UILabel *)anotherInfoLab {
    if (!_anotherInfoLab) {
        _anotherInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _anotherInfoLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _anotherInfoLab.layer.borderWidth = 1;
        _anotherInfoLab.layer.cornerRadius = AUTO(14);
        _anotherInfoLab.layer.masksToBounds= YES;
    }
    return _anotherInfoLab;
}

- (JCJingCaiBtn *)masterWin_anotherBtn {
    if (!_masterWin_anotherBtn) {
        _masterWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _masterWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _masterWin_anotherBtn.layer.borderWidth = 1;
        _masterWin_anotherBtn.layer.cornerRadius = AUTO(14);
        _masterWin_anotherBtn.layer.masksToBounds= YES;
//         [_masterWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//         [_masterWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_masterWin_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_masterWin_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_masterWin_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _masterWin_anotherBtn.isRQ = YES;
        _masterWin_anotherBtn.spf = @"4";
        _masterWin_anotherBtn.userInteractionEnabled = NO;
    }
    return _masterWin_anotherBtn;
}

- (JCJingCaiBtn *)equal_anotherBtn {
    if (!_equal_anotherBtn) {
        _equal_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _equal_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _equal_anotherBtn.layer.borderWidth = 1;
        _equal_anotherBtn.layer.cornerRadius = AUTO(14);
        _equal_anotherBtn.layer.masksToBounds= YES;
//        [_equal_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//          [_equal_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_equal_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_equal_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_equal_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _equal_anotherBtn.isRQ = YES;
        _equal_anotherBtn.spf = @"5";
        _equal_anotherBtn.userInteractionEnabled = NO;
    }
    return _equal_anotherBtn;
}

- (JCJingCaiBtn *)customerWin_anotherBtn {
    if (!_customerWin_anotherBtn) {
        _customerWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _customerWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _customerWin_anotherBtn.layer.borderWidth = 1;
        _customerWin_anotherBtn.layer.cornerRadius = AUTO(14);
        _customerWin_anotherBtn.layer.masksToBounds= YES;
//        [_customerWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_customerWin_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_customerWin_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_customerWin_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _customerWin_anotherBtn.isRQ = YES;
        _customerWin_anotherBtn.spf = @"6";
        _customerWin_anotherBtn.userInteractionEnabled = NO;
    }
    return _customerWin_anotherBtn;
}

- (UIView *)masterView {
    if (!_masterView) {
        _masterView = [UIView new];
        _masterView.backgroundColor = JCClearColor;
//        _masterView.backgroundColor = [UIColor redColor];
    }
    return _masterView;
}


- (UIView *)anotherView {
    if (!_anotherView) {
        _anotherView = [UIView new];
        _anotherView.backgroundColor = JCClearColor;
    }
    return _anotherView;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
        _resultImgView.hidden = YES;
    }
    return _resultImgView;;
}

- (UIImageView *)statusImgView {
    if (!_statusImgView) {
        _statusImgView = [UIImageView new];
        _statusImgView.hidden = YES;
    }
    return _statusImgView;;
}





@end
