//
//  JCActivityGuess_SPF_CompleteMore_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_CompleteMore_Cell.h"

@implementation JCActivityGuess_SPF_CompleteMore_Cell

- (void)initViews {

    
//    UIView *bgView = [UIView new];
//    [self.contentView addSubview:bgView];
////    [bgView hg_setAllCornerWithCornerRadius:16];
//    bgView.backgroundColor = JCWhiteColor;
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
    
    
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-120));
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamLab.mas_bottom).offset(AUTO(4));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-120));
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
        make.bottom.offset(-15);
    }];
    
    [self.contentView addSubview:self.chooseLab];
    [self.chooseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(88, 36));
    }];
    
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    self.teamLab.text = [NSString stringWithFormat:@"%@ VS %@",detailModel.get_match_info.home_team.name_zh,detailModel.get_match_info.away_team.name_zh];

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
    self.infoLab.text = title;

    self.chooseLab.text = self.selectOptionModel.name;
}
- (void)setMatchModel:(JCActivityGuess_SPF_More_MatchModel *)matchModel {
    _matchModel = matchModel;
    self.teamLab.text = [NSString stringWithFormat:@"%@ VS %@",matchModel.home_team_name,matchModel.away_team_name];

    NSString *title = [NSString stringWithFormat:@"%@",matchModel.competition_name];
    if (matchModel.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" %@",matchModel.group_num_new];
    }
    if (matchModel.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@",matchModel.round_num_two];
    }

    if (matchModel.match_time.length>0) {
        title = [title stringByAppendingFormat:@" %@",[NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[matchModel.match_time doubleValue]]];
    }
    self.infoLab.text = title;
    
    for (int i=0; i<matchModel.activity_option_info.count; i++) {
        JCActivityOptionModel *model = matchModel.activity_option_info[i];
        if ([model.user_choice integerValue]==1) {
            self.chooseLab.text = model.name;
            break;
        }

    }

   
}


- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];

        _teamLab.numberOfLines = 0;
    }
    return _teamLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)chooseLab {
    if (!_chooseLab) {
        _chooseLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _chooseLab.layer.borderColor = JCBaseColor.CGColor;
        _chooseLab.layer.borderWidth = 1;
        _chooseLab.layer.cornerRadius = 4;
        _chooseLab.layer.masksToBounds = YES;
    }
    return _chooseLab;
}

@end
