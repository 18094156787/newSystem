//
//  JCMathEnterGaolTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMathEnterGaolTipView.h"

@implementation JCMathEnterGaolTipView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(78));
    }];
    
    [self.bgImgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self.bgImgView);
        make.width.mas_equalTo(AUTO(42));
    }];
    
    [self.bgImgView addSubview:self.ballImgView];
    [self.ballImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(AUTO(50)));
        make.centerY.equalTo(self.bgImgView);
        make.width.height.mas_equalTo(AUTO(35));
    }];
    
    [self.bgImgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ballImgView.mas_right).offset(AUTO(7));
        make.top.equalTo(self.ballImgView).offset(AUTO(-2));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(18)));
    }];
    
    [self.bgImgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeNameLab);
        make.bottom.equalTo(self.ballImgView).offset(AUTO(2));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(18)));
    }];
    

    
    [self.bgImgView addSubview:self.settingScoreLab];
    [self.settingScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.right.offset(AUTO(-18  ));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(20)));
    }];
    
    [self.bgImgView addSubview:self.homeScoreLab];
    [self.homeScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.settingScoreLab.mas_left);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(40));
        
    }];
    
    [self.bgImgView addSubview:self.awayScoreLab];
    [self.awayScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.settingScoreLab.mas_left);
        make.centerY.equalTo(self.awayNameLab);
        make.width.mas_equalTo(AUTO(40));
    }];
    
//    [self.bgImgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.bgImgView);
//        make.right.offset(AUTO(-60));
//    }];
    
    WeakSelf;
    [self.settingScoreLab bk_whenTapped:^{
        
        if (weakSelf.JCGoalBall) {
            weakSelf.JCGoalBall();
        }
    }];
    
}
//- (void)data {
//    self.timeLab.text = @"12";
//    self.homeNameLab.text = @"121";
//    self.awayNameLab.text = @"555";
////        self.homeNameLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(12)];
//    //    self.awayNameLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(12)];
//        
//    self.homeScoreLab.text = @"5";
//    self.awayScoreLab.text = @"5";
//    self.homeNameLab.textColor = JCWhiteColor;
//    self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
//    self.homeScoreLab.textColor = JCWhiteColor;
//    self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
////    if ([model.position integerValue]==1) {
////        self.homeNameLab.textColor = JCWhiteColor;
////        self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
////        self.homeScoreLab.textColor = JCWhiteColor;
////        self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
////    }else{
////        self.homeNameLab.textColor = JCWhiteColor;
////        self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
////        self.homeScoreLab.textColor = JCWhiteColor;
////        self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
////    }
//}


- (void)setModel:(JCTipMatchInfoModel *)model {
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@'",model.goal_time];
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
//        self.homeNameLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(12)];
    //    self.awayNameLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(12)];
        
    self.homeScoreLab.text = model.home_score;
    self.awayScoreLab.text = model.away_score;
    if ([model.position integerValue]==1) {
        self.homeNameLab.textColor = JCWhiteColor;
        self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
        self.homeScoreLab.textColor = JCWhiteColor;
        self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
    }else{
        self.homeNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
        self.awayNameLab.textColor = JCWhiteColor;
        self.homeScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.5];
        self.awayScoreLab.textColor = JCWhiteColor;
    }
        
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image= JCIMAGE(@"img_jq_bg");
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UIImageView *)ballImgView {
    if (!_ballImgView) {
        _ballImgView = [UIImageView new];
        _ballImgView.image= JCIMAGE(@"icon-zuqiu");
    }
    return _ballImgView;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (UILabel *)homeScoreLab {
    if (!_homeScoreLab) {
        _homeScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeScoreLab;
}

- (UILabel *)awayScoreLab {
    if (!_awayScoreLab) {
        _awayScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayScoreLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"进球！" andFont:AUTO(16) andWeight:3 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)settingScoreLab {
    if (!_settingScoreLab) {
        _settingScoreLab = [UILabel initWithTitle:@"去设置" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _settingScoreLab.userInteractionEnabled = YES;
        [_settingScoreLab hg_setAllCornerWithCornerRadius:AUTO(10)];
    }
    return _settingScoreLab;
}


@end
