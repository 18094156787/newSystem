//
//  JCKellyDataModelTrackCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKellyDataModelTrackCell.h"

@implementation JCKellyDataModelTrackCell

- (void)initViews {
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.winLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.equalLab.mas_right);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.zs_WinLab];
    [self.zs_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.loseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self addSubview:self.zs_EqualLab];
    [self.zs_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self addSubview:self.zs_LoseLab];
    [self.zs_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self addSubview:self.fc_WinLab];
    [self.fc_WinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.zs_WinLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    
    [self addSubview:self.fc_EqualLab];
    [self.fc_EqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.fc_WinLab.mas_right);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self addSubview:self.fc_LoseLab];
    [self.fc_LoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.fc_EqualLab.mas_right);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.fc_LoseLab.mas_right).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.rateLab.mas_right);
        make.right.offset(AUTO(-15));
    }];
    
}

- (void)data {
    self.winLab.text = @"3.78";
    self.equalLab.text = @"3.78";
    self.loseLab.text = @"3.78";
    self.rateLab.text = @"92.50%";
    self.timeLab.text = @"赛前10分钟";
    
    self.zs_WinLab.text = @"99.99";
    self.zs_EqualLab.text = @"18.00";
    self.zs_LoseLab.text = @"18.00";
    self.fc_WinLab.text = @"18.00";
    self.fc_EqualLab.text = @"18.00";
    self.fc_LoseLab.text = @"18.00";
}

- (UILabel *)winLab {
    if (!_winLab) {
        _winLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _winLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}


- (UILabel *)zs_WinLab {
    if (!_zs_WinLab) {
        _zs_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_WinLab;
}
- (UILabel *)zs_EqualLab {
    if (!_zs_EqualLab) {
        _zs_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_EqualLab;
}

- (UILabel *)zs_LoseLab {
    if (!_zs_LoseLab) {
        _zs_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _zs_LoseLab;
}


- (UILabel *)fc_WinLab {
    if (!_fc_WinLab) {
        _fc_WinLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_WinLab;
}

- (UILabel *)fc_EqualLab {
    if (!_fc_EqualLab) {
        _fc_EqualLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_EqualLab;
}

- (UILabel *)fc_LoseLab {
    if (!_fc_LoseLab) {
        _fc_LoseLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _fc_LoseLab;
}


- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

@end
