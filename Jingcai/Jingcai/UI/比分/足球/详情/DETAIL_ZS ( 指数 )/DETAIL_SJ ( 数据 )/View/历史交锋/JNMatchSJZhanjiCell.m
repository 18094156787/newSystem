//
//  JNMatchSJZhanjiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJZhanjiCell.h"

@implementation JNMatchSJZhanjiCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    
    float width = AUTO(80);
    

    
    [bgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.awayLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.scoreLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.homeLab.mas_left).offset(1);
    }];
}

- (void)setZjBall:(JNMatchZJBall *)zjBall {
    _zjBall = zjBall;
    self.timeLab.text = NonNil(zjBall.get_time);
    self.homeLab.text = NonNil(zjBall.home_name);
    self.awayLab.text = NonNil(zjBall.away_name);
    self.scoreLab.text =  NonNil(zjBall.score);
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
