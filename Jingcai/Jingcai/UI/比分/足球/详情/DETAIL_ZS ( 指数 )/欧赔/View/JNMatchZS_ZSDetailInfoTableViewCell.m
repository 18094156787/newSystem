//
//  JNMatchZS_ZSDetailInfoTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_ZSDetailInfoTableViewCell.h"

@implementation JNMatchZS_ZSDetailInfoTableViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.windLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.equalLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.loseLab.mas_right);
        make.right.offset(0);
    }];


}

- (void)setModel:(JNMatchZS_PLInfoModel *)model {
    _model = model;
    self.windLab.text = model.home_winner;
    self.equalLab.text = model.draw;
    self.loseLab.text = model.away_winner;
    if (model.match_time.length>0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@'",model.match_time];
    }else {
        self.timeLab.text = [NSDate timeStringWithIntervalWithFormat:@"MM-dd HH:dd" time:[model.update_time doubleValue]];
    }
    
    self.windLab.textColor = model.win_color.length>0?[UIColor colorWithHexString:model.win_color]:COLOR_333333;
    self.loseLab.textColor = model.lose_color.length>0?[UIColor colorWithHexString:model.lose_color]:COLOR_333333;
    self.equalLab.textColor = model.equal_color.length>0?[UIColor colorWithHexString:model.equal_color]:COLOR_333333;
}


- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"平局" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"更新时间" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}


@end
