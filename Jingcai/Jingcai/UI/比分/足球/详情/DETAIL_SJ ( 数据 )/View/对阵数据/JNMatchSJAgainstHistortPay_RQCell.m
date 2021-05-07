//
//  JNMatchSJAgainstHistortPay_RQCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstHistortPay_RQCell.h"

@implementation JNMatchSJAgainstHistortPay_RQCell


- (void)initViews {
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView);
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(12));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom);
//        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(23));
    }];
    
    [self addSubview:self.winRateLab];
    [self.winRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.winLab.mas_right).offset(AUTO(5));
        make.top.equalTo(self.winLab);
        make.height.mas_equalTo(AUTO(23));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.winLab.mas_bottom);
//        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(23));
    }];
    
    [self addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loseLab.mas_right).offset(AUTO(5));
        make.top.equalTo(self.loseLab);
        make.height.mas_equalTo(AUTO(23));
    }];
    
    [self addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.height.mas_equalTo(AUTO(27));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.numberLab);
        make.top.equalTo(self.numberLab.mas_bottom);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}


- (void)setModel:(JCBigDataSimilarModel *)model {
    if (!model) {
        return;
    }
    _model= model;
    
    if (self.type==1) {
        self.iconImgView.image = JCIMAGE(@"ic_bigdata_rq");
        self.titleLab.text = [NSString stringWithFormat:@"让球(%@场)",model.match_count];
        self.typeLab.text = @"让球";
        self.numberLab.text = model.rq;
        self.winLab.text = [NSString stringWithFormat:@"主胜%@",model.win];
        self.loseLab.text = [NSString stringWithFormat:@"客胜%@",model.lose];
    }else{
        self.iconImgView.image = JCIMAGE(@"ic_bigdata_jqs");
        self.titleLab.text = [NSString stringWithFormat:@"进球数(%@场)",model.match_count];
        self.typeLab.text = @"进球数";
        self.numberLab.text = model.jqs;
        self.winLab.text = [NSString stringWithFormat:@"大球%@",model.win];
        self.loseLab.text = [NSString stringWithFormat:@"小球%@",model.lose];
    }

    
    self.winRateLab.text = [NSString stringWithFormat:@"占比%@%%",model.win_percent];
    self.loseRateLab.text = [NSString stringWithFormat:@"占比%@%%",model.lose_percent];
}



- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)winLab {
    if (!_winLab) {
        _winLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _winLab;
}

- (UILabel *)winRateLab {
    if (!_winRateLab) {
        _winRateLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _winRateLab;
}


- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseLab;
}

- (UILabel *)loseRateLab {
    if (!_loseRateLab) {
        _loseRateLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseRateLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(19) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLab;
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _typeLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}

@end
