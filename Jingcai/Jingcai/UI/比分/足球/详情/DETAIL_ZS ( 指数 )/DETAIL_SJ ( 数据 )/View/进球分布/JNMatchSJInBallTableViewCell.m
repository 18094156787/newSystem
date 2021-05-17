//
//  JNMatchSJInBallTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJInBallTableViewCell.h"
#import "JCMatchEnterBallModel.h"
@implementation JNMatchSJInBallTableViewCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.label90];
    [self.label90 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-7));
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
    }];
    
    [bgView addSubview:self.label75];
    [self.label75 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label90.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.label60];
    [self.label60 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label75.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.label45];
    [self.label45 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label60.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.label30];
    [self.label30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label45.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.label15];
    [self.label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label30.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.label00];
    [self.label00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.label15.mas_left).offset(AUTO(-16));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(24)));
        make.top.equalTo(self.label90);
    }];
    
    [bgView addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.offset(AUTO(24));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    [bgView addSubview:self.awayView];
    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.homeView.mas_bottom).offset(5);
        make.height.mas_equalTo(AUTO(35));
    }];
    
}

- (void)setHomeName:(NSString *)homeName {
    _homeName = homeName;
    self.homeView.nameLab.text = homeName;
}

- (void)setAwayName:(NSString *)awayName {
    _awayName = awayName;
    self.awayView.nameLab.text = awayName;
}

- (void)setHomeGoalArr:(NSArray *)homeGoalArr {
    _homeGoalArr = homeGoalArr;
    NSMutableArray * countArr = [NSMutableArray array];
    for (NSArray * array in homeGoalArr) {
        if (array.count>0) {
            [countArr addObject:array.firstObject];

        }
        
    }
    self.homeView.dataArray = countArr;
}

- (void)setAwayGoalArr:(NSArray *)awayGoalArr {
    _awayGoalArr = awayGoalArr;
    NSMutableArray * countArr = [NSMutableArray array];
    for (NSArray * array in awayGoalArr) {
        if (array.count>0) {
            [countArr addObject:array.firstObject];

        }
        
    }

    self.awayView.dataArray = countArr;
}

- (UILabel *)label00 {
    if (!_label00) {
        _label00 = [UILabel initWithTitle:@"00'" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label00;
}

- (UILabel *)label15 {
    if (!_label15) {
        _label15 = [UILabel initWithTitle:@"15'" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label15;
}

- (UILabel *)label30 {
    if (!_label30) {
        _label30 = [UILabel initWithTitle:@"30'" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label30;
}

- (UILabel *)label45 {
    if (!_label45) {
        _label45 = [UILabel initWithTitle:@"45'" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label45;
}

- (UILabel *)label60 {
    if (!_label60) {
        _label60 = [UILabel initWithTitle:@"60'" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label60;
}

- (UILabel *)label75 {
    if (!_label75) {
        _label75 = [UILabel initWithTitle:@"75'" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label75;
}

- (UILabel *)label90 {
    if (!_label90) {
        _label90 = [UILabel initWithTitle:@"90'" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label90;
}

- (JNMatchSJInBallItemView *)homeView {
    if (!_homeView) {
        _homeView = [JNMatchSJInBallItemView new];
        _homeView.isHome = YES;
    }
    return _homeView;
}

- (JNMatchSJInBallItemView *)awayView {
    if (!_awayView) {
        _awayView = [JNMatchSJInBallItemView new];
    }
    return _awayView;
}

@end
