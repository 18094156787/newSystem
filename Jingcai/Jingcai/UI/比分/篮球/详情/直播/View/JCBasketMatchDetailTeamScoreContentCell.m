//
//  JCBasketMatchDetailTeamScoreContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketMatchDetailTeamScoreContentCell.h"

@implementation JCBasketMatchDetailTeamScoreContentCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(-1);
        make.bottom.offset(0);
    }];
    

    
    float width = (SCREEN_WIDTH-AUTO(30))/7.0f;
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sectionOTLab];
    [self.sectionOTLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.scoreLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sectionFourLab];
    [self.sectionFourLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sectionOTLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sectionThreeLab];
    [self.sectionThreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sectionFourLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sectionTwoLab];
    [self.sectionTwoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sectionThreeLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sectionOneLab];
    [self.sectionOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sectionTwoLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sectionOneLab.mas_left).offset(1);
    }];
    
    [self.viewArray addObject:self.sectionOneLab];
    [self.viewArray addObject:self.sectionTwoLab];
    [self.viewArray addObject:self.sectionThreeLab];
    [self.viewArray addObject:self.sectionFourLab];
    [self.viewArray addObject:self.sectionOTLab];
    [self.viewArray addObject:self.scoreLab];
}

- (void)setHomeFormModel:(JCBasketMatchDetailZBFormModel *)homeFormModel {
    _homeFormModel = homeFormModel;
    self.teamLab.text = homeFormModel.away_name;
//    self.scoreLab.text = away_score.away_score;
    if (homeFormModel.away_score.count<=self.viewArray.count) {
        for (int i=0; i<homeFormModel.away_score.count; i++) {
            UILabel *label = self.viewArray[i];
            NSString *text = homeFormModel.away_score[i];
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
    

}

- (void)setAwayFormModel:(JCBasketMatchDetailZBFormModel *)awayFormModel {
    _awayFormModel = awayFormModel;
    self.teamLab.text = awayFormModel.home_name;
//    self.scoreLab.text = awayFormModel.home_score;
    if (awayFormModel.home_score.count<=self.viewArray.count) {
        for (int i=0; i<awayFormModel.home_score.count; i++) {
            UILabel *label = self.viewArray[i];
            NSString *text = awayFormModel.home_score[i];
            label.text = [NSString stringWithFormat:@"%@",text];
        }
    }
}

//- (void)data {
//    self.teamLab.text = @"";
//    self.sectionOneLab.text = @"10";
//    self.sectionTwoLab.text = @"10";
//    self.sectionThreeLab.text = @"10";
//    self.sectionFourLab.text = @"10";
//    self.sectionOTLab.text = @"10";
//    self.scoreLab.text = @"10";
//
//}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _teamLab.layer.borderWidth = 1;
        _teamLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _teamLab;
}

- (UILabel *)sectionOneLab {
    if (!_sectionOneLab) {
        _sectionOneLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _sectionOneLab.layer.borderWidth = 1;
        _sectionOneLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionOneLab;
}

- (UILabel *)sectionTwoLab {
    if (!_sectionTwoLab) {
        _sectionTwoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _sectionTwoLab.layer.borderWidth = 1;
        _sectionTwoLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionTwoLab;
}

- (UILabel *)sectionThreeLab {
    if (!_sectionThreeLab) {
        _sectionThreeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _sectionThreeLab.layer.borderWidth = 1;
        _sectionThreeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionThreeLab;
}


- (UILabel *)sectionFourLab {
    if (!_sectionFourLab) {
        _sectionFourLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _sectionFourLab.layer.borderWidth = 1;
        _sectionFourLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionFourLab;
}

- (UILabel *)sectionOTLab {
    if (!_sectionOTLab) {
        _sectionOTLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _sectionOTLab.layer.borderWidth = 1;
        _sectionOTLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionOTLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _scoreLab.layer.borderWidth = 1;
        _scoreLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _scoreLab;
}

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

@end
