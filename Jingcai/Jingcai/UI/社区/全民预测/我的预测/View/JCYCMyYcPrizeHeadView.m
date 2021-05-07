//
//  JCYCMyYcPrizeHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcPrizeHeadView.h"

@implementation JCYCMyYcPrizeHeadView

- (void)initViews {
    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-12));
        make.top.offset(AUTO(15));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.priceLab.mas_left).offset(AUTO(-8));
        make.top.offset(AUTO(15));
    }];
}

- (void)setPrice:(NSString *)price {
    _price = price;
    if ([price floatValue]>0) {
        self.priceLab.text = [NSString stringWithFormat:@"%@元",price];
    }else{
        self.priceLab.text = @"0元";
    }
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"总计获得奖励" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"0元" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

@end
