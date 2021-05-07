//
//  JCTeamMatchInfoMemberHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoMemberHeadView.h"

@implementation JCTeamMatchInfoMemberHeadView


- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(AUTO(90));
    }];
    
    [self addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.typeLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.offset(AUTO(-10));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.userLab];
    [self.userLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.rankLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.equalTo(self.countLab.mas_left);
        make.width.mas_equalTo(AUTO(100));
    }];
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"类别" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _typeLab;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"排名" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rankLab;
}

- (UILabel *)userLab {
    if (!_userLab) {
        _userLab = [UILabel initWithTitle:@"球员" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _userLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"球队" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _teamLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"总数" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

@end
