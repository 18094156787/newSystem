//
//  JCInviteFriendCycleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCInviteFriendCycleCell.h"

@implementation JCInviteFriendCycleCell
- (void)initViews {
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(0);
        make.height.mas_equalTo(20);
    }];

    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom).offset(10);
        make.centerX.equalTo(self);
    }];
    
//    [self data];
}


- (void)setModel:(JCTitleBannerModel *)model {
    _model = model;
    self.nameLab.text = model.name;
    self.priceLab.text = [NSString stringWithFormat:@"获得%@",model.content];
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    }
    return _nameLab;;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:0 andWeight:2 andTextColor:COLOR_FF3060 andBackgroundColor:JCClearColor andTextAlignment:0];
        _priceLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _priceLab;;
}
@end
