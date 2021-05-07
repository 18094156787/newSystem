//
//  JCYCHomeRewardCycleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHomeRewardCycleCell.h"

@implementation JCYCHomeRewardCycleCell

- (void)initViews {
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.height.mas_equalTo(15);
    }];

    [self addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
    }];

    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tagLab.mas_right).offset(5);
        make.centerY.equalTo(self.tagLab);
    }];
    
//    [self data];
}


- (void)setModel:(JCTitleBannerModel *)model {
    _model = model;
    self.nameLab.text = model.user_name;
    //    self.infoLab.text = @"二串一8连红";
        self.tagLab.text = @"获得:";
    NSInteger prize = [model.total integerValue]/100;
    self.priceLab.text = [NSString stringWithFormat:@"%ld元现金红包",prize];
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_141416 andBackgroundColor:JCClearColor andTextAlignment:0];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _nameLab;;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_FE644D andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _infoLab;;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_141416 andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _tagLab;;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:0 andWeight:2 andTextColor:COLOR_FF3060 andBackgroundColor:JCClearColor andTextAlignment:0];
        _priceLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _priceLab;;
}

@end
