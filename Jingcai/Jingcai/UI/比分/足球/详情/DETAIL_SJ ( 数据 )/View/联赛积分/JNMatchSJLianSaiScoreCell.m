//
//  JNMatchSJLianSaiScoreCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJLianSaiScoreCell.h"

@implementation JNMatchSJLianSaiScoreCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(1);
    }];
    
    float width = (SCREEN_WIDTH-AUTO(150))/8.0f;
    
    [bgView addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.offset(0);
        make.width.mas_equalTo(AUTO(40));
    }];
    
    [bgView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.rateLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.scorelLab];
    [self.scorelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.rankLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.shiLab];
    [self.shiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.scorelLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.delLab];
    [self.delLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.shiLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    
    [bgView addSubview:self.loselLab];
    [self.loselLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.delLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    
    [bgView addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.loselLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    
    [bgView addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.equalLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    
    [bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.winLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    
    
    [bgView addSubview:self.quanChangLab];
    [self.quanChangLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.countLab.mas_left).offset(1);
        make.left.offset(0);
    }];



}

- (void)setTableBall:(JNMatchTableBall *)tableBall {
    _tableBall = tableBall;
    if (!tableBall) {
        return ;
    }
    self.quanChangLab.text = tableBall.title;
    self.countLab.text = NonNil(tableBall.played);
    self.winLab.text = NonNil(tableBall.won);
    self.equalLab.text = NonNil(tableBall.drawn);
    self.loselLab.text = NonNil(tableBall.lost);
    self.delLab.text = NonNil(tableBall.goals);
    self.shiLab.text = NonNil(tableBall.against);
    self.scorelLab.text = NonNil(tableBall.pts);
    self.rankLab.text = NonNil(tableBall.position);
    

    //计算胜率
    if ([tableBall.played floatValue] > 0) {
        CGFloat rate = [tableBall.won floatValue]/[tableBall.played floatValue];
        self.rateLab.text = [NSString stringWithFormat:@"%.0f%%",rate*100];
    }else {
        self.rateLab.text = @"0";
    }
}

- (UILabel *)quanChangLab {
    if (!_quanChangLab) {
        _quanChangLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _quanChangLab.layer.borderWidth = 1;
        _quanChangLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _quanChangLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _countLab.layer.borderWidth = 1;
        _countLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _countLab;
}



- (UILabel *)winLab {
    if (!_winLab) {
        _winLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _winLab.layer.borderWidth = 1;
        _winLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _winLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _equalLab.layer.borderWidth = 1;
        _equalLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _equalLab;
}

- (UILabel *)loselLab {
    if (!_loselLab) {
        _loselLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _loselLab.layer.borderWidth = 1;
        _loselLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _loselLab;
}

- (UILabel *)delLab {
    if (!_delLab) {
        _delLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _delLab.layer.borderWidth = 1;
        _delLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _delLab;
}

- (UILabel *)shiLab {
    if (!_shiLab) {
        _shiLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _shiLab.layer.borderWidth = 1;
        _shiLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _shiLab;
}

- (UILabel *)scorelLab {
    if (!_scorelLab) {
        _scorelLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _scorelLab.layer.borderWidth = 1;
        _scorelLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _scorelLab;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rankLab.layer.borderWidth = 1;
        _rankLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _rankLab;
}

- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rateLab.layer.borderWidth = 1;
        _rateLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _rateLab;
}

@end
