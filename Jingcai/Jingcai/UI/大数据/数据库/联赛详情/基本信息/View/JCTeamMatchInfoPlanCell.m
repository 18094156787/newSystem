//
//  JCTeamMatchInfoPlanCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoPlanCell.h"

@implementation JCTeamMatchInfoPlanCell

- (void)initViews {
    self.userInteractionEnabled = YES;
    self.backgroundColor = JCWhiteColor;
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLab);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    
    [self.contentView addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(52));
    }];
    



    
    
    [self.backImgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backImgView);
        make.centerX.equalTo(self.backImgView);
        make.width.mas_equalTo(AUTO(55));
    }];
    
    [self.backImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.infoLab.mas_left);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.backImgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab.mas_right);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];

    
    [self.backImgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeImgView.mas_left).offset(AUTO(-5));
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(28));
        make.left.offset(AUTO(15));
    }];
    [self.backImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(28));
        make.right.offset(AUTO(-15));
    }];
    

    
    
}

- (void)setModel:(JCTeamMatchModel *)model {
    _model = model;
    self.timeLab.text = model.match_time;
    if (model.compeition_name.length>0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ | %@",model.compeition_name,model.match_time];
    }
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_info.logo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.homeImgView.backgroundColor = JCWhiteColor;
    }];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_info.logo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.awayImgView.backgroundColor = JCWhiteColor;
    }];
    self.homeLab.text = model.home_team_info.name_zh;
    self.awayLab.text = model.away_team_info.name_zh;
    
    self.infoLab.text = model.match_score.length>0?model.match_score:@"VS";
    if ([model.plan_num integerValue]>0) {
//        self.countLab.attributedText = [JCCommomTool textEdgeWithText:[NSString stringWithFormat:@"%@方案",model.fangan_count]];
        self.countLab.text = [NSString stringWithFormat:@"%@方案",model.plan_num];
        self.countLab.hidden = NO;
    }else{
        self.countLab.text = @"";
        self.countLab.hidden = YES;
    }
        
        
}

- (void)setTeamModel:(JCTeamMatchModel *)teamModel {
    _teamModel = teamModel;
    self.timeLab.text = teamModel.match_time;
    if (teamModel.compeition_name.length>0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ | %@",teamModel.compeition_name,teamModel.match_time];
    }
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:teamModel.home_team_logo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.homeImgView.backgroundColor = JCWhiteColor;
    }];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:teamModel.away_team_logo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.awayImgView.backgroundColor = JCWhiteColor;
    }];
    self.homeLab.text = teamModel.home_team_name;
    self.awayLab.text = teamModel.away_team_name;
    self.infoLab.text = teamModel.match_score.length>0?teamModel.match_score:@"VS";
    if ([teamModel.fangan_count integerValue]>0) {
//        self.countLab.attributedText = [JCCommomTool textEdgeWithText:[NSString stringWithFormat:@"%@方案",model.fangan_count]];
        self.countLab.text = [NSString stringWithFormat:@"%@方案",teamModel.fangan_count];
        self.countLab.hidden = NO;
    }else{
        self.countLab.text = @"";
        self.countLab.hidden = YES;
    }
}


- (UIView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.backgroundColor = COLOR_002868;
        [_backImgView hg_setAllCornerWithCornerRadius:AUTO(5)];
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:18 andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_awayImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayImgView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayLab;
}

- (KKPaddingLabel *)countLab {
    if (!_countLab) {
        _countLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _countLab.layer.borderColor = JCBaseColor.CGColor;
        _countLab.layer.borderWidth = 1;
        _countLab.layer.cornerRadius = AUTO(8);
        _countLab.layer.masksToBounds = YES;
        _countLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    return _countLab;
}

@end
