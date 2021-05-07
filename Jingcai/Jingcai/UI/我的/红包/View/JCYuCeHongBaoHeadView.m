//
//  JCYuCeHongBaoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoHeadView.h"

@implementation JCYuCeHongBaoHeadView

- (void)initViews {
    UILabel *label = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    self.moneyLabel= label;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(20));
    }];
    
    [self addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(AUTO(5));
        make.centerY.equalTo(label);
    }];
    
    UILabel *label1= [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyLab.mas_right).offset(AUTO(25));
        make.centerY.equalTo(label);
    }];
    self.countLabel = label1;

    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(AUTO(5));
        make.centerY.equalTo(label1);
    }];
    

    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (void)setType:(NSInteger)type {
    _type = type;

    if (type==2) {
        self.moneyLabel.text = @"累计免单金额：";
        self.countLabel.text = @"累计免单次数：";
    }
    if (type==3) {
        self.moneyLabel.text = @"累计优惠金额：";
        self.countLabel.text = @"累计优惠次数：";
    }
}



- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _moneyLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}
@end
