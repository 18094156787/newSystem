//
//  JCHomeMatchCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeMatchCollectionCell.h"

@implementation JCHomeMatchCollectionCell

- (void)initViews {
//    self.backgroundColor = JCBaseColor;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.timeLab);
        make.height.mas_equalTo(AUTO(16));
//        make.width.mas_equalTo(AUTO(38));
    }];
    
    [self addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(52));
    }];
    

    [self.backImgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.backImgView);
        make.width.mas_equalTo(AUTO(50));
    }];
    
    [self.backImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.homeLab.mas_left).offset(AUTO(-5));
//        make.centerY.equalTo(self.infoLab);
//        make.width.height.mas_equalTo(AUTO(28));
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
        make.height.mas_equalTo(AUTO(18));
        make.left.offset(AUTO(15));
    }];
    [self.backImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(18));
        make.right.offset(AUTO(-15));
    }];
    
}

- (void)setModel:(JCWMatchBall *)model {
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@ | %@",model.competition_name,model.match_long_time];
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeLab.text = model.home_team_name;
    self.awayLab.text = model.away_team_name;
//    model.matchCount = 5;
    if (model.plan_num>0) {
        self.countLab.text = [NSString stringWithFormat:@"%@个方案",model.plan_num];
    }else {
        self.countLab.text = @"";
    }
    self.countLab.hidden = [model.plan_num integerValue]==0?YES:NO;

}

- (UIView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIView new];
        _backImgView.backgroundColor = COLOR_002868;
        [_backImgView hg_setAllCornerWithCornerRadius:AUTO(5)];
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
        _infoLab = [UILabel initWithTitle:@"VS" andFont:18 andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        _homeImgView.backgroundColor = JCWhiteColor;
        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.backgroundColor = JCWhiteColor;
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_awayImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayImgView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayLab;
}

- (KKPaddingLabel *)countLab {
    if (!_countLab) {
        _countLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _countLab.layer.borderColor = JCBaseColor.CGColor;
        _countLab.layer.borderWidth = 1;
        _countLab.layer.cornerRadius = AUTO(8);
        _countLab.layer.masksToBounds = YES;
        _countLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    return _countLab;
}

@end
