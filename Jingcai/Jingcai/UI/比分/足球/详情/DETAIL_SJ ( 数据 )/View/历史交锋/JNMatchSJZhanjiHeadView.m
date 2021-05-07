//
//  JNMatchSJZhanjiHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJZhanjiHeadView.h"

@implementation JNMatchSJZhanjiHeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(1);
    }];
    
    float width = AUTO(80);
    

    
    [bgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.awayLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.scoreLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.right.equalTo(self.homeLab.mas_left).offset(1);
    }];
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"日期" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.layer.borderWidth = 1;
        _timeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _timeLab;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"主队" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeLab.layer.borderWidth = 1;
        _homeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _homeLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"比分" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _scoreLab.layer.borderWidth = 1;
        _scoreLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _scoreLab;
}


- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"客队" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayLab.layer.borderWidth = 1;
        _awayLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _awayLab;
}

@end
