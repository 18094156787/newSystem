//
//  JCActivityGuess_SPF_More_MatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_More_MatchCell.h"

@implementation JCActivityGuess_SPF_More_MatchCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(15), 8, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
        make.height.mas_equalTo(20);
        make.right.offset(-15);
    }];
    
    [bgView addSubview:self.qcImgView];
    [self.qcImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.titleLab.mas_bottom).offset(8);
        make.height.mas_equalTo(98);
    }];
    
    [self.qcImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.top.offset(18);
        make.width.height.mas_equalTo(40);
    }];
    
    [self.qcImgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(3);
        make.width.mas_equalTo(75);
        make.centerX.equalTo(self.homeImgView);
    }];
    
    
    [self.qcImgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-30);
        make.top.offset(18);
        make.width.height.mas_equalTo(40);
    }];
    
    [self.qcImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.awayImgView.mas_bottom).offset(3);
        make.width.mas_equalTo(75);
        make.centerX.equalTo(self.awayImgView);
    }];
    
    [self.qcImgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.homeImgView.mas_centerY);
        make.centerX.equalTo(self.qcImgView);
    }];
    
    [self.qcImgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusLab.mas_bottom);
        make.centerX.equalTo(self.qcImgView);
    }];
    
    [bgView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(8);
        make.right.offset(-8);
        make.width.height.mas_equalTo(56);
    }];
    
    [bgView addSubview:self.itemView];
    [self.itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.qcImgView.mas_bottom).offset(7);
        make.right.offset(-15);
        make.bottom.offset(0);
    }];
    
//    float width = (SCREEN_WIDTH-60-16)/3.0f;
//    [bgView addSubview:self.winBtn];
//    [self.winBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.qcImgView);
//        make.top.equalTo(self.qcImgView.mas_bottom).offset(7);
//        make.size.mas_equalTo(CGSizeMake(width, 36));
//    }];
//
//
//    [bgView addSubview:self.equalBtn];
//    [self.equalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(bgView);
//        make.top.equalTo(self.qcImgView.mas_bottom).offset(7);
//        make.size.mas_equalTo(CGSizeMake(width, 36));
//    }];
//
//    [bgView addSubview:self.loseBtn];
//    [self.loseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.qcImgView);
//        make.top.equalTo(self.qcImgView.mas_bottom).offset(7);
//        make.size.mas_equalTo(CGSizeMake(width, 36));
//    }];
//

    
}

