//
//  JNMatchSJAgainstHistortPay_SPFCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstHistortPay_SPFCell.h"

@implementation JNMatchSJAgainstHistortPay_SPFCell

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
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.winRateLab];
    [self.winRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.winLab.mas_right).offset(AUTO(5));
        make.top.equalTo(self.winLab);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.eqalLab];
    [self.eqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.winLab.mas_bottom);
//        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.eqalRateLab];
    [self.eqalRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.eqalLab.mas_right).offset(AUTO(5));
        make.top.equalTo(self.eqalLab);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.eqalLab.mas_bottom);
//        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loseLab.mas_right).offset(AUTO(5));
        make.top.equalTo(self.loseLab);
        make.height.mas_equalTo(AUTO(20));
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
    
    self.iconImgView.image = JCIMAGE(@"ic_bigdata_sfp");
    self.titleLab.text = [NSString stringWithFormat:@"胜平负(%@场)",model.match_count];
    self.winLab.text = [NSString stringWithFormat:@"主胜%@",model.win];
    self.winRateLab.text = [NSString stringWithFormat:@"占比%@%%",model.win_percent];
    self.eqalLab.text = [NSString stringWithFormat:@"平%@",model.draw];
    self.eqalRateLab.text = [NSString stringWithFormat:@"占比%@%%",model.draw_percent];
    self.loseLab.text = [NSString stringWithFormat:@"客胜%@",model.lose];
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

- (UILabel *)eqalLab {
    if (!_eqalLab) {
        _eqalLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _eqalLab;
}

- (UILabel *)eqalRateLab {
    if (!_eqalRateLab) {
        _eqalRateLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _eqalRateLab;
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

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}
@end
