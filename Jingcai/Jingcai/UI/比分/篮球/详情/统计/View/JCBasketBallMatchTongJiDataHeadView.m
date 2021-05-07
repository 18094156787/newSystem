//
//  JCBasketBallMatchTongJiDataHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiDataHeadView.h"

@implementation JCBasketBallMatchTongJiDataHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.homeLineView];
    [self.homeLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(2), AUTO(16)));
    }];
    
    [self addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeLineView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_centerX);
    }];
    
    [self addSubview:self.awayLineView];
    [self.awayLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SCREEN_WIDTH-AUTO(10));
//        make.right.offset(AUTO(-8));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(2), AUTO(16)));
    }];
    
    [self addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLineView.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self);
//        make.left.equalTo(self.mas_centerX);
    }];
}



- (void)setMatchBall:(JCBasketBallMatchBall *)matchBall {
    _matchBall = matchBall;
    self.homeLab.text = NonNil(matchBall.away_team_name);
    self.awayLab.text = NonNil(matchBall.home_team_name);
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayLab;
}

- (UIView *)homeLineView {
    if (!_homeLineView) {
        _homeLineView = [UIView new];
        _homeLineView.backgroundColor = JCBaseColor;
    }
    return _homeLineView;
}

- (UIView *)awayLineView {
    if (!_awayLineView) {
        _awayLineView = [UIView new];
        _awayLineView.backgroundColor = COLOR_002868;
    }
    return _awayLineView;
}


@end