- (void)buttonClick:(UIButton *)sender {
    if ([self.detailModel.active_state integerValue]==1) {
        [JCWToastTool showHint:@"活动还未开始哦~"];
        return;
    }
    if (self.detailModel.get_match_info.status_id!=1) {
        [JCWToastTool showHint:@"比赛已过期，无法提交！"];
        return;
    }
    
//    [JCWToastTool showHint:@"比赛已开始,无法提交!"];

    if ([self.detailModel.text_can_click integerValue]!=1) {
        return;
    }
    
    
    
    
    self.selectBtn.selected = NO;
    self.selectBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
    sender.selected = YES;
    if (sender.selected) {
        sender.layer.borderColor = JCBaseColor.CGColor;
    }
    self.selectBtn = sender;
    
    if (self.detailModel.activity_option.count>0) {
        JCActivityOptionModel *chooseModel = self.detailModel.activity_option[self.selectBtn.tag-100];
        if (self.JCSelectBlock) {
            self.JCSelectBlock(chooseModel);
        }
        
    }
    
    

//    self.chooseImgView.frame = CGRectMake(0, 0, 44, 36);
//    [self.selectBtn addSubview:self.chooseImgView];
    
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    
    
    if (self.itemView.subviews.count==0&&detailModel.activity_option.count>0) {
        float width = (SCREEN_WIDTH-60-8*(detailModel.activity_option.count-1))/detailModel.activity_option.count;
        for (int i=0; i<detailModel.activity_option.count; i++) {
            JCActivityOptionModel *model = detailModel.activity_option[i];
            UIButton *button = [UIButton initWithText:model.name FontSize:16 Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
            button.layer.borderColor = COLOR_9F9F9F.CGColor;
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.layer.borderWidth = 1;
            button.layer.cornerRadius = 4;
            button.layer.masksToBounds = YES;
            [button setTitleColor:JCBaseColor forState:UIControlStateSelected];
            button.tag = 100+i;
            [self.itemView addSubview:button];
            button.frame = CGRectMake((width+8)*i, 0, width, 36);
            
            if ([model.correct integerValue]==1) {
//                button.selected = YES;
                self.rightImgView.frame = CGRectMake(width-16, 20, 16, 16);
                [button addSubview:self.rightImgView];

            }else{
                
            }
            
            if ([model.user_choice integerValue]==1) {
                self.selectBtn.selected = NO;
                button.selected = YES;
                self.chooseImgView.frame = CGRectMake(0, 0, 44, 36);
                [button addSubview:self.chooseImgView];
                self.selectBtn = button;
                button.layer.borderColor = JCBaseColor.CGColor;
            }else{
                button.layer.borderColor = COLOR_9F9F9F.CGColor;
            }


            [self.btnArray addObject:button];

        }
        
        if ([self.detailModel.is_participate integerValue]==1) {
//                self.resultImgView.hidden = NO;
            if (self.detailModel.is_guess==1) {
                self.resultImgView.image = JCIMAGE(@"ic_spf_hong");
                self.resultImgView.hidden = NO;
            }else if (self.detailModel.is_guess==2) {
                self.resultImgView.image = JCIMAGE(@"ic_spf_hei");
                self.resultImgView.hidden = NO;
            }else{
                self.resultImgView.hidden = YES;
            }
        }else{
            self.resultImgView.hidden = YES;
        }



    }else{
        if (self.btnArray.count==self.detailModel.activity_option.count) {
            for (int i=0; i<self.detailModel.activity_option.count; i++) {
                JCActivityOptionModel *model = self.detailModel.activity_option[i];
                UIButton *btn = self.btnArray[i];
                if ([model.user_choice integerValue]) {
                    self.chooseImgView.frame = CGRectMake(0, 0, 44, 36);
                    [btn addSubview:self.chooseImgView];
                }
//                btn.selected = [model.user_choice integerValue]==1?YES:NO;

            }
        }
        
    }

    NSString *title = [NSString stringWithFormat:@"%@",detailModel.get_match_info.competition.short_name_zh];
    if (detailModel.get_match_info.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" %@",detailModel.get_match_info.group_num_new];
    }
    if (detailModel.get_match_info.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@",detailModel.get_match_info.round_num_two];
    }

    if (detailModel.get_match_info.match_time.length>0) {
        title = [title stringByAppendingFormat:@" %@",[NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[detailModel.get_match_info.match_time doubleValue]]];
    }
//    if (detailModel.get_match_info.group_num_new.length==0&&detailModel.get_match_info.round_num_two.length==0&&detailModel.get_match_info.round_num_one.length==0) {
//        title = [NSString stringWithFormat:@"%@",detailModel.get_match_info.competition.short_name_zh];
//    }
    self.titleLab.text = title;
    
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.get_match_info.home_team.logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.get_match_info.away_team.logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeLab.text = detailModel.get_match_info.home_team.name_zh;
    self.awayLab.text = detailModel.get_match_info.away_team.name_zh;
    self.statusLab.text = detailModel.get_match_info.status_cn;
    self.scoreLab.text = @"VS";
    if (detailModel.get_match_info.status_id>1&&detailModel.get_match_info.status_id<8) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@:%@",detailModel.get_match_info.home_all_score,detailModel.get_match_info.away_all_score];
        
        if ([detailModel.get_match_info.second_half_time floatValue]>0) {
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[detailModel.get_match_info.second_half_time floatValue];

            self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
//            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
        }else{
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[detailModel.get_match_info.first_half_time floatValue];
            if (distance<0) {
                distance = 0;
            }
            self.statusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
            
        }
        

        } else{
            if (detailModel.get_match_info.status_id==8) {
                self.scoreLab.text = [NSString stringWithFormat:@"%@:%@",detailModel.get_match_info.home_all_score,detailModel.get_match_info.away_all_score];
            }
            
       

    }
    

    

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)qcImgView {
    if (!_qcImgView) {
        _qcImgView = [UIImageView new];
        _qcImgView.image = JCIMAGE(@"jc_act_qc");
    }
    return _qcImgView;
}
- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_homeImgView hg_setAllCornerWithCornerRadius:20];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_awayImgView hg_setAllCornerWithCornerRadius:20];
    }
    return _awayImgView;
}
- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeLab.numberOfLines = 2;
    }
    return _homeLab;
}
- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayLab.numberOfLines = 2;
    }
    return _awayLab;
}
- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:26 andWeight:3 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
    }
    return _resultImgView;
}

- (UIImageView *)chooseImgView {
    if (!_chooseImgView) {
        _chooseImgView = [UIImageView new];
        _chooseImgView.image = JCIMAGE(@"ic_spf_choose");
        
    }
    return _chooseImgView;
}
- (UIImageView *)rightImgView {
    if (!_rightImgView) {
        _rightImgView = [UIImageView new];
        _rightImgView.image = JCIMAGE(@"ic_spf_right");
        
    }
    return _rightImgView;
}

- (UIView *)itemView {
    if (!_itemView) {
        _itemView = [UIView new];
    }
    return _itemView;
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

@end
