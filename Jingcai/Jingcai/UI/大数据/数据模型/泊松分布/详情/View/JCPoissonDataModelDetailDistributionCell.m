//
//  JCPoissonDataModelDetailDistributionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailDistributionCell.h"

@implementation JCPoissonDataModelDetailDistributionCell

- (void)initViews {
    float width = (SCREEN_WIDTH-AUTO(32))/4.0f;
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(width);
    }];
    
    [self.contentView addSubview:self.oneLab];
    [self.oneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(width);
    }];
    
    [self.contentView addSubview:self.twoLab];
    [self.twoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oneLab.mas_right);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(width);
    }];
    
    [self.contentView addSubview:self.threeLab];
    [self.threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.twoLab.mas_right);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(width);
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (void)data {
    self.typeLab.text = @"比分";
    self.oneLab.text = @"19.9%\n1:0";
    self.twoLab.text = @"19.9%\n1:0";
    self.threeLab.text = @"19.9%\n1:0";
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _typeLab;
}

- (UILabel *)oneLab {
    if (!_oneLab) {
        _oneLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _oneLab.numberOfLines = 2;
    }
    return _oneLab;
}

- (UILabel *)twoLab {
    if (!_twoLab) {
        _twoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _twoLab.numberOfLines = 2;
    }
    return _twoLab;
}

- (UILabel *)threeLab {
    if (!_threeLab) {
        _threeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _threeLab.numberOfLines = 2;
    }
    return _threeLab;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    }
    return _lineView;
}

@end
