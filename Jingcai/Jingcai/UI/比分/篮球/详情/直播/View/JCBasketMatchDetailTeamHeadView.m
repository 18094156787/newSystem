//
//  JCBasketMatchDetailTeamHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketMatchDetailTeamHeadView.h"

@implementation JCBasketMatchDetailTeamHeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
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
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _teamLab.layer.borderWidth = 1;
        _teamLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _teamLab;
}

- (UILabel *)sectionOneLab {
    if (!_sectionOneLab) {
        _sectionOneLab = [UILabel initWithTitle:@"一" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sectionOneLab.layer.borderWidth = 1;
        _sectionOneLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionOneLab;
}

- (UILabel *)sectionTwoLab {
    if (!_sectionTwoLab) {
        _sectionTwoLab = [UILabel initWithTitle:@"二" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sectionTwoLab.layer.borderWidth = 1;
        _sectionTwoLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionTwoLab;
}

- (UILabel *)sectionThreeLab {
    if (!_sectionThreeLab) {
        _sectionThreeLab = [UILabel initWithTitle:@"三" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sectionThreeLab.layer.borderWidth = 1;
        _sectionThreeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionThreeLab;
}


- (UILabel *)sectionFourLab {
    if (!_sectionFourLab) {
        _sectionFourLab = [UILabel initWithTitle:@"四" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sectionFourLab.layer.borderWidth = 1;
        _sectionFourLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionFourLab;
}

- (UILabel *)sectionOTLab {
    if (!_sectionOTLab) {
        _sectionOTLab = [UILabel initWithTitle:@"OT" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sectionOTLab.layer.borderWidth = 1;
        _sectionOTLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sectionOTLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"总分" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _scoreLab.layer.borderWidth = 1;
        _scoreLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _scoreLab;
}


@end
