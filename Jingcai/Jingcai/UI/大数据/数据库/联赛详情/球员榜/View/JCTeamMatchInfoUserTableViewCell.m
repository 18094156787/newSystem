//
//  JCTeamMatchInfoUserTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoUserTableViewCell.h"

@implementation JCTeamMatchInfoUserTableViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;

    [self.contentView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.offset(AUTO(-10));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.userImgView];
    [self.userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.userLab];
    [self.userLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.userImgView.mas_right).offset(AUTO(3));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.equalTo(self.countLab.mas_left);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.teamImgView];
    [self.teamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.teamLab.mas_left).offset(AUTO(-3));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(24));
    }];
}

- (void)setModel:(JCEventScorePlayerModel *)model {
    _model = model;

    [self.userImgView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:JCIMAGE(@"ic_qy_default")];
    self.userLab.text = model.name_zh;
    [self.teamImgView sd_setImageWithURL:[NSURL URLWithString:model.team_logo] placeholderImage:JCIMAGE(@"icon_qd_zq_default")];
    self.teamLab.text= model.team_name_zh;
    self.countLab.text = model.num;

}



- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rankLab;
}

- (UILabel *)userLab {
    if (!_userLab) {
        _userLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _userLab.numberOfLines = 2;
    }
    return _userLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _teamLab.numberOfLines= 2;
    }
    return _teamLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"总数" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

- (UIImageView *)userImgView {
    if (!_userImgView) {
        _userImgView = [UIImageView new];
        [_userImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _userImgView;
}

- (UIImageView *)teamImgView {
    if (!_teamImgView) {
        _teamImgView = [UIImageView new];
        [_teamImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _teamImgView;
}

@end
