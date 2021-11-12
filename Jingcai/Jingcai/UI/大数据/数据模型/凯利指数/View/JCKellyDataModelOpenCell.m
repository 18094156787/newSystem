//
//  JCKellyDataModelOpenCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelOpenCell.h"

@implementation JCKellyDataModelOpenCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(8));
        make.bottom.offset(0);
//        make.bottom.offset(AUTO(-20));
//        make.height.mas_equalTo(100);
    }];
    
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchNameLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
//        make.bottom.offset(AUTO(-20));
        
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchTimeLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
       
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.matchNameLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(18));
        make.height.mas_equalTo(AUTO(25));
        make.width.mas_equalTo(AUTO(60));
        
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab);
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayTeamImgView.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
    }];
    
    [self.contentView addSubview:self.chuView];
    [self.chuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(70));
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.chuView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.jiView];
    [self.jiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(lineView1.mas_bottom).offset(0);
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(70));
    }];
    
    
    

    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.left.offset(AUTO(24));
        make.top.equalTo(self.jiView.mas_bottom).offset(0);
//        make.bottom.equalTo(self.contentView).offset(AUTO(-12));
    }];
    
    [self.contentView addSubview:self.zhishuLab];
    [self.zhishuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.historyLab.mas_bottom).offset(0);
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(40));
        make.bottom.offset(AUTO(-7));
    }];
    
    WeakSelf;
    [self.zhishuLab bk_whenTapped:^{
        weakSelf.trajectoryView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.trajectoryView];
        [weakSelf.trajectoryView show];
    }];
    
    
}

- (void)data {
//    self.bgView.backgroundColor = JCBaseColor;
//    self.matchNameLab.backgroundColor = JCBaseColor;
    self.matchNameLab.text = @"赛事名称";
    self.matchTimeLab.text = @"09-02 18:00";
    self.matchStatusLab.text = @"未";
    self.scoreLab.text = @"99 : 99";
    self.homeTeamLab.text = @"皇家马德里";
    self.awayTeamLab.text = @"皇家马德里";
    self.homeTeamImgView.backgroundColor = JCBaseColor;
    self.awayTeamImgView.backgroundColor = JCBaseColor;
    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JCIMAGE(@"away_placeholder")];
    

    self.historyLab.text = @"查询历史数据，找到相同初赔比赛100场，相同即赔比赛90场";
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:8];
    }
    return _bgView;
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)matchTimeLab {
    if (!_matchTimeLab) {
        _matchTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchTimeLab;
}

- (UILabel *)matchStatusLab {
    if (!_matchStatusLab) {
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchStatusLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];

    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayTeamLab;
}

- (UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        [_homeTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeTeamImgView;
}

- (UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        [_awayTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayTeamImgView;
}

- (JCKellyDataModelOpenRateView *)chuView {
    if (!_chuView) {
        _chuView = [JCKellyDataModelOpenRateView new];
    }
    return _chuView;
}

- (JCKellyDataModelOpenRateView *)jiView {
    if (!_jiView) {
        _jiView = [JCKellyDataModelOpenRateView new];
    }
    return _jiView;
}


- (KKPaddingLabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:UIColorFromRGB(0xF5F5F5) andTextAlignment:0];
        _historyLab.numberOfLines = 0;
        _historyLab.layer.cornerRadius = 4;
        _historyLab.layer.masksToBounds = YES;
        _historyLab.padding = UIEdgeInsetsMake(4, 8, 4, 8);
    }
    return _historyLab;
}

- (UILabel *)zhishuLab {
    if (!_zhishuLab) {
        _zhishuLab =[UILabel initWithTitle:@"指数变化轨迹" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _zhishuLab.userInteractionEnabled = YES;
    }
    return _zhishuLab;
}

- (JCKellyDataModelTrackView *)trajectoryView {
    if (!_trajectoryView) {
        _trajectoryView = [JCKellyDataModelTrackView new];
    }
    return _trajectoryView;
}
@end
