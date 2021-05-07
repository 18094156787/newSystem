//
//  JCTeamMatchInfoScoreLianSaiHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreLianSaiHeadView.h"

@implementation JCTeamMatchInfoScoreLianSaiHeadView

- (void)initViews {
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(AUTO(32));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = COLOR_FAFAFA;
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(AUTO(32));
    }];
    
    [bottomView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(18)));
    }];
    
    [bottomView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(18)));
    }];
    
    [bottomView addSubview:self.jsLab];
    [self.jsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.scoreLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(18)));
    }];
    
    [bottomView addSubview:self.spfLab];
    [self.spfLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jsLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(18)));
    }];
    
    [bottomView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.spfLab.mas_left);
        make.centerX.equalTo(bottomView);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(18)));
    }];
    
    [bottomView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(18)));
    }];
}

- (void)data {

    self.rankLab.text = @"排名";
    self.scoreLab.text = @"积分";
    self.jsLab.text = @"进/失";
    self.spfLab.text = @"胜/平/负";
    self.numberLab.text = @"场次";
    self.teamLab.text = @"球队";
}

- (void)setShowTop:(BOOL)showTop {
    self.titleLab.hidden = !showTop;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rankLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _teamLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLab;
}

- (UILabel *)spfLab {
    if (!_spfLab) {
        _spfLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _spfLab;
}

- (UILabel *)jsLab {
    if (!_jsLab) {
        _jsLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jsLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:COLOR_002868 andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}
@end
