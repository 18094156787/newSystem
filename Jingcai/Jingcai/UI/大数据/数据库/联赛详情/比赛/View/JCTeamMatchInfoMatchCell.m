//
//  JCTeamMatchInfoMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoMatchCell.h"

@implementation JCTeamMatchInfoMatchCell

- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.bottom.offset(0);
    }];

    
    self.layerView = [[UIView alloc] init];
    self.layerView.userInteractionEnabled = YES;
 
    [self.bgView addSubview:self.layerView];
    [self.layerView hg_setCornerOnBottomWithRadius:4];
    
    [self.layerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    

    
    [self.bgView addSubview:self.planCountLab];
    [self.planCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self.bgView addSubview:self.planImgView];
    [self.planImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.planCountLab);
        make.right.equalTo(self.planCountLab.mas_left).offset(AUTO(-4));
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self.planCountLab);
    }];
    
    [self.bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.centerY.equalTo(self.planCountLab);
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self.bgView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusLab.mas_right);
        make.centerY.equalTo(self.statusLab);
        make.width.height.mas_equalTo(AUTO(15));
    }];

    
    [self.bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.statusLab.mas_bottom).offset(AUTO(15));
        make.width.mas_equalTo(AUTO(50));
        make.height.mas_equalTo(AUTO(12));
    }];
    
    [self.bgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.bgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_offset(0.5);
    }];
    
    [self.bgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.homeImgView.mas_left).offset(AUTO(-5));
        make.left.offset(AUTO(5));
    }];
    
    [self.bgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.awayImgView.mas_right).offset(AUTO(5));
        make.right.offset(AUTO(-5));
    }];
    [self.bgView addSubview:self.halfScoreLab];
    [self.halfScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.homeImgView.mas_bottom);
    }];
    
    [self.bgView addSubview:self.matchWeekLab];
    [self.matchWeekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.halfScoreLab);
        make.left.offset(AUTO(8));
    }];
    

}

- (void)setModel:(JCTeamMatchModel *)model {
    _model = model;

    
    self.timeLab.text = model.match_time;
    self.statusLab.text = model.match_status;
    self.matchWeekLab.text = model.round_num_one;
    if (model.match_status_color.length>0) {
        self.statusLab.textColor= [UIColor colorWithHexString:model.match_status_color];
    }else{
        self.statusLab.textColor= COLOR_999999;
    }
    if (model.status_id>1&&model.status_id<=8) {
        self.scoreLab.text= [NSString stringWithFormat:@"%@",model.score];
    }else{
        self.scoreLab.text= @"VS";
    }
    if (model.status_id>=3) {
       self.halfScoreLab.text = [NSString stringWithFormat:@"半场 %@",model.half_score];
    }else{
        self.halfScoreLab.text = @"";
    }
    
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo]];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo]];
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    

    if ([model.team_status integerValue]==0||model.team_status.length==0) {
        self.resultImgView.hidden = YES;
    }else{
        self.resultImgView.hidden = NO;
        if ([model.team_status integerValue]==1) {
            self.resultImgView.image = JCIMAGE(@"match_icon_jg_s");
        }
        if ([model.team_status integerValue]==2) {
            self.resultImgView.image = JCIMAGE(@"match_icon_jg_p");
        }
        if ([model.team_status integerValue]==3) {
            self.resultImgView.image = JCIMAGE(@"match_icon_jg_f");
        }
    }
}

- (void)data {
//    self.layerView.backgroundColor = JCBaseColor;

}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}


- (void)setIsCircle:(BOOL)isCircle {
    _isCircle = isCircle;

    self.layerView.hidden = isCircle;
    self.lineView.hidden = !isCircle;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2    andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}



- (UILabel *)planCountLab {
    if (!_planCountLab) {
        _planCountLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_FA6400 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _planCountLab;
}

- (UIImageView *)planImgView {
    if (!_planImgView) {
        _planImgView = [UIImageView new];
        _planImgView.image = JCIMAGE(@"icon_fa");
        _planImgView.hidden = YES;
    }
    return _planImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UILabel *)halfScoreLab {
    if (!_halfScoreLab) {
        _halfScoreLab =[UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _halfScoreLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
    }
    return _awayImgView;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}
- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
        _resultImgView.image = JCIMAGE(@"match_icon_jg_f");
    }
    return _resultImgView;
}
- (UILabel *)matchWeekLab {
    if (!_matchWeekLab) {
        _matchWeekLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchWeekLab;
}
@end
